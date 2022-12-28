<<<<<<< HEAD
=======
<%@page import="dao.MovieDAO"%>
<%@page import="vo.ReviewVO"%>
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.ScheduleVO"%>
<%@page import="vo.MovieVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
<<<<<<< HEAD
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ include file="../header.jsp" %>

<%
	MovieVO movieInfo = new MovieVO();
	
	if(request.getAttribute("movieInfo") == null) {
		response.sendRedirect("/");
	}else {
		movieInfo = (MovieVO) request.getAttribute("movieInfo");
	}
	
	String cat = "";
	String img = "";
	

=======
=======
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ include file="../header.jsp"%>

<%
MovieVO movieInfo = new MovieVO();
<<<<<<< HEAD
=======
ReviewVO reviewList = new ReviewVO();
MovieDAO dao = MovieDAO.getInstance();
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70

if (request.getAttribute("movieInfo") == null) {
	response.sendRedirect("/");
} else {
	movieInfo = (MovieVO) request.getAttribute("movieInfo");
}

String cat = "";
String img = "";
<<<<<<< HEAD
>>>>>>> 8b7e7cd625f18be0867f2d4115585945e3f9d31a
=======

int pageNo = 1;//기본적으로 1페이지
if (request.getParameter("pageNo") != null)
	pageNo = Integer.parseInt(request.getParameter("pageNo"));
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
%>


<script>
<<<<<<< HEAD
<<<<<<< HEAD
 		function counter(){
  		document.getElementById("counting").innerHTML = document.getElementById("txt").value.length; 
  		if(document.getElementById("txt").value.length>50){
  			alert('50자 이내로 입력해 주세요');
  			}
 		}
 	
 		function btn_reg(){
 		    alert('로그인 후 이용 바랍니다.');
 		   location.href="/view/login.jsp"
 		}
 		
 		
 		
</script>

<div class="ui container">
   <!--  <div class="visual">
        <img src="/images/logo.jpg" alt="visualImg">
    </div> -->

    <div class="main">
        <h2>영화 정보</h2>

		<table class="ui inverted violet table movieInfoTable">
			<thead>
				<tr>
					<th>영화 번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>영화 정보</th>
				</tr>
			</thead>
			<tbody>
				<%
					img = movieInfo.getImg();
					
					switch (movieInfo.getCategory()) {
					case 1:
						cat = "액션";
						break;
					case 2:
						cat = "로맨스";
						break;
					case 3:
						cat = "코미디";
						break;
					case 4:
						cat = "스릴러";
						break;
					case 5:
						cat = "애니메이션";
						break;
					}
				%>
				<tr>
					<td>No.<%=movieInfo.getMovieNo()%></td>
					<td><%=cat%></td>
					<td><%=movieInfo.getMovieName()%></td>
					<td><%=movieInfo.getInfo()%></td>
				</tr>
			</tbody>
		</table>

		<h2>영화 후기</h2>
		

		<div class="movieInfoBox">
			<div class="leftBox">
				<img src="/images/<%=img%>" alt="<%=img%>">
			</div>

			<div class="rightBox">
			<p >${num}개의 댓글</p>
				<hr style="border: solid 1px black;">
				<c:set var="userId" value="${user.getId()}" />
					
					<c:if test="${userId == null }">
						<form name="review" action="#">
						<div style="font-size:15px; padding:5px;"> --- 님</div>
							<textarea style="resize: none;width:100%;" name="txt" id="txt" placeholder="로그인 후 이용해주세요" disabled ></textarea>
			
 							<div class="item" >
 								<div style="float:left;">
 									<span style="color:#aaa;" id="counting">0</span>/50자
 								</div>
								<div style="float:right; display:inline-block; hegiht:50px">
									<button  type="button" class="" id="registerBtn" onclick="javascript:btn_reg()">등록</button>
								</div>
							</div>
							<br>
							
						</form>
					</c:if>
					
					<c:if test="${userId != null }">
					<form name="review" action="/reviewInsert.do?userId=${user.getId()}&movieNo=${mn}" method="post">
					<div style="font-size:15px; padding:5px;"> ${user.getId()}님</div>
						<textarea style="resize: none;width:100%;" name="txt" id="txt" placeholder="댓글을 입력하세요" onkeyup="counter()" ></textarea>
 						<div class="item" >
 								<div style="float:left;">
 									<span style="color:#aaa;" id="counting">0</span>/50자
 								</div>
								<div style="float:right; display:inline-block; hegiht:50px">
									<button  type="submit" class="" id="registerBtn" >등록</button>
								</div>
							</div>
							<br>
					</form>
					</c:if>
			
					<table class="ui inverted blue table">
						<tr>
							<th>No.</th>
							<th>작성자</th>
							<th>리뷰내용</th>
							<th>작성일</th>
							<th>삭제</th>
						</tr>
						
						<c:forEach var="reviewList" items="${list }">
						<tr>
							<td>${reviewList.num} </td>				
							<td>${reviewList.id} </td>
							<td style="text-align : left ;table-layout:fixed ;max-width:250px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
								${reviewList.content}
							</td>
							<td>${reviewList.writedate }</td>
							<c:choose>
								<c:when test="${ reviewList.id == user.getId()}">
									<td><button style="color:blue; background:white; font-size:0.5em; border-radius:1em; padding:5px 20px;" onclick="location.href = '/deleteReview.do?num=${reviewList.num}&movieNo=${reviewList.movieNo}';">삭제</button>
