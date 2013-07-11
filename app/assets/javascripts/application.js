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
    var audio_src = $(this).data("audio");
    if(audio_src != null){
      $("audio source")[0].src = audio_src;
      $("audio").load();
    }
    var vid_src = $(this).data("video"); 
    $(".main_video video source.mp4")[0].src = vid_src + ".m4v";
    $(".main_video video source.ogg")[0].src = vid_src + ".ogv";
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
  $("video").bind("loadeddata", function(){
    playCurrent();
  });

  $(".play_pause .pause").click(function(event){
    pauseCurrent();
  });

  $(".play_pause .play").click(function(event){
    playCurrent();
  });

  setButtonListeners();

});


