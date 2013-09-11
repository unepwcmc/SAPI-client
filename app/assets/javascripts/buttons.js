var buttons_classes = document.getElementsByClassName("panel");
var buttons_section = document.querySelectorAll('p.title');

//Changing the appearance of the clicked/unclicked
//and addind/removing the name of the class to the list of classes to show
function button_click(e){
	var flag = this.getAttribute('data-flag');
	if(flag == "clicked"){
		this.setAttribute('style', "" );
		this.setAttribute('data-flag', "");
	}
	else{
		this.setAttribute('style', "background-color:#DCEEFC; border-color:#94d5f3" );
		this.setAttribute('data-flag', "clicked");
	}
}

//Changing the section => unset the classes chosen/appendix
//unset the style of chosen classes
function section_click(e){
	for(var l=0; l<buttons_classes.length; l++){
		buttons_classes[l].setAttribute('style', "" );
		buttons_classes[l].setAttribute('data-flag', "");
	}
}

//adding listeners to the objects "clickable"
for(var l=0; l<buttons_classes.length; l++){
  buttons_classes[l].addEventListener("click", button_click, false);
}

for(var l=0; l<buttons_section.length; l++){
	buttons_section[l].addEventListener("click", section_click, false);
}
