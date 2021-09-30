function cnoCheck(){
	var cno=$('#cno').val();
	if (cno.replace(/[0-9]/gi,'').length > 0) {
		$('#cnoMessage').html(' ~~ 사업자번호는 숫자로만 입력 하세요 ~~');
		return false;
	}else if (cno.length>10) {
		$('#cnoMessage').html(' ~~ 사업자번호는 숫자로 이루어진 10자리 값 입니다.~~');
		return false;
/*	}else if (cno.length<10) {
		$('#cnoMessage').html(' ~~ 사업자번호는 숫자로 이루어진 10자리 값 입니다.(\'-\'등의 기호 반드시 제거 후 입력) ~~');
		return false;*/
	}else {
		$('#cnoMessage').html('');
		return true;
	}
} //cnoCheck

function cpwCheck(){
	var cpw=$('#cpw').val();
	if (cpw.length<4) {
		$('#cpwMessage').html(' ~~ 비밀번호는 4글자 이상 입니다 ~~');
		return false;
	}else if (cpw.replace(/[!-*]/gi,'').length >= cpw.length ) {
		$('#cpwMessage').html(' ~~ password 는 특수문자가 반드시 1개 이상 포함되어야 합니다 ~~');
		return false;
	}else if (cpw.replace(/[a-z.0-9.!-*]/gi,'').length > 0) {
		$('#cpwMessage').html(' ~~ password 는 영문자, 숫자, 특수문자 로만 입력 하세요 ~~');
		return false;
	}else {
		$('#cpwMessage').html('');
		return true;
	}
} //cpwCheck

//  cpw(비밀번호) 재입력 동일성 확인
function cpw2Check(){
	var cpw=$('#cpw').val();
	var cpw2=$('#cpw2').val();
	if (cpw != cpw2) {
		$('#cpw2Message').html('~~ password 가  다릅니다. 확인하세요  ~~');
		return false;
	}else {
		$('#cpw2Message').html('');
		return true;
	}
} //cpw2Check

function cnmCheck() {
	var cname=$("#cname").val();
	if(cname.length < 2){
		$('#cnmMessage').html(' Name 2글자 이상 입력하세요 ~~');
	    return false;
	}else if(cname.replace(/[a-z.가-힇.!-*]/gi,'').length > 0 ){ //다음 확인
	   	$('#cnmMessage').html(' Name은 한글과 영문으로만 입력하세요 ~~');	
	    return false;
	}else {
	 	$('#cnmMessage').html('');
	   	return true;
	}
} //cnmCheck

function cifCheck() {
	var cinfo=$("#cinfo").val();
	if(cinfo.length < 10){
		$('#cifMessage').html('~~ 최소 20자 이상 입력해주세요 ~~ ');
	    return false;
	}else {
	 	$('#cifMessage').html('');
	   	return true;
	}
} //cifCheck

function cadCheck() {
	var caddr=$("#caddr").val();
	if(caddr.length < 10){
		$('#cadMessage').html('~~ 최소 10자 이상 입력해주세요 ~~ ');
	    return false;
	}else {
	 	$('#cadMessage').html('');
	   	return true;
	}
} //cifCheck

function cdtCheck() {
	var cdate=$("#cdate").val();
	if(cdate.length != 10){
		$('#cdtMessage').html(' 날짜는 YYYY-MM-DD 정확하게 입력하세요 ~~');
	    return false;
	}else {
	 	$('#cdtMessage').html('');
	   	return true;
	}
} //bdCheck

function periCheck() {
	var period_s=$("#period_s").val();
	var period_e=$("#period_e").val();
	if(period_s.length != 7 && period_e.length != 7){
		$('#periMessage').html(' 시간은 오전/오후 시간:분 정확하게 입력하세요 ~~');
	    return false;
	}else {
	 	$('#periMessage').html('');
	   	return true;
	}
} //periCheck

function priCheck() {
	var cprice=$("#cprice").val();
	if(cprice.replace(/[0-9]/gi,'').length > 0 ){ 
	   	$('#priMessage').html(' 무료일 경우 0원으로 기입해주세요 ~~');	
	    return false;
	}else {
	 	$('#priMessage').html('');
	   	return true;
	}
} //priCheck


