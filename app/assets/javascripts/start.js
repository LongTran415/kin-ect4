
$(document).ready(function() {
  $(".start-button").on('click', handleWebClick);
});

function handleWebClick(evt){
  evt.preventDefault();

  $(".start-button").click(function() {
    var topPosition = $(".index-top").position().top;
    $("body").animate({ scrollTop: topPosition }, "slow");

    return false;
  });
  // $("body").animate({ scrollTop: 0 }, 200 );
}
