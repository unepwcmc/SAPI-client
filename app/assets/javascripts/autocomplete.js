$(function() {
    var Tags = new Array();
    $.each(gon.creatures, function (index, value){
      Tags.push(value['full_name']);
    });

    $.extend( $.ui.autocomplete.prototype, {
        _renderItem: function( ul, item ) {
            var term = this.element.val(),
                html = item.label.replace( term, "<b>$&</b>" ),
                upper = term.replace(/^(.)|\s(.)/g, function($1){ return $1.toUpperCase( ); });
            html = html.replace( upper, "<b>$&</b>");
            return $( "<li></li>" )
                .data( "item.autocomplete", item )
                .append( $("<a></a>").html(html) )
                .appendTo( ul );
        }
    });

    $( "#species_name" ).autocomplete({
      source: Tags,
      delay: 0
    });
  });