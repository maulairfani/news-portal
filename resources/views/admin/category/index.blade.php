@extends('admin.layouts.master')

@section('content')
    <section class="section">
        <div class="section-header">
            <h1>{{ __('admin.Categories') }}</h1>
        </div>

            <div class="card card-primary">
            <div class="card-header">
                <h4>{{ __('admin.All Categories') }}</h4>
                <div class="card-header-action">
                    <a href="{{ route('admin.category.create') }}" class="btn btn-primary">
                        <i class="fas fa-plus"></i> {{ __('admin.Create new') }}
                    </a>
                </div>
            </div>

            <div class="card-body">

                <div class="tab-content tab-bordered" id="myTab3Content">
                    @foreach ($languages as $language)
                        @php
                            $categories = \App\Models\Category::where('language', $language->lang)->orderByDesc('id')->get();
                        @endphp
                        <div class="tab-pane fade show {{ $loop->index === 0 ? 'active' : '' }}"
                            id="home-{{ $language->lang }}" role="tabpanel" aria-labelledby="home-tab2">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped" id="table-{{ $language->lang }}">
                                        <thead>
                                            <tr>
                                                <th class="text-center">
                                                    #
                                                </th>
                                                <th>Parent Category</th>
                                                <th>{{ __('admin.Name') }}</th>
                                                <th>{{ __('admin.In Nav') }}</th>
                                                <th>{{ __('admin.Status') }}</th>
                                                <th>{{ __('admin.Action') }}</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($categories as $category)
                                            @if ($category->parent_category_id)
                                                <tr>
                                                    <td>{{ $category->id }}</td>
                                                    <td>
                                                        @if ($category->parent_category_id)
                                                            @php
                                                                $parentIdToFilter = $category->parent_category_id;
                                                                $filteredCategories = collect($categories)->filter(function ($cat) use ($parentIdToFilter) {
                                                                    return $cat['id'] == $parentIdToFilter;
                                                                })->first();
                                                            @endphp
                                                            {{ $filteredCategories->name }}
                                                        @else
                                                            {{ __('admin.No Parent') }}
                                                        @endif
                                                    </td>
                                                    <td>{{ $category->name }}                                                </td>
                                                    <td>
                                                        @if ($category->show_at_nav == 1)
                                                            <span class="badge badge-primary">{{ __('admin.Yes') }}</span>
                                                        @else
                                                            <span class="badge badge-danger">{{ __('admin.No') }}</span>
                                                        @endif
                                                    </td>
                                                    <td>
                                                        @if ($category->status == 1)
                                                            <span class="badge badge-success">{{ __('admin.Yes') }}</span>
                                                        @else
                                                            <span class="badge badge-danger">{{ __('admin.No') }}</span>
                                                        @endif
                                                    </td>
                                                    <td>
                                                        <a href="{{ route('admin.category.edit', $category->id) }}" class="btn btn-primary"><i class="fas fa-edit"></i></a>
                                                        <a href="{{ route('admin.category.destroy', $category->id) }}" class="btn btn-danger delete-item"><i class="fas fa-trash-alt"></i></a>
                                                    </td>
                                                </tr>
                                            @endif
                                        @endforeach
                                        


                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    @endforeach

                </div>
            </div>


        </div>
    </section>
@endsection