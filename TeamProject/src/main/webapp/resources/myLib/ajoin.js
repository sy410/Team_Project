$(function() {
	
	$('.textLink').hover(function() {
		$(this).css({
			fontSize:"1.2em",
			fontWeight:"bold",
			color:"DeepSkyBlue",
			cursor:"pointer"
		}) //css
	}, function() {
		$(this).css({
			fontSize:"",
			fontWeight:"bold",
			color:"Blue",
			cursor:"default"
		}) //css
  }); //hover 

	// ** Ajax ReviewCriPageList	
  $('#pjoin').click(function(){
	$.ajax({
		type:'Get',
		url:'joinf',
		success:function(resultPage){
			$('#resultArea1').html(resultPage);
		},
		error:function(){
			alert('~~ 서버 오류 !!! 잠시후 다시 하세요 ~~');
		}
	}); //ajax
  }); //rcplist_click

	// ** Ajax NoticeCriPageList	
  $('#cjoin').click(function(){
	$.ajax({
		type:'Get',
		url:'cjoinf',
		success:function(resultPage){
			$('#resultArea1').html(resultPage);
		},
		error:function(){
			alert('~~ 서버 오류 !!! 잠시후 다시 하세요 ~~');
		}
	}); //ajax
  }); //ncplist_click

}); //ready