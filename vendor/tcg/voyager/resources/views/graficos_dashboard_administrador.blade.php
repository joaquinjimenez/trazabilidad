<!--CARGADO  los graficos -->
<script type="text/javascript" src="canvasjs/canvasjs.min.js"></script>
<script>
window.onload = function () {
	
var chart = new CanvasJS.Chart("chartContainer", {
	//theme: "light2", // "light1", "light2", "dark1", "dark2"
	animationEnabled: true,
	title:{
		text: "Internet users"  
	},
	subtitles: [{
		text: "Try Clicking and Hovering over Legends!"
	}],
	axisX: {
		lineColor: "black",
		labelFontColor: "black"
	},
	axisY2: {
      	gridThickness: 0,
		title: "% of Population",
		suffix: "%",
		titleFontColor: "black",
		labelFontColor: "black"
	},
	legend: {
		cursor: "pointer",
		itemmouseover: function(e) {
			e.dataSeries.lineThickness = e.chart.data[e.dataSeriesIndex].lineThickness * 2;
			e.dataSeries.markerSize = e.chart.data[e.dataSeriesIndex].markerSize + 2;
			e.chart.render();
		},
		itemmouseout: function(e) {
			e.dataSeries.lineThickness = e.chart.data[e.dataSeriesIndex].lineThickness / 2;
			e.dataSeries.markerSize = e.chart.data[e.dataSeriesIndex].markerSize - 2;
			e.chart.render();
		},
		itemclick: function (e) {
			if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
				e.dataSeries.visible = false;
			} else {
				e.dataSeries.visible = true;
			}
			e.chart.render();
		}
	},
	toolTip: {
		shared: true
	},
	data: [{
		type: "spline",
		name: "Sweden",
		markerSize: 5,
      	axisYType: "secondary",
		xValueFormatString: "YYYY",
		yValueFormatString: "#,##0.0'%'",
		showInLegend: true,
		dataPoints: [
			{ x: new Date(2000, 00), y: 47.5 },
			{ x: new Date(2005, 00), y: 84.8 },
			{ x: new Date(2009, 00), y: 91 },
			{ x: new Date(2010, 00), y: 90 },
			{ x: new Date(2011, 00), y: 92.8 },
			{ x: new Date(2012, 00), y: 93.2 },
			{ x: new Date(2013, 00), y: 94.8 },
			{ x: new Date(2014, 00), y: 92.5 }
		]
	},
	{
		type: "spline",
		name: "UK",
		markerSize: 5,
		axisYType: "secondary",
		xValueFormatString: "YYYY",
		yValueFormatString: "#,##0.0'%'",
		showInLegend: true,
		dataPoints: [
			{ x: new Date(2000, 00), y: 26.8 },
			{ x: new Date(2005, 00), y: 70 },
			{ x: new Date(2009, 00), y: 83.6 },
			{ x: new Date(2010, 00), y: 85 },
			{ x: new Date(2011, 00), y: 85.4 },
			{ x: new Date(2012, 00), y: 87.5 },
			{ x: new Date(2013, 00), y: 89.8 },
			{ x: new Date(2014, 00), y: 91.6 }
		]
	},
	{
		type: "spline",
		name: "UAE",
		markerSize: 5,
		axisYType: "secondary",
		xValueFormatString: "YYYY",
		yValueFormatString: "#,##0.0'%'",
		showInLegend: true,
		dataPoints: [
			{ x: new Date(2000, 00), y: 23.6 },
			{ x: new Date(2005, 00), y: 40 },
			{ x: new Date(2009, 00), y: 64 },
			{ x: new Date(2010, 00), y: 68 },
			{ x: new Date(2011, 00), y: 78 },
			{ x: new Date(2012, 00), y: 85 },
			{ x: new Date(2013, 00), y: 86 },
			{ x: new Date(2014, 00), y: 90.4 }
		]
	},
	{
		type: "spline",
		showInLegend: true,
		name: "USA",
		markerSize: 5,
		axisYType: "secondary",
		yValueFormatString: "#,##0.0'%'",
		xValueFormatString: "YYYY",
		dataPoints: [
			{ x: new Date(2000, 00), y: 43.1 },
			{ x: new Date(2005, 00), y: 68 },
			{ x: new Date(2009, 00), y: 71 },
			{ x: new Date(2010, 00), y: 71.7 },
			{ x: new Date(2011, 00), y: 69.7 },
			{ x: new Date(2012, 00), y: 79.3 },
			{ x: new Date(2013, 00), y: 84.2 },
			{ x: new Date(2014, 00), y: 87 }
		]
	},
	{
		type: "spline",
		name: "Switzerland",
		markerSize: 5,
		axisYType: "secondary",
		xValueFormatString: "YYYY",
		yValueFormatString: "#,##0.0'%'",
		showInLegend: true,
		dataPoints: [
			{ x: new Date(2000, 00), y: 47.1 },
			{ x: new Date(2005, 00), y: 70.1 },
			{ x: new Date(2009, 00), y: 81.3 },
			{ x: new Date(2010, 00), y: 83.9 },
			{ x: new Date(2011, 00), y: 85.2 },
			{ x: new Date(2012, 00), y: 85.2 },
			{ x: new Date(2013, 00), y: 86.7 },
			{ x: new Date(2014, 00), y: 87 }
		]
	},
	{
		type: "spline",
		name: "Honk Kong",
		markerSize: 5,
		axisYType: "secondary",
		xValueFormatString: "YYYY",
		yValueFormatString: "#,##0.0'%'",
		showInLegend: true,
		dataPoints: [
			{ x: new Date(2000, 00), y: 27.8 },
			{ x: new Date(2005, 00), y: 56.9 },
			{ x: new Date(2009, 00), y: 69.4 },
			{ x: new Date(2010, 00), y: 72 },
			{ x: new Date(2011, 00), y: 72.2 },
			{ x: new Date(2012, 00), y: 72.9 },
			{ x: new Date(2013, 00), y: 74.2 },
			{ x: new Date(2014, 00), y: 74.6 }
		]
	},
	{
		type: "spline",
		name: "Russia",
		markerSize: 5,
		axisYType: "secondary",
		xValueFormatString: "YYYY",
		yValueFormatString: "#,##0.0'%'",
		showInLegend: true,
		dataPoints: [
			{ x: new Date(2000, 00), y: 2 },
			{ x: new Date(2005, 00), y: 15.2 },
			{ x: new Date(2009, 00), y: 29 },
			{ x: new Date(2010, 00), y: 43 },
			{ x: new Date(2011, 00), y: 49 },
			{ x: new Date(2012, 00), y: 63.8 },
			{ x: new Date(2013, 00), y: 61.4 },
			{ x: new Date(2014, 00), y: 70.5 }
		]
	},
	{
		type: "spline",
		name: "Ukraine",
		markerSize: 5,
		axisYType: "secondary",
		xValueFormatString: "YYYY",
		yValueFormatString: "#,##0.0'%'",
		showInLegend: true,
		dataPoints: [
			{ x: new Date(2000, 00), y: .7 },
			{ x: new Date(2005, 00), y: 3.7 },
			{ x: new Date(2009, 00), y: 17.9 },
			{ x: new Date(2010, 00), y: 23.3 },
			{ x: new Date(2011, 00), y: 28.7 },
			{ x: new Date(2012, 00), y: 35.3 },
			{ x: new Date(2013, 00), y: 41.8 },
			{ x: new Date(2014, 00), y: 43.4 }
		]
	},
	{
		type: "spline",
		name: "India",
		markerSize: 5,
		axisYType: "secondary",
		xValueFormatString: "YYYY",
		yValueFormatString: "#,##0.0'%'",
		showInLegend: true,
		dataPoints: [
			{ x: new Date(2000, 00), y: .5 },
			{ x: new Date(2005, 00), y: 2.4 },
			{ x: new Date(2009, 00), y: 5.1 },
			{ x: new Date(2010, 00), y: 7.5 },
			{ x: new Date(2011, 00), y: 10.1 },
			{ x: new Date(2012, 00), y: 12.6 },
			{ x: new Date(2013, 00), y: 15.1 },
			{ x: new Date(2014, 00), y: 18 }
		]
	}]
});


