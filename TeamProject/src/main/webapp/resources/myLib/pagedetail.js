// => title 누르면 review Detail 조회
// test 1) JS function

// review title Detail
function titleRDetail(brno) {
	$.ajax({
		type: 'Get',
		url:'ardetail?brno='+brno,
		data:{
			brno:brno
		},		
		success:function(resultPage){
			$('#resultArea1').html(resultPage);
		},
		error:function(){
			alert('~~ 서버 오류 !!! 잠시후 다시 하세요 ~~  ');
		}
	}); //ajax
} //titleRDetail

// Notice title Detail
function titleNDetail(bfno) {
	$.ajax({
		type: 'Get',
		url:'andetail?bfno='+bfno,
		data:{
			bfno:bfno
		},		
		success:function(resultPage){
			$('#resultArea1').html(resultPage);
		},
		error:function(){
			alert('~~ 서버 오류 !!! 잠시후 다시 하세요 ~~  ');
		}
	}); //ajax
} //titleNDetail

// Qna title Detail
function titleQDetail(bqno) {
	$.ajax({
		type: 'Get',
		url:'aqdetail?bqno='+bqno,
		data:{
			bqno:bqno
		},		
		success:function(resultPage){
			$('#resultArea1').html(resultPage);
		},
		error:function(){
			alert('~~ 서버 오류 !!! 잠시후 다시 하세요 ~~  ');
		}
	}); //ajax
} //titleQDetail