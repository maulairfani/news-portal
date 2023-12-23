@extends('admin.layouts.master')

@section('content')
<section class="section">
    <div class="section-header">
        <h1>{{ __('admin.Insight') }}</h1>
    </div>

    <div id="container" style="height: 400px;"></div>

    <script>
        var viewsData = @json($viewsData);

        var viewsChartData = viewsData.map(function(item) {
            return { name: item.title, y: item.views }
        })

        Highcharts.chart('container', {
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
    </script>
</section>
@endsection