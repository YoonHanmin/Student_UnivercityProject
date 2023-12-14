/**
 * 
 */

function check_ok(){
	// 유효성 검사(validation check)
//	DOM 구조 -> document - html - head&body
//	if(document.reg_form.mem_uid.value==""){
//	if(document.reg_form.mem_uid.value.length==0){
	if(document.reg_form.userID.value.length==0){
	alert("아이디를 써주세요.");
	reg_form.userID.focus(); // 해당 칸 커서 포커스 주기
	return; //문제가 있을경우(위 if조건 발생시) return으로 중단
	}
	
	if(reg_form.userID.value.length<4){
	alert("아이디는 4글자 이상이어야 합니다..");
	reg_form.userID.focus(); // 해당 칸 커서 포커스 주기
	return;
	}
	
	if(reg_form.userPassword.value.length==0){
	alert("패스워드는 반드시 입력해야 합니다.");
	reg_form.userPassword.focus(); // 해당 칸 커서 포커스 주기
	return;
	}
	
	if(reg_form.userPassword.value != reg_form.pwd_check.value){
	alert("패스워드가 일치하지 않습니다.");
	reg_form.pwd_check.focus(); // 해당 칸 커서 포커스 주기
	return;
	}

	if(reg_form.userName.value.length==0){
	alert("이름을 입력해주세요.");
	reg_form.userName.focus(); // 해당 칸 커서 포커스 주기
	return;
	}
	
	if(reg_form.userNum.value.length!=8){
	alert("학번은 8자리 입니다..");
	reg_form.userNum.focus(); // 해당 칸 커서 포커스 주기
	return; 
	}
	
//  form name이 reg_form에서  에서 action 속성의 파일을 호출
	document.reg_form.submit();
}

function infocheck_ok(){
	
	if(document.info_form.tel.value.length==0){
	alert("전화번호를 입력해주세요.");
	info_form.tel.focus(); // 해당 칸 커서 포커스 주기
	return; //문제가 있을경우(위 if조건 발생시) return으로 중단
	}
	if(document.info_form.address.value.length==0){
	alert("전화번호를 입력해주세요.");
	info_form.address.focus(); // 해당 칸 커서 포커스 주기
	return; //문제가 있을경우(위 if조건 발생시) return으로 중단
	}
	if(document.info_form.email.value.length==0){
	alert("전화번호를 입력해주세요.");
	info_form.email.focus(); // 해당 칸 커서 포커스 주기
	return; //문제가 있을경우(위 if조건 발생시) return으로 중단
	}

//  form name이 reg_form에서  에서 action 속성의 파일을 호출
	document.info_form.submit();
}

function pwcheck_ok(){
	
	if(document.change_form.userPassword.value.length==0){
	alert("비밀번호를 입력 해주세요.");
	change_form.userPassword.focus(); // 해당 칸 커서 포커스 주기
	return; //문제가 있을경우(위 if조건 발생시) return으로 중단
	}
	if(document.change_form.pw.value != change_form.pw_check.value){
	alert("패스워드가 일치하지 않습니다.");
	change_form.pw_check.focus(); // 해당 칸 커서 포커스 주기
	return;
	}
	if(document.change_form.pw.value.length==0){
	alert("비밀번호를 입력 해주세요.");
	change_form.email.focus(); // 해당 칸 커서 포커스 주기
	return; //문제가 있을경우(위 if조건 발생시) return으로 중단
	}
	if(document.change_form.pw_check.value.length==0){
	alert("비밀번호를 입력 해주세요.");
	change_form.pw_check.focus(); // 해당 칸 커서 포커스 주기
	return; //문제가 있을경우(위 if조건 발생시) return으로 중단
	}

//  form name이 reg_form에서  에서 action 속성의 파일을 호출
	document.change_form.submit();
}

function absence_ok(){
	if(confirm("휴학 신청 하시겠습니까?")){
		alert("휴학 신청 되었습니다.");
		document.reg_form.submit();
	}else {
		alert("취소 되었습니다.")
		history.back();
		
	}
	
	
}
