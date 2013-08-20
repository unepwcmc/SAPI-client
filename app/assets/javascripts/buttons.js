var buttons_classes = document.getElementsByClassName("panel");
var button_appendix = document.getElementsByClassName("switch_species switch_species-four candy yellow");
var buttons_section = document.querySelectorAll('p.title');
var appendices = button_appendix[0].childNodes;
var classes_chosen = new Array();
var appendix_chosen = "I";
//var appendices_chosen = new Array();
load_the_content(classes_chosen);

//Changing the appearance of the clicked/unclicked
//and addind/removing the name of the class to the list of classes to show
function button_click(e){
	var name = this.innerHTML;
	var flag = this.getAttribute('data-flag');
	if(flag == "clicked"){
		this.setAttribute('style', "" );
		this.setAttribute('data-flag', "");
		classes_chosen.splice( classes_chosen.indexOf( name ), 1 );
		load_the_content(classes_chosen);
	}
	else{
		this.setAttribute('style', "background-color:#DCEEFC; border-color:#94d5f3" );
		this.setAttribute('data-flag', "clicked");
		classes_chosen.push(name);
		load_the_content(classes_chosen);
	}

}

//Taking down the number/name of clicked appendix to show
function appendix_click(e){
	var name = this.innerHTML;
	appendix_chosen = name;
}

//Changing the section => unset the classes chosen/appendix
//unset the style of chosen classes
function section_click(e){
	classes_chosen = [];
	for(var l=0; l<buttons_classes.length; l++){
		buttons_classes[l].setAttribute('style', "" );
		buttons_classes[l].setAttribute('data-flag', "");
	}
}


//adding listeners to the objects "clickable"
for(var l=0; l<buttons_classes.length; l++){
  buttons_classes[l].addEventListener("click", button_click, false);
}

for(var l=0; l<appendices.length; l++){
	if (appendices[l].tagName == "LABEL"){
		appendices[l].addEventListener("click", appendix_click, false);
	}
}

for(var l=0; l<buttons_section.length; l++){
	buttons_section[l].addEventListener("click", section_click, false);
}

//load a description click-based
function load_the_content(e){
	var count = document.getElementsByClassName("chosen_count");
	var species = document.getElementsByClassName("chosen_group");
	if($.inArray("Animalia",e) > -1 ){
		if($.inArray("Plantae",e) > -1){
			count[0].innerHTML = " 141 ";
			species[0].innerHTML = " Animalia and Plantae ";
		}
		else{
			count[0].innerHTML = " 86 ";
			species[0].innerHTML = " Animalia ";
		}
	}
	else if($.inArray("Plantae",e) > -1){
			count[0].innerHTML = " 55 ";
			species[0].innerHTML = " Plantae ";
	}
	else{
		count[0].innerHTML = " 141 ";
		species[0].innerHTML = "";
	}
};