=======
=======
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
	function counter() {
		document.getElementById("counting").innerHTML = document
				.getElementById("txt").value.length;
		if (document.getElementById("txt").value.length > 50) {
			alert('50자 이내로 입력해 주세요');
		}
	}

	function btn_reg() {
		alert('로그인 후 이용 바랍니다.');
		location.href = "/view/login.jsp"
	}
<<<<<<< HEAD
=======

	function check(){
		var num = document.getElementById("score").value;
		var regExp = /^[0-5]*$/;
		
		 if(!regExp.test(num)){
			    alert("숫자만 입력 가능합니다. 다시 입력해주세요.");
			    return false;
			  }
		 return true;
	}
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
</script>

<div class="ui container">
	<!--  <div class="visual">
        <img src="/images/logo.jpg" alt="visualImg">
    </div> -->

<<<<<<< HEAD
	<div class="main">
		<h2 class="reviewlist_title">Moive Review</h2>
		
			<%
			img = movieInfo.getImg();
			switch (movieInfo.getCategory()) {
			case 1:
				cat = "액션";
				break;
			case 2:
				cat = "로맨스";
				break;
			case 3:
				cat = "코미디";
				break;
			case 4:
				cat = "스릴러";
				break;
			case 5:
				cat = "애니메이션";
				break;
			}
			%>
		
			<div class="review_main_img">
				<img src="/images/<%=img%>" alt="<%=img%>">
			</div>
			<table class="category ui inverted none table movieInfoTable">
				<tr>
					<th>제 목</th>
					<th>카테고리</th>
				</tr>
				<tr>
					<td><%=movieInfo.getMovieName()%></td>
					<td><%=cat%></td>
				</tr>
			</table>
		
		<div class="movieInfoBox">

			<div class="rightBox">
				<p class="comment">${num}개의 댓글</p>
				<p class="review_line"></p>
				<c:set var="userId" value="${user.getId()}" />

				<c:if test="${ userId == null }">
					<form name="review" action="#">
						<div class="commnet_user_view">--- 님</div>
=======

	<div class="main">
		<h2>영화 정보</h2>

		<table class="ui inverted violet table movieInfoTable">
			<thead>
				<tr>
					<th>영화 번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>영화 정보</th>
				</tr>
			</thead>
			<tbody>
				<%
				img = movieInfo.getImg();

				switch (movieInfo.getCategory()) {
				case 1:
					cat = "액션";
					break;
				case 2:
					cat = "로맨스";
					break;
				case 3:
					cat = "코미디";
					break;
				case 4:
					cat = "스릴러";
					break;
				case 5:
					cat = "애니메이션";
					break;
				}
				%>

				<tr>
					<td>No.<%=movieInfo.getMovieNo()%></td>
					<td><%=cat%></td>
					<td><%=movieInfo.getMovieName()%></td>
					<td><%=movieInfo.getInfo()%></td>
				</tr>
			</tbody>
		</table>

		<h2>영화 후기</h2>


		<div class="movieInfoBox">
			<div class="leftBox">
				<img src="/images/<%=img%>" alt="<%=img%>">
			</div>

			<div class="rightBox">
				<p>${num}개의댓글</p>
				<hr style="border: solid 1px black;">
				<c:set var="userId" value="${user.getId()}" />

				<c:if test="${userId == null }">
					<form name="review" action="#">
						<div style="font-size: 15px; padding: 5px;">--- 님</div>
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
						<textarea style="resize: none; width: 100%;" name="txt" id="txt"
							placeholder="로그인 후 이용해주세요" disabled></textarea>

						<div class="item">
							<div style="float: left;">
								<span style="color: #aaa;" id="counting">0</span>/50자
							</div>
<<<<<<< HEAD
=======
							<div
								style="float: right; display: inline-block; hegiht: 50px; margin: 8px;">
								<input type="text" name="score" value="별점을 입력해주세요 정수로 5점만점임">
							</div>
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
							<div style="float: right; display: inline-block; hegiht: 50px">
								<button type="button" class="" id="registerBtn"
									onclick="javascript:btn_reg()">등록</button>
							</div>
