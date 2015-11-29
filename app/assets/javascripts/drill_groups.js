$(function(){
  $.get('/categories', null, auto, "json")

  function split( val ) {
    return val.split( /,\s*/ );
  }

  function extractLast( term ) {
    return split( term ).pop();
  }

  function auto (data) {
    $('#drill_group_category_ids')
      .bind( "keydown", function( event ) {
        if ( event.keyCode === $.ui.keyCode.TAB &&
            $( this ).autocomplete( "instance" ).menu.active ) {
          event.preventDefault();
        }
      })
      .autocomplete({
        source: function( request, response ) {
          // delegate back to autocomplete, but extract the last term
          response( $.ui.autocomplete.filter(
            data, extractLast( request.term ) ) );
        },
        focus: function() {
          // prevent value inserted on focus
          return false;
        },
        select: function( event, ui ) {
          var terms = $('#drill_group_category_ids').val().split(", ");
          terms.pop();
          terms.push(ui.item.value);
          terms.push("");
          $('#drill_group_category_ids').val(terms.join(", "));
          // var terms = data.split(ui.item.value);
          // var terms = this.split(value );
          // // remove the current input
          // terms.pop();
          // // add the selected item
          // terms.push( ui.item.value );
          // // add placeholder to get the comma-and-space at the end
          // terms.push( "" );
          // this.value = terms.join( ", " );
          return false;
        }
      });
  }
})
