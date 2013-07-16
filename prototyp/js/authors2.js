var a_s = [];
a_s['Linnaeus, 1758'] = ["Ursus arctos", "Tetrax tetrax", "Surnia ulula", "Nyctea scandiaca"];
a_s['Linnaeus, 1766'] = ["Circus cyaneus", "Falco vespertinus", "Saiga tatarica"];
a_s['Montagu, 1821'] = ["Tursiops truncatus"];
a_s['Pallas, 1769'] = ["Branta ruficollis"];
a_s['Pallas, 1771'] = ["Strix uralensis"];
a_s['Pallas, 1811'] = ["Delphinapterus leucas", "Aquila clanga"];
a_s['Scopoli, 1769'] = ["Tyto alba", "Athene noctua"];

var authors = document.querySelectorAll('div.authors2_name li');
var species = document.getElementsByClassName('authors2_species');
species = species[0];

function show_species(e){

	while (species.firstChild) {
		species.removeChild(species.firstChild);
	}
	
	var div = document.createElement('div');
	species.appendChild(div);
	div.style.marginTop=this.offsetTop + "px";
	var ul = document.createElement('ul');
	div.appendChild(ul);
	for(var i = 0; i<a_s[this.innerHTML].length; i++){
		var li = document.createElement('li');
		ul.appendChild(li);
		li.innerHTML = a_s[this.innerHTML][i];
	}
}

for(var l=0; l<authors.length; l++){
	authors[l].addEventListener("click", show_species, false);
}