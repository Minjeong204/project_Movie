<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<%
	if (request.getAttribute("error") != null) {
		out.print("<script>swal('오류', '"+ request.getAttribute("error") +"', 'error');</script>");
	}

	if(request.getAttribute("regID") != null) {
		out.print("<script>swal('회원가입 환영', '"+ request.getAttribute("regID") +"님의 가입을 환영합니다.', 'success').then((val) => {location.href = '/';});</script>");
	}
%>

<div class="ui container">
	<div class="visual">
		<img src="/images/logo.jpg" alt="visualImg">
	</div>

	<div class="main">
		<h2>회원가입</h2>

		<form class="ui form" action="/registerController.do" method="POST">
			<div class="field">
				<label>아이디</label>
				<input type="text" name="userId" id="userId" placeholder="아이디를 입력해주세요">
			</div>

			<div class="two fields">
				<div class="field">
					<label>비밀번호</label>
					<input type="password" name="userPW" id="userPW" placeholder="비밀번호를 입력해주세요">
				</div>
			
				<div class="field">
					<label>비밀번호 확인</label>
					<input type="password" name="userRePW" id="userRePW" placeholder="비밀번호를 다시 입력해주세요">
				</div>
			</div>
			
			<div class="field">
				<label>이메일</label>
				<input type="email" name="userEmail" id="userEmail" placeholder="이메일 주소를 입력해주세요">
			</div>

			<div class="field">
				<label>전화번호</label>
				<input type="text" name="userPhone" id="userPhone"	placeholder="전화번호를 입력해주세요">
			</div>

			<div class="field">
				<label>생년월일</label>
				<input type="date" name="userBirth" id="userBirth">
			</div>

			<div class="field" style="display: flex; justify-content: flex-end; margin-top: 30px;">
				<button type="reset" class="ui red button right">다시 입력</button>
				<button type="button" class="ui primary button right" id="registerBtn">회원가입</button>
				<input type="submit" id="registerSubmit" style="display: none;">
			</div>
		</form>
	</div>
</div>

<script>
	registerBtn.addEventListener("click", () => {
		if(userId.value.trim() == "") {
			userId.parentElement.classList.add("error");
		}else {
			userId.parentElement.classList.remove("error");
		}
		
		if(userEmail.value.trim() == "") {
			userEmail.parentElement.classList.add("error");
		}else {
			userEmail.parentElement.classList.remove("error");
		}
		
		if(userPhone.value.trim() == "") {
			userPhone.parentElement.classList.add("error");
		}else {
			userPhone.parentElement.classList.remove("error");
		}
		
		if(userBirth.value.trim() == "") {
			userBirth.parentElement.classList.add("error");
		}else {
			userBirth.parentElement.classList.remove("error");
		}
		
		if(userPW.value.trim() == "") {
			userPW.parentElement.classList.add("error");
		}else {
			userPW.parentElement.classList.remove("error");
		}
		
		if(userRePW.value.trim() == "") {
			userRePW.parentElement.classList.add("error");
		}else {
			userRePW.parentElement.classList.remove("error");
		}
		
		if(userId.value.trim() == "" || userPW.value.trim() == "" || userRePW.value.trim() == "" || userEmail.value.trim() == "" || userPhone.value.trim() == "" || userBirth.value.trim() == "") {
			swal("오류", "누락된 항목이 있습니다.", "error");
			return;
		}
		
		if(userPW.value.trim() !== userRePW.value.trim()) {
			userPW.parentElement.classList.add("error");
			userRePW.parentElement.classList.add("error");
			swal("오류", "비밀번호가 서로 다릅니다.", "error");
			
			return;
		}else {
			userPW.parentElement.classList.remove("error");
			userRePW.parentElement.classList.remove("error");
			registerSubmit.click();
		}
	});
</script>

<%@ include file="../footer.jsp"%>