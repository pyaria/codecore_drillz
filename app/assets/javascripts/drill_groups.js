$(function(){
  $.get('/categories', null, auto, "json")
  
  function auto (data) {
    $('#drill_group_category_ids').autocomplete({
      source: data
    });
  }
})
