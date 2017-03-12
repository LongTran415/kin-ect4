
$(document).ready(function() {
  $(".start").on('click', handleWebClick);
});

function handleWebClick(evt){
  evt.preventDefault();

  $(".start").click(function() {
    var topPosition = $(".content").position().top;
    $("body").animate({ scrollTop: topPosition }, "slow");

    return false;
  });
  // $("body").animate({ scrollTop: 0 }, 200 );
}
