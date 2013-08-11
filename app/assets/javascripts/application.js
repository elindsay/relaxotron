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

function setButtonListeners()
{
  $("li img").click(function(event){
    var vslug = $(this).data("vslug"); 
    var aslug = $(this).data("aslug"); 
    console.log("aslug: " + aslug);
    var new_link = "/video/"+vslug+"/audio/"+aslug;
    console.log(new_link);
    $(".video_overlay .modify a").attr("href", new_link);
    var audio_src = $(this).data("wav");
    if(audio_src != null){
      $("audio source")[0].src = audio_src;
      $("audio").load();
    }
    var vid_mp4_src = $(this).data("mp4"); 
    var vid_ogg_src = $(this).data("ogg"); 
    $(".main_video video source.mp4")[0].src = vid_mp4_src;
    $(".main_video video source.ogg")[0].src = vid_ogg_src;
    $(".main_video video")[0].poster = $(this)[0].src;
    $(".main_video video").load();
    playCurrent();
  });
  $(".video_loop .loop_select").click(function(event){
    $(".video_loop .selected").removeClass("selected");
    $(this).addClass("selected");
    var length = $(this).data("length");
    startZone(length);
  });
  
}

function setMouseListeners() {
  $(".main_video").mousemove(function(){
    clearTimeout($.data(document.body, "lastVideoMouse"));
    var videoOverlayTimeout = setTimeout(function(){$(".video_overlay").fadeOut(500);}, 1500);
    $.data(document.body, "lastVideoMouse", videoOverlayTimeout);
    if (!$(".video_overlay").is(":visible") || $(".video_overlay").opacity < "1"){
      $(".video_overlay").fadeIn(500);
    }
  });
}

function fadeOutDistractions(){
  $(".fadeable").fadeOut();
  $(".logo").fadeOut();
}

function fadeInDistractions(){
  $(".logo").fadeIn();
  $(".fadeable").fadeIn();
}

function startZone(timeLength){

  fadeOutDistractions();
  playCurrent();
  if(timeLength != null){
    setTimeout(function() { pauseCurrent(); }, timeLength*60000);
  }
}

function playCurrent(){
  $("video").get(0).play();
  $("audio").trigger("play");
  $(".play_pause .play").addClass("hidden");
  $(".play_pause .pause").removeClass("hidden");
}

function pauseCurrent(){
  $("video").get(0).pause();
  $("audio").trigger("pause");
  $(".play_pause .pause").addClass("hidden");
  $(".play_pause .play").removeClass("hidden");
  fadeInDistractions();
}
$(document).ready(function() {
  $.data(document.body, "lastVideoMouse", null);
  $("video").bind("loadeddata", function(){
    playCurrent();
    setTimeout(function() { $(".video_overlay").fadeOut(500); }, 2000);
  });

  $(".play_pause .pause").click(function(event){
    pauseCurrent();
  });

  $(".play_pause .play").click(function(event){
    playCurrent();
  });

  setButtonListeners();
  setMouseListeners();

});


