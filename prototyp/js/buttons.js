var buttons = document.getElementsByClassName("panel");
var button_appendix = document.getElementsByClassName("switch switch-four candy yellow");
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


//adding listeners to the objects "clickable"
for(var l=0; l<buttons.length; l++){
  buttons[l].addEventListener("click", button_click, false);
}

for(var l=0; l<appendices.length; l++){
	if (appendices[l].tagName == "LABEL"){
		appendices[l].addEventListener("click", appendix_click, false);
	}
}