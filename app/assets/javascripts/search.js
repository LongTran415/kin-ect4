
$(document).ready(function() {
  $(".search-button").on('click', handleSearch);
});

function handleSearch(evt){
  evt.preventDefault()
  $("#games th a, #games .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#games_search input").keyup(function() {
    $.get($("#games_search").attr("action"), $("#games_search").serialize(), null, "script");
    return false;
  });
}
