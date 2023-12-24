<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Language;
use App\Models\News;
use App\Models\Tag;
use App\Models\Insight;
use App\Models\Admin;
use App\Models\User;
use App\Models\FactNewsArticle;
use App\Models\DimCategory;
use Illuminate\Support\Facades\DB; 
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class InsightController extends Controller
{
    public function index()
    {
        $viewsData = News::orderBy('views', 'desc')->take(10)->get();
        $tagCountsData = Tag::select('name', Tag::raw('COUNT(*) as count'))
                    ->groupBy('name')
                    ->get();
        $newsLikesData = News::orderBy('likes', 'desc')->take(10)->get();
        $activeUsers = News::join('users', 'news.auther_id', '=', 'users.id')
                    ->select('news.auther_id', 'users.name', News::raw('SUM(news.likes) as total_likes'))
                    ->groupBy('auther_id', 'users.name')
                    ->get();

        $publishedNews = News::where(['status' => 1, 'is_approved' => 1])->count();
        $pendingNews = News::where(['status' => 1, 'is_approved' => 0])->count();
        $Categories = Category::count();
        $totalUser = User::count();

        $query = "
            SELECT 
                dim_category.CategoryName,
                result.PageViews AS PageViews,
                result.Likes AS Likes,
                result.Shares AS Shares
            FROM (
                SELECT
                    dim_category.ParentCategoryID,
                    SUM(fact_newsarticles.PageViews) AS PageViews,
                    SUM(fact_newsarticles.Likes) AS Likes,
                    SUM(fact_newsarticles.Shares) AS Shares
                FROM
                    fact_newsarticles
                JOIN dim_category ON fact_newsarticles.CategoryID = dim_category.CategoryID
                GROUP BY
                    dim_category.ParentCategoryID
            ) AS result
            JOIN dim_category ON result.ParentCategoryID = dim_category.CategoryID
        ";
        $factParentCategories = DB::select($query);
    
    
        $factCategories = FactNewsArticle::join('dim_category', 'fact_newsarticles.CategoryID', '=', 'dim_category.CategoryID')
                ->select(
                    'dim_category.CategoryName',
                    DB::raw('SUM(fact_newsarticles.PageViews) as PageViews'),
                    DB::raw('SUM(fact_newsarticles.Likes) as Likes'),
                    DB::raw('SUM(fact_newsarticles.Shares) as Shares')
                )
                ->groupBy('dim_category.CategoryName')
                ->take(3)
                ->get();
        
        $factTime = FactNewsArticle::select(
            DB::raw('DATE(PublishedDate) as PublishDate'),
            DB::raw('SUM(PageViews) as PageViews'),
            DB::raw('SUM(Likes) as Likes'),
            DB::raw('SUM(Shares) as Shares'),
        )
        ->groupBy('PublishDate')
        ->get();

        $factAuthors = FactNewsArticle::join('dim_author', 'fact_newsarticles.AuthorID', '=', 'dim_author.AuthorID')
        ->groupBy('dim_author.AuthorName')
        ->select(
            'dim_author.AuthorName',
            DB::raw('SUM(fact_newsarticles.PageViews) as PageViews'),
            DB::raw('SUM(fact_newsarticles.Likes) as Likes'),
            DB::raw('SUM(fact_newsarticles.Shares) as Shares')
        )
        ->get();


        return view('admin.insight.index', compact('viewsData', 'tagCountsData',
         'newsLikesData', 'activeUsers', 'publishedNews', 'pendingNews', 'Categories',
         'totalUser', 'factParentCategories', 'factCategories', 'factTime', 'factAuthors'));
    }
}