<<<<<<< HEAD
=======

>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
						</div>
						<br>

					</form>
				</c:if>

				<c:if test="${userId != null }">
					<form name="review"
						action="/reviewInsert.do?userId=${user.getId()}&movieNo=${mn}"
						method="post">
<<<<<<< HEAD
						<div class="commnet_user_view">${user.getId()}님</div>
						<textarea class="cmo" style="resize: none;  width: 100%;" name="txt" id="txt"
=======
						<div style="font-size: 15px; padding: 5px;">
							${user.getId()}님</div>
						<div style="font-size: 15px; padding: 5px;">${score_avg}입니다</div>
						<textarea style="resize: none; width: 100%;" name="txt" id="txt"
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
							placeholder="댓글을 입력하세요" onkeyup="counter()"></textarea>
						<div class="item">
							<div style="float: left;">
								<span style="color: #aaa;" id="counting">0</span>/50자
							</div>
<<<<<<< HEAD
							<div style="float: right; display: inline-block; hegiht: 50px">
								<button type="submit" class="" id="registerBtn">작성</button>
=======
							<div
								style="float: right; display: inline-block; hegiht: 50px; margin: 8px;">
								★ <input type="text" name="score" id="score"
									placeholder="별점을 입력해주세요 정수로 5점만점임">
							</div>
							<div style="float: right; display: inline-block; hegiht: 50px">
								<button type="submit" class="" id="registerBtn"
									onclick="return check()">등록</button>

>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
							</div>
						</div>
						<br>
					</form>
				</c:if>

<<<<<<< HEAD
				
				<h2 class="movie_after_title">영화 후기</h2>
				<table class="movie_after ui inverted none table">
=======
				<table class="ui inverted blue table">
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
					<tr>
						<th>No.</th>
						<th>작성자</th>
						<th>리뷰내용</th>
						<th>작성일</th>
<<<<<<< HEAD
=======
						<th>별점</th>
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
						<th>삭제</th>
					</tr>

					<c:forEach var="reviewList" items="${list }">
						<tr>
<<<<<<< HEAD
							<td>${reviewList.num}</td>
							<td>${reviewList.id}</td>
							<td
								style="text-align: center; table-layout: fixed; max-width: 250px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
								${reviewList.content}</td>
							<td>${reviewList.writedate }</td>
							<c:choose>
								<c:when test="${ reviewList.id == user.getId()}">
									<td><button
											style="color: black; background: white; font-size: 0.5em; border-radius: 1.1em; padding: 5px 20px;"
											onclick="location.href = '/deleteReview.do?num=${reviewList.num}&movieNo=${reviewList.movieNo}';">삭제</button>
>>>>>>> 8b7e7cd625f18be0867f2d4115585945e3f9d31a
=======
							<td>${reviewList.getNum()}</td>
							<td>${reviewList.getId()}</td>
							<td
								style="text-align: left; table-layout: fixed; max-width: 250px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
								${reviewList.getContent()}</td>
							<td>${reviewList.getWritedate() }</td>
							<td>${reviewList.getScore()}</td>
							<c:choose>
								<c:when test="${ reviewList.id == user.getId()}">
									<td><button
											style="color: blue; background: white; font-size: 0.5em; border-radius: 1em; padding: 5px 20px;"
											onclick="location.href = '/deleteReview.do?num=${reviewList.num}&movieNo=${reviewList.movieNo}';">삭제</button>
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
									</td>
								</c:when>
								<c:otherwise>
									<td>-</td>
								</c:otherwise>
							</c:choose>
						</tr>
<<<<<<< HEAD
<<<<<<< HEAD
						
						</c:forEach> 
						
					</table>
					
				<c:forEach var="pageNo" begin="1" end="${num/5+1 }" step="1">
						<a href="/view/reviewList.do?pageNo=${pageNo }"> ${pageNo}</a>
				</c:forEach>
			</div>
		</div>
    </div>
=======
=======
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70

					</c:forEach>

				</table>
<<<<<<< HEAD
			<%-- 	<c:forEach var="pageNo" begin="1" end="${num/5+1 }" step="1">
					<a href="/view/reviewList.do?pageNo=${pageNo }"> ${pageNo}</a>
				</c:forEach> --%>
			</div>
		</div>
	</div>
>>>>>>> 8b7e7cd625f18be0867f2d4115585945e3f9d31a
=======

			</div>
		</div>
	</div>
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
</div>



<<<<<<< HEAD
<<<<<<< HEAD
<%@ include file="../footer.jsp" %>
=======
<%@ include file="../footer.jsp"%>
>>>>>>> 8b7e7cd625f18be0867f2d4115585945e3f9d31a
=======
<%@ include file="../footer.jsp"%>
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
