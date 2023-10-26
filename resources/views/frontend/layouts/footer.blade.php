<section class="wrapper__section p-0">
    <div class="wrapper__section__components">
        <!-- Footer -->
        <footer>
            <div class="wrapper__footer bg__footer-dark pb-0">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="widget__footer">
                                <figure class="image-logo">
                                    <img src="{{ asset('frontend/assets/images/logo2.png') }}" alt="" class="logo-footer">
                                </figure>

                                <p>Selalu Terdepan dalam Memberikan Berita Terkini dan Terpercaya - Liputan7, Sumber Informasi Terpercaya.</p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="widget__footer">
                                <div class="dropdown-footer">
                                    <h4 class="footer-title">
                                        {{-- {{ @$footerGridOneTitle->value }} --}}
                                        Links
                                        <span class="fa fa-angle-down"></span>
                                    </h4>

                                </div>

                                <ul class="list-unstyled option-content is-hidden">

                                    {{-- @foreach ($footerGridOne as $gridOne)
                                    <li>
                                        <a href="{{ $gridOne->url }}">{{ $gridOne->name }}</a>
                                    </li>
                                    @endforeach --}}

                                    <li><a href={{ "login" }}>Login</a></li>
                                    <li><a href={{ "register" }}>Register</a></li>

                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="widget__footer">
                                <div class="dropdown-footer">
                                    <h4 class="footer-title">
                                        {{-- {{ @$footerGridTwoTitle->value }} --}}
                                        Kategori
                                        <span class="fa fa-angle-down"></span>
                                    </h4>

                                </div>
                                <ul class="list-unstyled option-content is-hidden">

                                    {{-- @foreach ($footerGridTwo as $gridTwo)
                                    <li>
                                        <a href="{{ $gridTwo->url }}">{{ $gridTwo->name }}</a>
                                    </li>
                                    @endforeach --}}

                                    @php
                                    $categories = DB::table('categories')->where('language', 'en')->get(); 
                                    $n_categories = DB::table('categories')->where('language', 'en')->get()->count(); 
                                    $count = 0
                                    @endphp
                                    @foreach($categories as $item)                                        
                                        @if ($count < ceil($n_categories / 2))
                                            <li>
                                                <a href="news?category={{ $item->slug }}">{{ $item->name }}</a>
                                            </li>
                                        @endif
                                        @php $count++ @endphp 
                                    @endforeach

                                </ul>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="widget__footer">
                                <div class="dropdown-footer">
                                    <h4 class="footer-title">
                                        {{-- {{ @$footerGridThreeTitle->value }} --}}
                                        <span class="fa fa-angle-down"></span>
                                    </h4>

                                </div>

                                <ul class="list-unstyled option-content is-hidden">
                                    @php $count =  ceil($n_categories / 2) @endphp
                                    @foreach($categories as $key => $item)
                                        @if ($key >= 4)
                                            <li>
                                                <a href="news?category={{ $item->slug }}">{{ $item->name }}</a>
                                            </li>
                                        @endif
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer bottom -->
            <div class="wrapper__footer-bottom bg__footer-dark">
                <div class="container ">
                    <div class="row">
                        <div class="col-md-12">

                        </div>
                    </div>
                </div>

            </div>
        </footer>
    </div>
</section>
