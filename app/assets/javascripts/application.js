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
  $(".video_selector li img").click(function(event){
    var vslug = $(this).data("vslug"); 
    var vtitle = $(this).data("vtitle"); 
    var aslug = $(this).data("aslug"); 
    var atitle = $(this).data("atitle"); 
    var new_link = "/video/"+vslug+"/audio/"+aslug;
    $(".video_controls .full a").attr("href", new_link);
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
    //set selection correctly
    $(".video_chooser > .title").html(vtitle);
    $(".audio_chooser > .title").html(atitle);
    $(".video_selector li").removeClass("selected"); 
    $(this).parent().addClass("selected"); 
    $(".audio_selector li").removeClass("selected");
    $(".audio_selector ." + aslug).addClass("selected");
  });
  
  $(".audio_selector li").click(function(event){
    var audio_src = $(this).data("wav");
    var audio_slug = $(this).data("aslug");
    if(audio_src != null){
      $("audio source")[0].src = audio_src;
      $("audio").load();
      playCurrent();
      $(".audio_selector li").removeClass("selected")
      $(this).addClass("selected")
      $(".audio_chooser > .title").html($(this).html());
      var old_paths = $(".video_controls .full a").attr("href").split('/');
      old_paths[old_paths.length - 1] = audio_slug
      var new_link = old_paths.join("/");
      $(".video_controls .full a").attr("href", new_link);
    }
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

function fullScreenVideo(){
  if($(window).width() > $(".show_two video").width()){
    $(".show_two video").width("100%");
    $(".show_two video").height("auto");
  } else if($(window).height() > $(".show_two video").height()){
    $(".show_two video").width("auto");
    $(".show_two video").height("100%");
  }
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

  //show two stuff
  if($(".show_two").length > 0){
    fullScreenVideo();
    $(window).bind("resize", function(e) {
      fullScreenVideo();
    });
  }

  //index_two stuff
  if ($(".index_two").length > 0){
    $(".audio_chooser").click(function(event){
      if(!$(this).hasClass("selected")){
        $(".all_selectors").animate({left: "-960px"}, 1000);
        $(".video_chooser").removeClass("selected");
        $(".audio_chooser").addClass("selected");
      }
    });

    $(".video_chooser .clickers .prev").click(function(event){
      previous_elt = $(".video_selector li.selected").prev();
      if(previous_elt.length == 0){
        $(".video_selector li").removeClass("selected");
        $(".video_selector li").last().addClass("selected");
        $(".video_selector li.selected").find("img").trigger("click");
      }else{
        $(".video_selector li").removeClass("selected");
        $(previous_elt).addClass("selected");
        $(previous_elt).find("img").trigger("click");
      }
    });

    $(".video_chooser .clickers .next").click(function(event){
      next_elt = $(".video_selector li.selected").next();
      if(next_elt.length == 0){
        $(".video_selector li").removeClass("selected");
        $(".video_selector li").last().addClass("selected");
        $(".video_selector li.selected").find("img").trigger("click");
      }else{
        $(".video_selector li").removeClass("selected");
        $(next_elt).addClass("selected");
        $(next_elt).find("img").trigger("click");
      }
    });

    $(".audio_chooser .clickers .prev").click(function(event){
      previous_elt = $(".audio_selector li.selected").prev();
      if(previous_elt.length == 0){
        $(".audio_selector li").removeClass("selected");
        $(".audio_selector li").last().addClass("selected");
        $(".audio_selector li.selected").trigger("click");
      }else{
        $(".audio_selector li").removeClass("selected");
        $(previous_elt).addClass("selected");
        $(previous_elt).trigger("click");
      }
    });

    $(".audio_chooser .clickers .next").click(function(event){
      next_elt = $(".audio_selector li.selected").next();
      if(next_elt.length == 0){
        $(".audio_selector li").removeClass("selected");
        $(".audio_selector li").first().addClass("selected");
        $(".audio_selector li.selected").trigger("click");
      }else{
        $(".audio_selector li").removeClass("selected");
        $(next_elt).addClass("selected");
        $(next_elt).trigger("click");
      }
    });

    $(".video_chooser").click(function(event){
      if(!$(this).hasClass("selected")){
        $(".all_selectors").animate({left: "0px"}, 1000);
        $(".video_chooser").addClass("selected");
        $(".audio_chooser").removeClass("selected");
      }
    });
  }

  //header stuff
  $("#header .dropdown").mouseover(function(){
    $(this).find(".options").css("left", $(this).position().left);
    $(this).find(".options").css("min-width", $(this).width());
    $(this).find(".blocker").css("width", $(this).width());
  });

});


