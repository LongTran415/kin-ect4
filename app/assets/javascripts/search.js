$(document).ready(function() {
  $(".search-button").on('click', showResults);
});

function showResults(evt) {
  evt.preventDefault();

  $('.search-results').show();
}
