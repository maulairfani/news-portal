<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Mail\ContactMail;
// use App\Models\Ad;
use App\Models\Category;
use App\Models\Comment;
use App\Models\Contact;
use App\Models\HomeSectionSetting;
use App\Models\News;
use App\Models\RecivedMail;
use App\Models\SocialCount;
// use App\Models\SocialLink;
use App\Models\Subscriber;
use App\Models\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class HomeController extends Controller
{
    public function index()
    {
        $recentNews = News::with(['category', 'auther'])->activeEntries()->withLocalize()
            ->orderBy('id', 'DESC')->take(6)->get();
        $popularNews = News::with(['category'])->where('show_at_popular', 1)
            ->activeEntries()->withLocalize()
            ->orderBy('updated_at', 'DESC')->take(4)->get();

        $HomeSectionSetting = HomeSectionSetting::where('language', getLangauge())->first();

        if($HomeSectionSetting){
            $categorySectionOne = News::where('category_id', $HomeSectionSetting->category_section_one)
                ->activeEntries()->withLocalize()
                ->orderBy('id', 'DESC')
                ->take(8)
                ->get();

        $categorySectionTwo = News::where('category_id', $HomeSectionSetting->category_section_two)
            ->activeEntries()->withLocalize()
            ->orderBy('id', 'DESC')
            ->take(8)
            ->get();

        $categorySectionThree = News::where('category_id', $HomeSectionSetting->category_section_three)
            ->activeEntries()->withLocalize()
            ->orderBy('id', 'DESC')
            ->take(6)
            ->get();

        $categorySectionFour = News::where('category_id', $HomeSectionSetting->category_section_four)
            ->activeEntries()->withLocalize()
            ->orderBy('id', 'DESC')
            ->take(4)
            ->get();
        }else {
            $categorySectionOne = collect();
            $categorySectionTwo = collect();
            $categorySectionThree = collect();
            $categorySectionFour = collect();
        }


        $mostViewedPosts = News::activeEntries()->withLocalize()
            ->orderBy('views', 'DESC')
            ->take(3)
            ->get();

        // $socialCounts = SocialCount::where(['status' => 1, 'language' => getLangauge()])->get();

        // $mostCommonTags = $this->mostCommonTags();

        // $ad = Ad::first();

        return view('frontend.home', compact(
            'recentNews',
            'popularNews',
            'categorySectionOne',
            'categorySectionTwo',
            'categorySectionThree',
            'categorySectionFour'
        ));
    }

    public function ShowNews(string $slug)
    {


        $news = News::with(['auther', 'tags', 'comments'])->where('slug', $slug)
        ->activeEntries()->withLocalize()
        ->first();
        $news->increment('views');

        // Mengambil data likes
        $likes = $news->likes;

        $recentNews = News::with(['category', 'auther'])->where('slug','!=', $news->slug)
            ->activeEntries()->withLocalize()->orderBy('id', 'DESC')->take(4)->get();

        $mostCommonTags = $this->mostCommonTags();

        $nextPost = News::where('id', '>', $news->id)
            ->activeEntries()
            ->withLocalize()
            ->orderBy('id', 'asc')->first();

        $previousPost = News::where('id', '<', $news->id)
            ->activeEntries()
            ->withLocalize()
            ->orderBy('id', 'desc')->first();

        $relatedPosts = News::where('slug', '!=', $news->slug)
            ->where('category_id', $news->category_id)
            ->activeEntries()
            ->withLocalize()
            ->take(5)
            ->get();

        
       return view('frontend.news-details', compact('news', 'recentNews', 'nextPost', 'previousPost', 'relatedPosts', 'likes'));
    }

    public function news(Request $request)
    {

        $news = News::query();

        $news->when($request->has('tag'), function($query) use ($request){
            $query->whereHas('tags', function($query) use ($request){
                $query->where('name', $request->tag);
            });
        });

        $news->when($request->has('category') && !empty($request->category), function($query) use ($request) {
            $query->whereHas('category', function($query) use ($request) {
                $query->where('slug', $request->category);
            });
        });

        $news->when($request->has('search'), function($query) use ($request) {
            $query->where(function($query) use ($request){
                $query->where('title', 'like','%'.$request->search.'%')
                    ->orWhere('content', 'like','%'.$request->search.'%');
            });
        });
        
        $news->when($request->has('search') || $request->has('category'), function($query) use ($request) {
            $query->where(function($query) use ($request) {
                if ($request->has('category')) {
                    $query->whereHas('category', function($query) use ($request) {
                        $query->where('name', 'like', '%' . $request->category . '%');
                    });
                }
                
                if ($request->has('search')) {
                    $query->orWhere(function($query) use ($request) {
                        $query->where('title', 'like', '%' . $request->search . '%')
                            ->orWhere('content', 'like', '%' . $request->search . '%');
                    });
                }
            });
        });
        
        



        $news = $news->activeEntries()->withLocalize()->paginate(20);


        $recentNews = News::with(['category', 'auther'])
            ->activeEntries()->withLocalize()->orderBy('id', 'DESC')->take(4)->get();
        $mostCommonTags = $this->mostCommonTags();

        $categories = Category::where(['status' => 1, 'language' => getLangauge()])->get();

        return view('frontend.news', compact('news', 'recentNews', 'mostCommonTags', 'categories'));
    }

    public function countView($news)
    {
        if(session()->has('viewed_posts')){
            $postIds = session('viewed_posts');

            if(!in_array($news->id, $postIds)){
                $postIds[] = $news->id;
                $news->increment('views');
            }
            session(['viewed_posts' => $postIds]);

        }else {
            session(['viewed_posts' => [$news->id]]);

            $news->increment('views');

        }
    }

    public function like(Request $request)
    {
        $newsId = $request->input('newsId');
        $news = News::findOrFail($newsId);

        // Tingkatkan jumlah likes
        $news->increment('likes');

        // Mengembalikan respons
        return response()->json([
            'status' => 'success',
            'likes' => $news->likes,
        ]);
    }

    public function share($id)
    {
        $news = News::findOrFail($id);
        $news->increment('share');
    
        return response()->json(['success' => true, 'shareCount' => $news->share]);
    }

    public function mostCommonTags()
    {
        return Tag::select('name', \DB::raw('COUNT(*) as count'))
            ->where('language', getLangauge())
            ->groupBy('name')
            ->orderByDesc('count')
            ->take(15)
            ->get();
    }

    public function handleComment(Request $request)
    {

        $request->validate([
            'comment' => ['required', 'string', 'max:1000']
        ]);

        $comment = new Comment();
        $comment->news_id = $request->news_id;
        $comment->user_id = Auth::user()->id;
        $comment->parent_id = $request->parent_id;
        $comment->comment = $request->comment;
        $comment->save();
        toast(__('frontend.Comment added successfully!'), 'success');
        return redirect()->back();
    }

    public function handleReplay(Request $request)
    {

        $request->validate([
            'replay' => ['required', 'string', 'max:1000']
        ]);

        $comment = new Comment();
        $comment->news_id = $request->news_id;
        $comment->user_id = Auth::user()->id;
        $comment->parent_id = $request->parent_id;
        $comment->comment = $request->replay;
        $comment->save();
        toast(__('frontend.Comment added successfully!'), 'success');

        return redirect()->back();
    }

    public function commentDestory(Request $request)
    {
        $comment = Comment::findOrFail($request->id);
        if(Auth::user()->id === $comment->user_id){
            $comment->delete();
            return response(['status' => 'success', 'message' => __('frontend.Deleted Successfully!')]);
        }

        return response(['status' => 'error', 'message' => __('frontend.Someting went wrong!')]);
    }
}
