<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 예매</title>
<link rel="stylesheet" href="/lib/style.css">
<link rel="stylesheet" type="text/css" href="/lib/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="/lib/semantic.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<%
	MemberVO user = (MemberVO) session.getAttribute("user");
	int userStatus = 0;
	
	if(user != null) {
		if(user.getId() != null) {
			userStatus = 1;
		}
	}
%>



<body>

<div class="ui container">
	<header>		
		<div class="ui menu">
			<div class="item">
    			<div class="ui blue button" onclick="location.href = '/';">메인화면</div>
  			</div>
  			
  			<div class="item">
  				<a href="/movieList.do?cat_no=1">액션</a>
  			</div>
  			
  			<div class="item">
  				<a href="/movieList.do?cat_no=2">로맨스</a>
  			</div>
  			
  			<div class="item">
  				<a href="/movieList.do?cat_no=3">코미디</a>
  			</div>
  			
  			<div class="item">
  				<a href="/movieList.do?cat_no=4">스릴러</a>
  			</div>
  			
  			<div class="item">
  				<a href="/movieList.do?cat_no=5">애니메이션</a>
  			</div>
  			<div class="item">
  				<a href="/review.do">후기</a>
  			</div>
			
<%			
			if(userStatus == 1) {
				if(user.getId().equals("admin")){
%>

			<div class="right item">
				<p style="margin: 0 15px;"><%=user.getId() %>님</p>
				<div class="ui primary button" onclick="location.href = '/view/register.jsp';">영화 추가</div>
			</div>
					  			
			<div class="item">
				<div class="ui button" onclick="location.href = '/view/myTickets.jsp';">전체 예메목록</div>
			</div>
					  			
			<div class="item">
				<div class="ui button" onclick="swal('Success', '로그아웃 성공', 'success').then((val) => {location.href = '/view/logout.jsp';});">로그아웃</div>
			</div>
<%			
				} else {
%>

			<div class="right item">
				<p style="margin: 0 15px;"><%=user.getId() %>님</p>
    			<div class="ui primary button" onclick="location.href = '/view/myTickets.jsp';">내 예메목록</div>
  			</div>
  			
 			<div class="item">
   				<div class="ui button" onclick="swal('Success', '로그아웃 성공', 'success').then((val) => {location.href = '/view/logout.jsp';});">로그아웃</div>
 			</div>

<%
				}
			} else {
%>
			<div class="right item">
    			<div class="ui primary button" onclick="location.href = '/view/register.jsp';">회원가입</div>
  			</div>
  			
 			<div class="item">
   				<div class="ui button" onclick="location.href = '/view/login.jsp';">로그인</div>
 			</div>
<%
			}
%>
		</div>
	</header>
</div>