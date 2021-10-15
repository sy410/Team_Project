/*
결제하기
=> 예약정보 insert 예약확인창 alert (예/아니오)
*/
$(function() {

// => AjaxReservaion 
  $('#axreservation').click(function() {
 
	var formData = new FormData();
	formData.append('rno',$('#rno').val());
	formData.append('rpdate',$('#rpdate').val());
	formData.append('rptime',$('#rptime').val());
	formData.append('rperson',$('#rperson').val());
	formData.append('rmemo',$('#rmemo').val());
	formData.append('rprice',$('#rprice').val());
	formData.append('rpay',$('#rpay').val());
	
	// 현재 로그인한 아이디 처리
	formData.append('id',$('#id').val());
	// 클릭해서 들어온 사업자번호 처리
	formData.append('cno',$('#cno').val());
	formData.append('rdate',$('#rdate').val());
	
	$.ajax({
		type:'Post',
		url: 'reservation',
		enctype: 'multipart/form-data', // 생략가능 
		processData:false,
		contentType:false,   
		data: formData,
		success:function(resultPage) {
			alert("예약접수 완료! 예약현황을 하세요 ~~");
			$('#resultArea1').html(resultPage);
			
		},
		error:function() {
			$('#resultArea1').html("~~ AjaxJoinF Error ~~");
		}
	}); //ajax
  }); //axreservation_click	
}); //ready

