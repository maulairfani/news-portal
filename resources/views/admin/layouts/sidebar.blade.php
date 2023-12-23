<div class="navbar-bg"></div>
<!-- Navbar Start -->
@include('admin.layouts.navbar')
<!-- Navbar End -->

<div class="main-sidebar sidebar-style-2">
    <aside id="sidebar-wrapper">
        <div class="sidebar-brand">
            <a href="index.html">Liputan7</a>
        </div>
        <ul class="sidebar-menu">
            <li class="menu-header">{{ __('admin.Dashboard') }}</li>
            <li class="active">
                <a href="{{ route('admin.dashboard') }}" class="nav-link"><i class="fas fa-fire"></i><span>{{ __('admin.Dashboard') }}</span></a>
            </li>
            <li class="menu-header">{{ __('admin.Starter') }}</li>

            @if (canAccess(['category index', 'category create', 'category udpate', 'category delete']))
                <li class="{{ setSidebarActive(['admin.category.*']) }}"><a class="nav-link"
                        href="{{ route('admin.category.index') }}"><i class="fas fa-list"></i>
                        <span>{{ __('admin.Category') }}</span></a></li>
            @endif

            @if (canAccess(['news index']))
                <li class="dropdown {{ setSidebarActive(['admin.news.*', 'admin.pending.news']) }}">
                    <a href="#" class="nav-link has-dropdown"><i class="fas fa-newspaper"></i>
                        <span>{{ __('admin.News') }}</span></a>
                    <ul class="dropdown-menu">
                        <li class="{{ setSidebarActive(['admin.news.*']) }}"><a class="nav-link"
                                href="{{ route('admin.news.index') }}">{{ __('admin.All News') }}</a></li>

                        <li class="{{ setSidebarActive(['admin.pending.news']) }}"><a class="nav-link"
                                href="{{ route('admin.pending.news') }}">{{ __('admin.Pending News') }}</a></li>

                    </ul>
                </li>
            @endif

            <li><a class="nav-link" href="{{ route('admin.insight.index') }}"><i class="fas fa-chart-bar"></i>
            <span>Insight</span></a></li>

            @if (canAccess(['home section index']))
                <li class="{{ setSidebarActive(['admin.home-section-setting.*']) }}"><a class="nav-link"
                        href="{{ route('admin.home-section-setting.index') }}"><i class="fas fa-wrench"></i>
                        <span>{{ __('admin.Home Section Setting') }}</span></a></li>
            @endif
                
        </ul>
    </aside>
</div>