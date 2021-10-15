// => Member Delete 기능
$(function(){
	$('.ddd').click(function(){
		var id = $(this).attr('id');
		
		$.ajax({
			type: 'Get',
			url: 'jsdelete',
			data: {
			id: id
			},
			success: function(resultData){
				if (resultData.success == 'T') {
					alert('회원이 정상적으로 강제탈퇴 처리 되었습니다.');
					$('#'+id).html('탈퇴완료');
					$('#'+id).css({
						color:'white',
						background: 'black'
					});						
					$('#'+id).off(); // 이벤트 제거(적용됨), removeClass는 적용 안됨
				}else{
					alert('회원 목록에 없는 회원입니다. 다시 확인해주세요.');
				}
			},
			error: function(){
				alert('서버 오류! 잠시후 다시 하세요');
			}
		}); //ajax
	}); ///ddd_click
		
}); //ready

