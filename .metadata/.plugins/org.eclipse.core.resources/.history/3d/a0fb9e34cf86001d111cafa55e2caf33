<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
<<<<<<< HEAD
    pageEncoding="UTF-8"%>
=======
	pageEncoding="UTF-8"%>
>>>>>>> 8b7e7cd625f18be0867f2d4115585945e3f9d31a
=======
    pageEncoding="UTF-8"%>
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 예매</title>
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
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

<<<<<<< HEAD
=======
<link rel="stylesheet" href="/lib/style.css?after">
<link rel="stylesheet" type="text/css" href="/lib/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<!-- <script src="/lib/semantic.min.js"></script> -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<%
MemberVO user = (MemberVO) session.getAttribute("user");
int userStatus = 0;

if (user != null) {
	if (user.getId() != null) {
		userStatus = 1;
	}
}
%>
>>>>>>> 8b7e7cd625f18be0867f2d4115585945e3f9d31a
=======
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70


<body>

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
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
<<<<<<< HEAD
</div>
=======
	<div class="ui container">
		<header>
			<nav id="main_navi">
				<ul id="menu">
					<li data-n="1"><a href="/">박스오피스</a></li>
					<!-- 이용안내-->
					<li data-n="2"><a class="click_movie" href="#">장르별 영화</a>
						<ul class="sub">
							<li><a class="genre1" href="/movieList.do?cat_no=1">액션</a></li>
							<li><a class="genre2" href="/movieList.do?cat_no=2">로맨스</a></li>
							<li><a class="genre3" href="/movieList.do?cat_no=3">공포</a></li>
							<li><a class="genre4" href="/movieList.do?cat_no=4">스릴러</a></li>
							<li><a class="genre5" href="/movieList.do?cat_no=5">애니메이션</a></li>
						</ul></li>       
					<!-- 전시-->
					<li data-n="3"><a href="/review.do">리뷰</a> <!-- 프로그램--> <!-- 나만의 페이지-->
				</ul>
				<!--menu-->
			</nav>

			<%
			if (userStatus == 1) {
				if (user.getId().equals("admin")) {
			%>

			<div class="right item">
				<p style="margin: 0 15px;"><%=user.getId()%>님
				</p>
				<div class="ui primary button"
					onclick="location.href = '/view/register.jsp';">영화 추가</div>
			</div>

			<div class="item">
				<div class="ui button"
					onclick="location.href = '/view/myTickets.jsp';">전체 예메목록</div>
			</div>

			<div class="item">
				<div class="ui button"
					onclick="swal('Success', '로그아웃 성공', 'success').then((val) => {location.href = '/view/logout.jsp';});">로그아웃</div>
			</div>
			<%
			} else {
			%>

			<div class="right item">
				<p class="user_id"><%=user.getId()%>님</p>
		

			<div class="item">
				<div class="logout ui button"
					onclick="swal('Success', '로그아웃 성공', 'success').then((val) => {location.href = '/view/logout.jsp';});">로그아웃</div>
			</div>

			<%
			}
			} else {
			%>
			<ul class="quick">
				<li onclick="location.href = '/view/register.jsp';">회원가입</li>
				<li onclick="location.href = '/view/login.jsp';">로그인</li>
			</ul>
			<%
			}
			%>
		
	</div>
	</header>
	</div>
	<script type="text/javascript">
	$(document).ready(function () {
		  //태그 추가
		  $("#main_navi").before("<div class='bg'></div>");
		  $(".bg,.sub").hide();
		  $("#menu")
		    .mouseenter(function() {
		      $(".bg").stop().slideDown("fast");
		      $(".sub").stop().show();
		    })
		    .mouseleave(function() {
		      $(".bg").stop().slideUp("fast");
		      $(".sub").stop().hide();
		    });
		  $(".bg")
		    .mouseover(function() {
		      $(this).stop().show();
		      $(".sub").stop().show();
		    })
		    .mouseout(function() {
		      $(this).stop().slideUp();
		      $(".sub").stop().slideUp();
		    });
		  
		  $(".click_movie").click(function() {
			  $(".bg").stop().slideDown("fast");
		      $(".sub").stop().show();
		  }).dblclick(function() {
			  $(".bg").stop().slideUp("fast");
		      $(".sub").stop().hide();
		  });
		});
	</script>
</body>
</html>
>>>>>>> 8b7e7cd625f18be0867f2d4115585945e3f9d31a
=======
</div>
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
