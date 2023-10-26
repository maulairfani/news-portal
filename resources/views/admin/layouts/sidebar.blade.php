<div class="navbar-bg"></div>
<!-- Navbar Start -->
@include('admin.layouts.navbar')
<!-- Navbar End -->

<div class="main-sidebar sidebar-style-2">
    <aside id="sidebar-wrapper">
        <div class="sidebar-brand">
            <a href="index.html">{{ __('admin.Stisla') }}</a>
        </div>
        <div class="sidebar-brand sidebar-brand-sm">
            <a href="index.html">{{ __('admin.St') }}</a>
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

            {{-- @if (canAccess(['advertisement index']))
                <li class="{{ setSidebarActive(['admin.ad.*']) }}"><a class="nav-link"
                        href="{{ route('admin.ad.index') }}"><i class="fas fa-ad"></i>
                        <span>{{ __('admin.Advertisement') }}</span></a></li>
            @endif --}}

            @if (canAccess(['home section index']))
                <li class="{{ setSidebarActive(['admin.home-section-setting.*']) }}"><a class="nav-link"
                        href="{{ route('admin.home-section-setting.index') }}"><i class="fas fa-wrench"></i>
                        <span>{{ __('admin.Home Section Setting') }}</span></a></li>
            @endif

            @if (canAccess(['access management index']))
                <li class="dropdown
                {{ setSidebarActive([
                    'admin.role.*',
                    'admin.role-users.*'
                    ]) }}
            ">
                    <a href="#" class="nav-link has-dropdown"><i class="fas fa-user-shield"></i>
                        <span>{{ __('admin.Access Management') }}</span></a>
                    <ul class="dropdown-menu">

                        <li class="{{ setSidebarActive(['admin.role-users.*']) }}"><a class="nav-link"
                                href="{{ route('admin.role-users.index') }}">{{ __('admin.Role Users') }}</a></li>

                        <li class="{{ setSidebarActive(['admin.role.*']) }}"><a class="nav-link"
                                href="{{ route('admin.role.index') }}">{{ __('admin.Roles and Permissions') }}</a></li>
                    </ul>
                </li>
            @endif
 
            {{-- <li><a class="nav-link" href="blank.html"><i class="far fa-square"></i> <span>Blank Page</span></a></li> --}}

            {{-- <li class="dropdown">
                <a href="#" class="nav-link has-dropdown"><i class="far fa-file-alt"></i> <span>Forms</span></a>
                <ul class="dropdown-menu">
                    <li><a class="nav-link" href="forms-advanced-form.html">Advanced Form</a></li>
                    <li><a class="nav-link" href="forms-editor.html">Editor</a></li>
                    <li><a class="nav-link" href="forms-validation.html">Validation</a></li>
                </ul>
            </li> --}}

        </ul>
    </aside>
</div>
