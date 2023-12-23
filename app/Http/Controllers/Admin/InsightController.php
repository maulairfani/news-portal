<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Language;
use App\Models\News;
use App\Models\Tag;
use App\Models\Insight;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class InsightController extends Controller
{
    public function index()
    {
        $viewsData = News::orderBy('views', 'desc')->take(10)->get();
        $tagCountsData = Tag::withCount('news')->get();

        return view('admin.insight.index', compact('viewsData', 'tagCountsData'));
    }
}