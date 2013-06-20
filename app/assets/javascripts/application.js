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

function setVideoListeners(init, reload)
{
  $(".jcarousel-list li img").click(function(event){
    var vid_src = $(this).data("video"); 
    $(".main_video video source")[0].src = vid_src;
    $(".main_video video").load();

  });
}

function setButtonListeners()
{
  $(".audio_loop .loop_select").click(function(event){
    $("audio").trigger("pause");
    $(".audio_loop .selected").removeClass("selected");
    $(this).addClass("selected");
    var audio_src = $(this).data("audio");
    if(audio_src != null){
      $("audio source")[0].src = audio_src;
      $("audio").load();
      $("audio").trigger("play");
    }
  });
  $(".video_loop .loop_select").click(function(event){
    $(".video_loop .selected").removeClass("selected");
    $(this).addClass("selected");
  });
  $(".video_size_start .loop_select").click(function(event){
    $(".video_size_start .selected").removeClass("selected");
    $(this).addClass("selected");
  });
  $(".start").click(function(event){
    startZone();
  });
}

function startZone(){
  if ($(".full_screen").hasClass("selected")) {
    var video_elt = $("video")[0];
    if (video_elt.requestFullscreen) {
      video_elt.requestFullscreen();
    } else if (video_elt.mozRequestFullScreen) {
      video_elt.mozRequestFullScreen();
    } else if (video_elt.webkitRequestFullscreen) {
      video_elt.webkitRequestFullscreen();
    }
  } else {
    console.log("hi");
  }
  var timeLength = $(this).data("length");
  if(timeLength != null){
    setTimeout(function() { stopZone(); }, timeLength*60000);
  }
}

function stopZone(){
  $("audio").trigger("pause");
  var video_elt = $("video")[0];
  if (video_elt.exitFullscreen) {
    video_elt.exitFullscreen();
  } else if (video_elt.mozExitFullscreen) {
    video_elt.mozExitFullscreen();
  } else if (video_elt.webkitExitFullscreen) {
    video_elt.webkitExitFullscreen();
  }
}

$(document).ready(function() {
  $("video").bind("loadeddata", function(){
    //$(".video_overlay").show();
    //$(".video_overlay").fadeOut(2000);
  });
  $(".main_video").bind("mouseover", function(){
    console.log("OVER");
    if (!$(".video_overlay").is(":visible") && $(".video_overlay:hover").length === 0){
      //$(".video_overlay").fadeIn(300);
    }
  });
  $(".main_video").bind("mouseout", function(){
    console.log("OUT");
    if ($(".video_overlay").is(":visible") && !$(".video_overlay:hover").length > 0){
      //$(".video_overlay").fadeOut(300);
    }
  });
  setButtonListeners();
  $(".video_overlay").mouseover(function(){
    $(this).css("background-color", "rgba(0, 0, 0, 0.75)");
    $(this).css("color", "white");
  });
  $('.carousel').jcarousel({
    scroll: 2,
    wrap: "both",
    itemVisibleInCallback: {
      onBeforeAnimation:  beforeMovement,
      onAfterAnimation:  afterMovement
    },
    initCallback: setVideoListeners

    
  });
});


