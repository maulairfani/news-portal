@extends('admin.layouts.master')

{{-- @php
    dd($factAuthors)
@endphp --}}

@section('content')
<section class="section">
    <div class="section-header">
        <h1>{{ __('admin.Insight') }}</h1>
    </div>

    {{-- Statistics --}}
    <div class="row">
        <div class="col-lg-3 col-md-6 col-sm-6 col-12">
            <div class="card card-statistic-1">
                <div class="card-icon bg-primary">
                    <i class="fas fa-newspaper"></i>
                </div>
                <div class="card-wrap">
                    <div class="card-header">
                        <h4>{{ __('admin.Total News') }}</h4>
                    </div>
                    <div class="card-body">
                        {{ $publishedNews }}
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-md-6 col-sm-6 col-12">
            <div class="card card-statistic-1">
                <div class="card-icon bg-danger">
                    <i class="far fa-newspaper"></i>
                </div>
                <div class="card-wrap">
                    <div class="card-header">
                        <h4>{{ __('admin.Pending News') }}</h4>
                    </div>
                    <div class="card-body">
                        {{ $pendingNews }}
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-md-6 col-sm-6 col-12">
            <div class="card card-statistic-1">
                <div class="card-icon bg-warning">
                    <i class="far fa-file"></i>
                </div>
                <div class="card-wrap">
                    <div class="card-header">
                        <h4>{{ __('admin.Total Categories') }}</h4>
                    </div>
                    <div class="card-body">
                        {{ $Categories }}
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-md-6 col-sm-6 col-12">
            <div class="card card-statistic-1">
                <div class="card-icon bg-success">
                    <i class="far fa-user"></i>
                </div>
                <div class="card-wrap">
                    <div class="card-header">
                        <h4>Total Users</h4>
                    </div>
                    <div class="card-body">
                        {{ $totalUser }}
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- Dropdown -->
    <div class="form-group mt-3">
        <label for="visualizationSelector">Choose Visualization</label>
        <select class="form-control" id="visualizationSelector">
            <option value="views">Top 10 News by Views</option>
            <option value="likes">Top 10 News by Likes</option>
        </select>
    </div>
    
    <div id="container_1" style="height: 400px;"></div>
    <div style="display: flex;">
        <div id="container_3" style="height: 400px; flex: 1; margin-right: 10px;"></div>
        <div id="container_4" style="height: 400px; flex: 1;"></div>
    </div>
    
    
    
    {{-- Visualisasi Fact News Article --}}
    <div class="form-group mt-3">
        <label for="dimensionSelector">Choose Dimension</label>
        <select class="form-control" id="dimensionSelector">
            <option value="category">Dim Category</option>
            <option value="time">Dim Time</option>
            <option value="author">Dim Author</option>
        </select>
    </div>
    
    <div id="containerWrapper">
        <div id="container_5" class="container" style="height: 235px;"></div>
        <div id="container_6" class="container" style="height: 200px;"></div>
        <div id="container_7" class="container" style="height: 200px;"></div>
    </div>

    <div id="container_8" style="height: 235px;" class="mt-5"></div>
    <div id="container_9" style="height: 200px;"></div>
    <div id="container_10" style="height: 200px;"></div>
    

    <script>
        function updateChart(selectedVisualization) {
            if (selectedVisualization === 'views') {
                var viewsData = @json($viewsData);

                var viewsChartData = viewsData.map(function(item) {
                    return { name: item.title, y: item.views }
                })

                Highcharts.chart('container_1', {
                    chart: {
                        type: 'bar'
                    },
                    title: {
                        text: 'Top 10 News by Views'
                    },
                    xAxis: {
                        categories: viewsData.map(function(item) {
                            return item.title;
                        })
                    },
                    yAxis: {
                        title: {
                            text: 'Views'
                        }
                    },
                    series: [{
                        name: 'Views',
                        data: viewsChartData,
                        color: '#8da0cb'
                    }]
                });

            } else if (selectedVisualization === 'likes') {
                var newsLikesData = @json($newsLikesData);
                var newsLikesChartData = newsLikesData.map(function(item){
                    return {name: item.title, y:item.likes}
                })

                Highcharts.chart('container_1', {
                    chart: {
                        type: 'bar'
                    },
                    title: {
                        text: 'Top 10 News by Likes'
                    },
                    xAxis: {
                        categories: newsLikesData.map(function(item) {
                            return item.title;
                        })
                    },
                    yAxis: {
                        title: {
                            text: 'Likes'
                        }
                    },
                    series: [{
                        name: 'Likes',
                        data: newsLikesChartData,
                        color: '#8da0cb'
                    }]
                });
            }
        }

        // Initial chart rendering
        updateChart('views');

        // Event listener for dropdown change
        document.getElementById('visualizationSelector').addEventListener('change', function () {
            var selectedVisualization = this.value;
            updateChart(selectedVisualization);
        });

        // Bar Chart Tag Counts
        var tagCountsData = @json($tagCountsData);
        var tagCountsChartData = tagCountsData.map(function(item) {
            return {name: item.name, y:item.count}
        });

        Highcharts.chart('container_3', {
            chart: {
                type: 'pie'
            },
            title: {
                text: 'Tag Counts'
            },
            series: [{
                name: 'Counts',
                data: tagCountsData.map(function(item) {
                    return { name: item.name, y: parseInt(item.count) };
                })
            }]
        });

        // Active Users
        var activeUsers = @json($activeUsers);
        var activeUsersChartData = activeUsers.map(function(item) {
            return {name: item.name, y:item.total_likes}
        });

        Highcharts.chart('container_4', {
            chart: {
                type: 'pie'
            },
            title: {
                text: 'Most Active Users'
            },
            series: [{
                name: 'Total Likes',
                data: activeUsers.map(function(item) {
                    return { name: item.name, y: parseInt(item.total_likes) };
                })
            }]
        });

        // Fact News 
        function adjustLayout() {
            // Mengubah orientasi flex container menjadi row
            var containerWrapper = document.getElementById('containerWrapper');
            containerWrapper.style.display = 'flex';

            var children = containerWrapper.children;
            // Mengatur tinggi (height) untuk setiap elemen anak
            for (var i = 0; i < children.length; i++) {
                children[i].style.height = '300px';                
            }
            children[0].classList.remove('mt-5');
            }
        function resetLayout() {
            // Mengubah orientasi flex container menjadi row
            var containerWrapper = document.getElementById('containerWrapper');
            containerWrapper.style.display = 'block';
        }
        function removeElement(elementToRemove) {
            var elementToRemove = document.getElementById(elementToRemove);
            elementToRemove.remove();
        }
        function updateFactChart(selectedVisualization) {
            if (selectedVisualization === 'category') {
                resetLayout();
                // Level Parent
                var factCategories = @json($factParentCategories);
                
                // Views
                var ViewsChartData = factCategories.map(function(item) {
                    return { name: item.CategoryName, y: Number(item.PageViews) }
                })
                Highcharts.chart('container_5', {
                    chart: {
                        type: 'bar'
                    },
                    title: {
                        text: 'Facts on Parent Category'
                    },
                    xAxis: {
                        categories: ViewsChartData.map(function(item) {
                            return item.name;
                        })
                    },
                    yAxis: {
                        title: {
                            text: 'Views'
                        }
                    },
                    series: [{
                        name: 'Views',
                        data: ViewsChartData,
                        color: '#FFD700'
                    }]
                });
                // Likes
                var LikesChartData = factCategories.map(function(item) {
                    return { name: item.CategoryName, y: Number(item.Likes) }
                })
                Highcharts.chart('container_6', {
                    chart: {
                        type: 'bar'
                    },
                    title: {
                        text: ''
                    },
                    xAxis: {
                        categories: LikesChartData.map(function(item) {
                            return item.name;
                        })
                    },
                    yAxis: {
                        title: {
                            text: 'Likes'
                        }
                    },
                    series: [{
                        name: 'Likes',
                        data: LikesChartData,
                        color: '#2ecc71'
                    }]
                });
                // Share
                var ShareChartData = factCategories.map(function(item) {
                    return { name: item.CategoryName, y: Number(item.Shares) }
                })
                Highcharts.chart('container_7', {
                    chart: {
                        type: 'bar'
                    },
                    title: {
                        text: ''
                    },
                    xAxis: {
                        categories: ShareChartData.map(function(item) {
                            return item.name;
                        })
                    },
                    yAxis: {
                        title: {
                            text: 'Share'
                        }
                    },
                    series: [{
                        name: 'Share',
                        data: ShareChartData,
                        color: '#e74c3c'
                    }]
                });

                // Level Sub
                var factSub = @json($factCategories);

                // Views
                var ViewsChartData = factSub.map(function(item) {
                    return { name: item.CategoryName, y: Number(item.PageViews) }
                })
                Highcharts.chart('container_8', {
                    chart: {
                        type: 'bar'
                    },
                    title: {
                        text: 'Facts on Sub-Category (Top-3)'
                    },
                    xAxis: {
                        categories: ViewsChartData.map(function(item) {
                            return item.name;
                        })
                    },
                    yAxis: {
                        title: {
                            text: 'Views'
                        }
                    },
                    series: [{
                        name: 'Views',
                        data: ViewsChartData,
                        color: '#FFD700'
                    }]
                });
                // Likes
                var LikesChartData = factSub.map(function(item) {
                    return { name: item.CategoryName, y: Number(item.Likes) }
                })
                Highcharts.chart('container_9', {
                    chart: {
                        type: 'bar'
                    },
                    title: {
                        text: ''
                    },
                    xAxis: {
                        categories: LikesChartData.map(function(item) {
                            return item.name;
                        })
                    },
                    yAxis: {
                        title: {
                            text: 'Likes'
                        }
                    },
                    series: [{
                        name: 'Likes',
                        data: LikesChartData,
                        color: '#2ecc71'
                    }]
                });
                // Share
                var ShareChartData = factSub.map(function(item) {
                    return { name: item.CategoryName, y: Number(item.Shares) }
                })
                Highcharts.chart('container_10', {
                    chart: {
                        type: 'bar'
                    },
                    title: {
                        text: ''
                    },
                    xAxis: {
                        categories: ShareChartData.map(function(item) {
                            return item.name;
                        })
                    },
                    yAxis: {
                        title: {
                            text: 'Share'
                        }
                    },
                    series: [{
                        name: 'Share',
                        data: ShareChartData,
                        color: '#e74c3c'
                    }]
                });

            } else if (selectedVisualization === 'time') {
                resetLayout();
                // Level Parent
                var factTime = @json($factTime);
                
                // Views
                var viewsChartData = factTime.map(function(item) {
                    return { name: item.PublishDate, data: Number(item.PageViews) }
                });
                Highcharts.chart('container_5', {
                    chart: {
                        type: 'line'
                    },
                    title: {
                        text: 'News Article by Time'
                    },
                    xAxis: {
                        categories: viewsChartData.map(item => item.name)
                    },
                    yAxis: {
                        title: {
                            text: 'Views'
                        }
                    },
                    series: [{
                        name: 'Views',
                        data: viewsChartData.map(item => item.data),
                        color: '#FFD700'
                    }]
                });

                // Likes
                var LikesChartData = factTime.map(function(item) {
                    return { name: item.PublishDate, data: Number(item.Likes) }
                });

                Highcharts.chart('container_6', {
                    chart: {
                        type: 'line'
                    },
                    title: {
                        text: ''
                    },
                    xAxis: {
                        categories: LikesChartData.map(item => item.name)
                    },
                    yAxis: {
                        title: {
                            text: 'Likes'
                        }
                    },
                    series: [{
                        name: 'Likes',
                        data: LikesChartData.map(item => item.data),
                        color: '#2ecc71'
                    }]
                });
                // // Share
                var SharesChartData = factTime.map(function(item) {
                    return { name: item.PublishDate, data: Number(item.Shares) }
                });

                Highcharts.chart('container_7', {
                    chart: {
                        type: 'line'
                    },
                    title: {
                        text: ''
                    },
                    xAxis: {
                        categories: SharesChartData.map(item => item.name)
                    },
                    yAxis: {
                        title: {
                            text: 'Shares'
                        }
                    },
                    series: [{
                        name: 'Shares',
                        data: SharesChartData.map(item => item.data),
                        color: '#e74c3c'
                    }]
                });

                // Remove element
                removeElement('container_8');
                removeElement('container_9');
                removeElement('container_10');
            } else if (selectedVisualization === 'author') {
                adjustLayout();
                var factAuthors = @json($factAuthors);

                Highcharts.chart('container_5', {
                    chart: {
                        type: 'pie'
                    },
                    title: {
                        text: 'Authors Like'
                    },
                    series: [{
                        name: 'Total Likes',
                        data: factAuthors.map(function(item) {
                            return {name: item.AuthorName, y:Number(item.Likes)}
                        })  
                    }]
                });
                Highcharts.chart('container_6', {
                    chart: {
                        type: 'pie'
                    },
                    title: {
                        text: 'Authors Views'
                    },
                    series: [{
                        name: 'Total Views',
                        data: factAuthors.map(function(item) {
                            return {name: item.AuthorName, y:Number(item.PageViews)}
                        })  
                    }]
                });
                Highcharts.chart('container_7', {
                    chart: {
                        type: 'pie'
                    },
                    title: {
                        text: 'Authors Shares'
                    },
                    series: [{
                        name: 'Total Shares',
                        data: factAuthors.map(function(item) {
                            return {name: item.AuthorName, y:Number(item.Shares)}
                        })  
                    }]
                });
            }
        };
        updateFactChart("category");

        // Event listener for dropdown change
        document.getElementById('dimensionSelector').addEventListener('change', function () {
            var selectedVisualization = this.value;
            updateFactChart(selectedVisualization);
        });

        </script>
</section>
@endsection