<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Language;
use App\Models\News;
use App\Models\Tag;
use App\Models\Insight;
use App\Models\Admin;
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
        $authorLikes = News::join('admins', 'news.auther_id', '=', 'admins.id')
                    ->select('news.auther_id', 'admins.name', News::raw('SUM(news.likes) as total_likes'))
                    ->groupBy('auther_id', 'admins.name')
                    ->get();



        return view('admin.insight.index', compact('viewsData', 'tagCountsData', 'newsLikesData', 'authorLikes'));
    }
}