(function($) {
    "use strict"; // Start of use strict
    //line Morris
    var lineMorris = new Morris.Line({
        element: 'lineMorris',
        resize: true,
        data: paper_data,
        xkey: 'year',
        ykeys: ['amounts'],
        labels: ['论文数量'],
        gridLineColor: '#eef0f2',
        lineColors: ['#E57498'],
        lineWidth: 2,
        hideHover: 'auto'
    });
    //barmorris
    var ctx = document.getElementById("barMorris");
    if (ctx === null) return;

    var chart = Morris.Bar({
        element: 'barMorris',
        data: project_data,
        xkey: 'year',
        ykeys: ['amounts'],
        labels: ['项目数量'],
        barColors: ['#FF7D00'],
        barOpacity: 1,
        barSizeRatio: 0.5,
        hideHover: 'auto',
        gridLineColor: '#eef0f2',
        resize: true
    });
    // morris donut charts
    if ($("#donutMorris").length == 1) {
        Morris.Donut({
            element: 'donutMorris',
            data: patent_data,
            barSize: 0.1,
            labelColor: '#3e5569',
            resize: true, //defaulted to true
            colors: ['#FFAA2A', '#E57498', '#22c6ab']
        });
    }

    // visit chart
    if ($("#visitMorris").length == 1) {
        var chart = Morris.Area({
            element: 'visitMorris',
            data: [{
                    period: '2010',
                    SiteA: 0,
                    SiteB: 0,

                }, {
                    period: '2011',
                    SiteA: 130,
                    SiteB: 100,

                }, {
                    period: '2012',
                    SiteA: 60,
                    SiteB: 80,

                }, {
                    period: '2013',
                    SiteA: 180,
                    SiteB: 200,

                }, {
                    period: '2014',
                    SiteA: 280,
                    SiteB: 100,

                }, {
                    period: '2015',
                    SiteA: 170,
                    SiteB: 150,
                },
                {
                    period: '2016',
                    SiteA: 200,
                    SiteB: 80,

                }, {
                    period: '2017',
                    SiteA: 0,
                    SiteB: 0,

                }
            ],
            xkey: 'period',
            ykeys: ['SiteA', 'SiteB'],
            labels: ['Site A', 'Site B'],
            pointSize: 0,
            fillOpacity: 1,
            pointStrokeColors: ['#5867c3', '#00c5dc'],
            behaveLikeLine: true,
            gridLineColor: '#e0e0e0',
            lineWidth: 0,
            smooth: false,
            hideHover: 'auto',
            lineColors: ['#5867c3', '#00c5dc'],
            resize: true
        });
    }

})(jQuery);