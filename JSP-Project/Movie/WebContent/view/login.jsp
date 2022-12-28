<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
<%@ include file="../header.jsp"%>

<%
	if(request.getAttribute("error") != null) {
		String error = (String) request.getAttribute("error");

		out.print("<script>alert('"+ error +"');</script>");
	}
	
%>

<div class="ui container">
	<div class="visual">
		<img src="/images/logo.jpg" alt="visualImg">
	</div>

	<div class="main">
		<h2>로그인</h2>

		<form class="ui form" action="/loginController.do" method="POST">
			<div class="field">
				<label>아이디</label>
				<input type="text" name="userId" id="userId" placeholder="아이디를 입력해주세요">
			</div>

			<div class="field">
				<label>비밀번호</label>
				<input type="password" name="userPW" id="userPW" placeholder="비밀번호를 입력해주세요">
			</div>

			<div class="field" style="display: flex; justify-content: flex-end; margin-top: 30px;">
<<<<<<< HEAD
=======

<link rel="stylesheet" href="/lib/style.css">
<%@ include file="../header.jsp"%>

<%
if (request.getAttribute("error") != null) {
	String error = (String) request.getAttribute("error");

	out.print("<script>alert('" + error + "');</script>");
}
%>

<div class="ui container">
	<!-- 	<h2>로그인</h2> -->
	<div class="log_vis">
	<h1>로 그 인 </h1>
	<p>영화리뷰사이트에 오신걸 환영합니다.</p>
	<hr>
	</div>
		<form class="ui form reg_form" action="/loginController.do" method="POST">
			<div class="field">
				<label>아이디</label> <input type="text" name="userId" id="userId"
					placeholder="아이디를 입력해주세요">
			</div>

			<div class="field">
				<label>비밀번호</label> <input type="password" name="userPW" id="userPW"
					placeholder="비밀번호를 입력해주세요">
			</div>

			<div class="field"
				style="display: flex; justify-content: flex-end; margin-top: 30px;">
>>>>>>> 8b7e7cd625f18be0867f2d4115585945e3f9d31a
=======
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
				<button type="button" class="ui primary button right" id="loginBtn">로그인</button>
				<input type="submit" id="loginSubmit" style="display: none;">
			</div>
		</form>
	</div>
</div>

<script>
	loginBtn.addEventListener("click", () => {
		if(userId.value.trim() == "") {
			userId.parentElement.classList.add("error");
		}else {
			userId.parentElement.classList.remove("error");
		}
		
		if(userPW.value.trim() == "") {
			userPW.parentElement.classList.add("error");
		}else {
			userPW.parentElement.classList.remove("error");
		}
		
		if(userId.value.trim() == "" || userPW.value.trim() == "") {
			swal("오류", "누락된 항목이 있습니다.", "error");
			return;
		}else {
			loginSubmit.click();
		}
	});

</script>

<%@ include file="../footer.jsp"%>