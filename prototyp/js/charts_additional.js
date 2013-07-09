var data_pop = {
	labels: [2000,2001,2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010],
	datasets : [
		{
			fillColor : "rgba(74,24,62,0.5)",
			strokeColor : "rgba(90,158,135,1)",
			pointColor : "rgba(90,158,135,1)",
			pointStrokeColor : "#fff",
			data : [35,25,70,62,59,55,69,68, 70, 65, 72]
		}
	]
};

var options = {
				
	//String - Colour of the scale line	
	scaleLineColor : "rgba(67,63,97,.1)",
	
	//String - Scale label font declaration for the scale label
	scaleFontFamily : "'Arial'",
	
	//Number - Scale label font size in pixels	
	scaleFontSize : 12,
	
	//String - Scale label font weight style	
	scaleFontStyle : "normal",
	
	//String - Scale label font colour	
	scaleFontColor : "rgb(67,63,97)",	
	
	
	//String - Colour of the grid lines
	scaleGridLineColor : "rgba(0,0,0,.05)",
	
	//Number - Pixel width of point dot stroke
	pointDotStrokeWidth : 1,
	
	//Number - Number of animation steps
	animationSteps : 200,
	
};


var ctx_chart_population = document.getElementById('chart_population').getContext("2d");
var chart_population = new Chart(ctx_chart_population).Line(data_pop, options);