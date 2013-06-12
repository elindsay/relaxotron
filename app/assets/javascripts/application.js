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

function beforeMovement(carousel, item, idx, state)
{
}
function afterMovement(carousel, item, idx, state)
{
}

function setListeners(init, reload)
{
  $(".jcarousel-list li img").click(function(event){
    var vid_src = $(this).data("video"); 
    $(".main_video video source")[0].src = vid_src;
    $(".main_video video").load();

  });
}

$(document).ready(function() {
  $('.carousel').jcarousel({
    scroll: 2,
    wrap: "both",
    itemVisibleInCallback: {
      onBeforeAnimation:  beforeMovement,
      onAfterAnimation:  afterMovement
    },
    initCallback: setListeners

    
  });
});


