window.onload = function(){
	var ctx1 = document.getElementById("animalia_bar").getContext("2d");

	//Get context with jQuery - using jQuery's .get() method.
	// var ctx = $("#myChart").get(0).getContext("2d");
	//This will get the first returned node in the jQuery collection.

	var ctx2 = document.getElementById("plantae_bar").getContext("2d");


	var data = {
		labels : ["Mammalia","Actinopterygii","Aves","Insecta","Reptilia","Hirudinoidea","Amphibia", "Gastropoda"],
		datasets : [
			{
				fillColor : "rgba(151,187,205,0.5)",
				strokeColor : "rgba(151,187,205,1)",
				data : [21,2,60,1,1,1,0,0]
			}
		]
	};

	var animaliaChart = new Chart(ctx1).Bar(data);

	var data2 = {
			labels : ["Amarylidaceae","Lycopodiaceae","Primulaceae","Compositae","Menyanthaceae","Ranunculaceae","Euphorbiaceae","Orchidaceae","Taxaceae"],
			datasets : [
				{
			fillColor : "rgba(151,187,205,0.5)",
			strokeColor : "rgba(151,187,205,1)",
					data : [0,0,1,0,0,1,4,49,0]
				}
			]
	};

var plantaeChart = new Chart(ctx2).Bar(data2);

}