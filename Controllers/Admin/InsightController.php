<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Language;
use App\Models\News;
use App\Models\Insight;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class InsightController extends Controller
{
    public function index():View
    {
        $categoriesCount = Category::distinct()->count();

        return view('admin.insight.index', compact('categoriesCount'));
    }
}