var chart_dos = new CanvasJS.Chart("chartContainer_dos", {
	animationEnabled: true,
	title:{
		text: "QOS - Survey Result"
	},
	axisY:{
		title: "Response values",
		interval: 10
	},
	toolTip: {
		shared: true
	},
	data: [{
			type: "bar",
			name: "Avg. Score",
			toolTipContent: "<b>{label}</b> <br> <span style='color:#4F81BC'>{name}</span>: {y}",
			dataPoints: [
				{ y: 94, label: "Order Accuracy" },
				{ y: 74, label: "Packaging" },
				{ y: 80, label: "Quantity" },
				{ y: 88, label: "Quality" },
				{ y: 76, label: "Delivery" }
			]
		},
		{
			type: "error",
			name: "Variability Range",
			toolTipContent: "<span style='color:#C0504E'>{name}</span>: {y[0]} - {y[1]}",
			dataPoints: [
				{ y: [92, 98], label: "Order Accuracy" },
				{ y: [70, 78], label: "Packaging" },
				{ y: [78, 85], label: "Quantity" },
				{ y: [85, 92], label: "Quality" },
				{ y: [72, 78], label: "Delivery" }
			]
	}]
});

chart.render();
chart_dos.render();


}
</script>


<div class="clearfix container-fluid row">
    <div class="col-xs-12 col-sm-12 col-md-12">
		<h1>Mi primer grafico</h1>
		<div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-12">
		<h1>Mi segundo grafico</h1>
		<div id="chartContainer_dos" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
	</div>
</div>
<!--<div class="row"><h1>{{menu('admin')}}</h1></div>-->