@extends('frontend.layouts.master')

@section('content')
<section>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <!-- breadcrumb -->
                <!-- Breadcrumb -->
                <ul class="breadcrumbs bg-light mb-4">
                    <li class="breadcrumbs__item">
                        <a href="{{ url('/') }}" class="breadcrumbs__url">
                            <i class="fa fa-home"></i> {{ __('frontend.Home') }}</a>
                    </li>
                    <li class="breadcrumbs__item">
                        <a href="javascript:;" class="breadcrumbs__url">{{ __('frontend.About') }}</a>
                    </li>

                </ul>
                <!-- End breadcrumb -->

                <div class="wrap__about-us">
                    <h1>Our Mission</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda et maiores rerum odit possimus consectetur alias id officia, voluptate consequatur, iure illum nemo ex praesentium iusto recusandae eveniet? Quod facere nam molestias magnam aliquam accusamus eligendi sapiente. Quam corporis ea, quasi omnis eaque perspiciatis illum architecto autem aliquam nam tempore, recusandae laboriosam qui nesciunt id commodi laudantium veritatis reprehenderit modi? Officia nemo voluptates quibusdam adipisci veniam quos distinctio ut illo omnis odit vitae ipsa optio cupiditate autem rem quidem blanditiis dolor placeat odio, neque dolorem incidunt aliquid dignissimos. Voluptatem iure corrupti ut voluptates ipsum. Vero incidunt culpa dicta ex in corrupti maxime consequuntur nulla nostrum id, harum labore voluptatibus illum provident temporibus. Beatae laborum eos non labore autem tenetur consequatur repellendus adipisci, quibusdam qui debitis, et illum? Laboriosam doloribus, odio sint voluptatem est libero fugiat temporibus provident dignissimos eos animi obcaecati, similique voluptas dolorum corporis voluptates cumque earum, illo molestiae! Sed repudiandae accusamus deserunt debitis doloribus neque enim, id culpa ea dolores dolor saepe itaque rem fugit. Quos, quisquam eveniet cupiditate magni corrupti exercitationem optio beatae nobis, voluptatem animi vel. Maiores laboriosam rem necessitatibus in eaque. Eum explicabo rerum tempore deleniti? Quod molestias voluptates praesentium at tempora suscipit eveniet excepturi!</p>
                </div>
            </div>


        </div>
    </div>
</section>
@endsection
