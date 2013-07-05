var buttons_classes = document.getElementsByClassName("panel");
var button_appendix = document.getElementsByClassName("switch switch-four candy yellow");
var buttons_section = document.querySelectorAll('p.title');
var appendices = button_appendix[0].childNodes;
var classes_chosen = new Array();
var appendix_chosen = "I";
//var appendices_chosen = new Array();


//Changing the appearance of the clicked/unclicked
//and addind/removing the name of the class to the list of classes to show
function button_click(e){
	var name = this.innerHTML;
	var flag = this.getAttribute('data-flag');
	if(flag == "clicked"){
		this.setAttribute('style', "" );
		this.setAttribute('data-flag', "");
		classes_chosen.splice( classes_chosen.indexOf( name ), 1 );
		console.log(classes_chosen);
	}
	else{
		this.setAttribute('style', "background-color:#CCFFCC" );
		this.setAttribute('data-flag', "clicked");
		classes_chosen.push(name);
		console.log(classes_chosen);
	}

}

//Taking down the number/name of clicked appendix to show
function appendix_click(e){
	var name = this.innerHTML;
	appendix_chosen = name;
	console.log(appendix_chosen);
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