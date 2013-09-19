$(function() {
    var Tags = new Array();
    $.each(gon.creatures, function (index, value){
      Tags.push(value['full_name']);
    });
    $( "#species_name" ).autocomplete({
      source: Tags
    });
  });