
function initializeChart(dataSource, argument, value){
    $(function(){
        $("#pie").dxPieChart({
            size: {
                width: 500
            },
            palette: "bright",
            dataSource: dataSource,
            series: [
                {
                    argumentField: argument,
                    valueField: value,
                    label: {
                        visible: true,
                        connector: {
                            visible: true,
                            width: 1
                        }
                    }
                }
            ],
            title: "Totale ore per utente",
            "export": {
                enabled: true
            },
            onPointClick: function (e) {
                var point = e.target;
        
                toggleVisibility(point);
            },
            onLegendClick: function (e) {
                var arg = e.target;
        
                toggleVisibility(this.getAllSeries()[0].getPointsByArg(arg)[0]);
            }
        });
        
        function toggleVisibility(item) {
            if(item.isVisible()) {
                item.hide();
            } else { 
                item.show();
            }
        }
    });
}