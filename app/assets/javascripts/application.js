// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

var futureFade = 0;
var fadingIn = false;

function beforeMovement(carousel, item, idx, state)
{
}
function afterMovement(carousel, item, idx, state)
{
  $(".jcarousel-item").each( function(index, value) {
    $(value).find("video").get(0).pause();
  });

  $(".jcarousel-item-"+idx+" video").get(0).play();
}

function fadeOutFadeables(){
  $(".fadeable").animate({opacity: 0},500);
}

function fadeInFadeables(){
  fadingIn = true;
  $(".fadeable").animate({opacity: 1},500, function() { fadingIn = false; });
}

$(document).ready(function() {
  futureFade = setTimeout(function() { fadeOutFadeables(); }, 3000);
  $('.carousel').jcarousel({
    scroll: 1,
    wrap: "both",
    itemVisibleInCallback: {
      onBeforeAnimation:  beforeMovement,
      onAfterAnimation:  afterMovement
    }
    
  });

  $("body").mousemove(function(){
    clearTimeout(futureFade);
    if($(".fadeable").css('opacity') < 1 && !fadingIn){
      fadeInFadeables();
    }
    futureFade = setTimeout(function() { fadeOutFadeables(); }, 3000);
  });
});


