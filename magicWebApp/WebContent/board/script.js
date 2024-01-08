/**
 * 
 */
function write_ok(){
	if(document.writeform.b_name.value.length==0){
		alert("작성자를 써주세요.");
		writeform.b_name.focus();
		return;
	}
//	if(document.writeform.b_title.value.length==0){
//		alert("제목을 써주세요.");
//		writeform.b_title.focus();
//		return;
//	}
	if(document.writeform.b_content.value.length==0){
		alert("내용을 써주세요.");
		writeform.b_content.focus();
		return;
	}
	if(document.writeform.b_pwd.value.length==0){
		alert("비밀번호를 입력해주세요.");
		writeform.b_pwd.focus();
		return;
	}
	
	document.writeform.submit();
}
function delete_ok(){
	if(document.deleteform.b_pwd.value.length==0){
		alert("비밀번호를 입력하세요.");
		writeform.b_pwd.focus();
		return;
}
	document.deleteform.submit();
}
function edit_ok(){
	if(document.editform.b_pwd.value.length==0){
		alert("비밀번호를 입력하세요.");
		editform.b_pwd.focus();
		return;
}
	document.editform.submit();
}




function check_ok(){
	// 유효성 검사(validation check)
//	DOM 구조 -> document - html - head&body
//	if(document.reg_form.mem_uid.value==""){
//	if(document.reg_form.mem_uid.value.length==0){
	if(reg_form.mem_uid.value.length==0){
	alert("아이디를 써주세요.");
	reg_form.mem_uid.focus(); // 해당 칸 커서 포커스 주기
	return; //문제가 있을경우(위 if조건 발생시) return으로 중단
	}
	
	if(reg_form.mem_uid.value.length<4){
	alert("아이디는 4글자 이상이어야 합니다..");
	reg_form.mem_uid.focus(); // 해당 칸 커서 포커스 주기
	return;
	}
	
	if(reg_form.mem_pwd.value.length==0){
	alert("패스워드는 반드시 입력해야 합니다.");
	reg_form.mem_pwd.focus(); // 해당 칸 커서 포커스 주기
	return;
	}
	
	if(reg_form.mem_pwd.value != reg_form.pwd_check.value){
	alert("패스워드가 일치하지 않습니다.");
	reg_form.pwd_check.focus(); // 해당 칸 커서 포커스 주기
	return;
	}

	if(reg_form.mem_name.value.length==0){
	alert("이름을 입력해주세요.");
	reg_form.mem_name.focus(); // 해당 칸 커서 포커스 주기
	return;
	}
	
	if(reg_form.mem_email.value.length==0){
	alert("이메일을 입력해주세요.");
	reg_form.mem_email.focus(); // 해당 칸 커서 포커스 주기
	return; 
	}
	
//  form name이 reg_form에서  에서 action 속성의 파일을 호출
	document.reg_form.submit();
}

function update_check_ok(){

	if(document.reg_form.mem_pwd.value.length==0){
	alert("패스워드는 반드시 입력해야 합니다.");
	reg_form.mem_pwd.focus(); // 해당 칸 커서 포커스 주기
	return;
	}
	
	if(document.reg_form.mem_pwd.value != reg_form.pwd_check.value){
	alert("패스워드가 일치하지 않습니다.");
	reg_form.pwd_check.focus(); // 해당 칸 커서 포커스 주기
	return;
	}

	if(reg_form.mem_email.value.length==0){
	alert("이메일을 입력해주세요.");
	reg_form.mem_email.focus(); // 해당 칸 커서 포커스 주기
	return; 
	}
	
//  form name이 reg_form에서  에서 action 속성의 파일을 호출
	document.reg_form.submit();
}
