@extends('admin.layouts.master')

@section('content')
<section class="section">
    <div class="section-header">
        <h1>{{ __('admin.Insight') }}</h1>
    </div>

    <div id="container_1" style="height: 400px;"></div>
    <div id="container_2" style="height: 400px;"></div>

    <script>
        // Bar Chart Views
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
                data: viewsChartData
            }]
        });

        // Bar Chart Tag Counts
        var tagCountsData = @json($tagCountsData);
        var tagCountsChartData = tagCountsData.map(function(item) {
            return {name: item.name, y:item.news_count}
        });

        Highcharts.chart('container_2', {
            chart: {
                type: 'pie'
            },
            title: {
                text: 'Tag Counts'
            },
            xAxis: {
                categories: tagCountsData.map(function(item) {
                    return item.name;
                })
            },
            yAxis: {
                title: {
                    text: 'Counts'
                }
            },
            series: [{
                name: 'Counts',
                data: tagCountsChartData
            }]
        });
    </script>
</section>
@endsection