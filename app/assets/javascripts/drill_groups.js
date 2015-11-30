$(function(){
  $.get('/categories', null, auto, "json")

  function split(val){
    return val.split(/,\s*/);
  }

  function extractLast(term){
    return split(term).pop();
  }

  function auto (data){
      .bind("keydown", function(event){
        if (event.keyCode === $.ui.keyCode.TAB &&
            $(this).autocomplete("instance").menu.active){
          event.preventDefault();
        }
      })
      .autocomplete({
        source: function(request, response){
          response($.ui.autocomplete.filter(
            data, extractLast(request.term)));
        },
        focus: function(){
          return false;
        },
        select: function(event, ui){
          var terms = $('#drill_group_category_ids').val().split(", ");
          terms.pop();
          terms.push(ui.item.value);
          terms.push("");
          $('#drill_group_category_ids').val(terms.join(", "));
          return false;
        }
      });
  }
})
