@extends('admin.layouts.master')

@section('content')
    <section class="section">
        <div class="section-header">
            <h1>{{ __('admin.News') }}</h1>
        </div>

        <div class="card card-primary">
            <div class="card-header">
                <h4>{{ __('admin.Update News') }}</h4>

            </div>
            <div class="card-body">
                <form action="{{ route('admin.news.update', $news->id) }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')

                    <div class="form-group">
                        <label for="">{{ __('admin.Category') }}</label>
                        <select name="category" id="category" class="form-control select2">
                            <option value="">--{{ __('admin.Select') }}---</option>
                            @foreach ($categories as $category)
                                <option {{ $category->id === $news->category_id ? 'selected' : '' }}
                                    value="{{ $category->id }}">{{ $category->name }}</option>
                            @endforeach
                        </select>
                        @error('category')
                            <p class="text-danger">{{ $message }}</p>
                        @enderror
                    </div>


                    <div class="form-group">
                        <label for="">{{ __('admin.Image') }}</label>
                        <div id="image-preview" class="image-preview">
                            <label for="image-upload" id="image-label">{{ __('admin.Choose File') }}</label>
                            <input type="file" name="image" id="image-upload">
                        </div>
                        @error('image')
                            <p class="text-danger">{{ $message }}</p>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="">{{ __('admin.Ttile') }}</label>
                        <input name="title" value="{{ $news->title }}" type="text" class="form-control"
                            id="name">
                        @error('title')
                            <p class="text-danger">{{ $message }}</p>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="">{{ __('admin.Content') }}</label>
                        <textarea name="content" class="summernote-simple">{{ $news->content }}</textarea>
                        @error('content')
                            <p class="text-danger">{{ $message }}</p>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label class="">{{ __('admin.Tags') }}</label>
                        <input name="tags" type="text"
                            value="{{ formatTags($news->tags()->pluck('name')->toArray()) }}"
                            class="form-control inputtags">
                        @error('tags')
                            <p class="text-danger">{{ $message }}</p>
                        @enderror
                    </div>

                    <div class="row">
                        
                        @if (canAccess(['news status', 'news all-access']))
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="control-label">{{ __('admin.Status') }}</div>
                                    <label class="custom-switch mt-2">
                                        <input {{ $news->status === 1 ? 'checked' : '' }} value="1" type="checkbox"
                                            name="status" class="custom-switch-input">
                                        <span class="custom-switch-indicator"></span>
                                    </label>
                                </div>
                            </div>
                      
                            <div class="col-md-3">

                                <div class="form-group">
                                    <div class="control-label">{{ __('admin.Show At Popular') }}</div>
                                    <label class="custom-switch mt-2">
                                        <input {{ $news->show_at_popular === 1 ? 'checked' : '' }} value="1"
                                            type="checkbox" name="show_at_popular" class="custom-switch-input">
                                        <span class="custom-switch-indicator"></span>
                                    </label>
                                </div>
                            </div>
                        @endif

                    </div>

                    <button type="submit" class="btn btn-primary">{{ __('admin.Update') }}</button>
                </form>
            </div>
        </div>
    </section>
@endsection

@push('scripts')
    <script>
        $(document).ready(function() {
            $('.image-preview').css({
                "background-image": "url({{ asset($news->image) }})",
                "background-size": "cover",
                "background-position": "center center"
            });

            $('#language-select').on('change', function() {
                let lang = $(this).val();
                $.ajax({
                    method: 'GET',
                    url: "{{ route('admin.fetch-news-category') }}",
                    data: {
                        lang: lang
                    },
                    success: function(data) {
                        $('#category').html("");
                        $('#category').html(
                            `<option value="">---{{ __('admin.Select') }}---</option>`);

                        $.each(data, function(index, data) {
                            $('#category').append(
                                `<option value="${data.id}">${data.name}</option>`)
                        })

                    },
                    error: function(error) {
                        console.log(error);
                    }
                })
            })
        })
    </script>
@endpush
