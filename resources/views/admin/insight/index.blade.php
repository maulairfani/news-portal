@extends('admin.layouts.master')

{{-- @php
    dd($authorLikes)
@endphp --}}

@section('content')
<section class="section">
    <div class="section-header">
        <h1>{{ __('admin.Insight') }}</h1>
    </div>
    
    <!-- Dropdown -->
    <div class="form-group mt-3">
        <label for="visualizationSelector">Choose Visualization:</label>
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

        // Author Likes
        var authorLikes = @json($authorLikes);
        var authorLikesChartData = authorLikes.map(function(item) {
            return {name: item.name, y:item.total_likes}
        });

        Highcharts.chart('container_4', {
            chart: {
                type: 'pie'
            },
            title: {
                text: 'Authors Like'
            },
            series: [{
                name: 'Total Likes',
                data: authorLikes.map(function(item) {
                    return { name: item.name, y: parseInt(item.total_likes) };
                })
            }]
        });
        </script>
</section>
@endsection