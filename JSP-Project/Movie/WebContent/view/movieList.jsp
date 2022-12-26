<%@page import="vo.MovieVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<link rel="stylesheet" href="/lib/style.css">
<script src="../lib/jquery-3.6.1.min.js"></script>
<script src="../lib/jquery-1.8.3.min.js"></script>
<script src="../lib/jquery-ui-1.10.4.custom.min.js"></script>
<%@ include file="../header.jsp" %>

<%
	ArrayList<MovieVO> list = new ArrayList<MovieVO>();

	if(request.getAttribute("movieList") == null) {
		response.sendRedirect("movieList.do");
	}else {
		list = (ArrayList) request.getAttribute("movieList");
	}
%>

<div class="ui container">
    <div class="visual">
        <!-- <img src="./images/logo.jpg" alt="visualImg"> -->
       <div class="visual">
        <!-- <img src="./images/logo.jpg" alt="visualImg"> -->
         <div id="appletv_post">
      <div class="appletv_post_con">
     
      <div id="atv_p">
        <div id="atv_wrap">
          <ul class="atv">
            <li class="no_1" data-n="1"><a href="#"><img src="https://img.newspim.com/news/2020/04/13/2004130813526320.jpg" alt="럭 포스터" width="688" height="387"></a></li>
            <li class="no_2" data-n="2"><a href="#"><img src="https://image.kmib.co.kr/online_image/2022/0107/2022010620211463553_1641468075_0924226465.jpg" alt="테드 래소 포스터" width="688" height="387"></a></li>
            <li class="no_3" data-n="3"><a href="#"><img src="https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202211/04/tvdaily/20221104093722155qeis.jpg" alt="DR.브레인 포스터" width="688" height="387"></a></li>
            <li class="no_4" data-n="4"><a href="#"><img src="http://talkimg.imbc.com/TVianUpload/tvian/TViews/image/2022/09/29/21c8e0c9-b498-4595-9ca4-5579a95221c2.jpg" alt="인베이션 포스터" width="688" height="387"></a></li>
            <li class="no_5" data-n="5"><a href="#"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIUJQfG8lpVdxBnvZKeHbNiWSFFQgYqQNTkQ&usqp=CAU" alt="세브란스:단절 포스터" width="688" height="387"></a></li>
            <li class="no_6" data-n="6"><a href="#"><img src="https://img.asiatoday.co.kr/file/2022y/08m/15d/2022081501001398400084201.jpg" alt="SEE 어둠의 나날 포스터" width="688" height="387"></a></li>
          </ul><!--atv-->
        </div><!--atv_wrap-->
      </div><!--atv_p-->
      <p class="prev"><img src="../images/prev.png" alt="이전버튼" width="33" height="62"></p>
      <p class="next"><img src="../images/next.png" alt="다음버튼" width="33" height="62"></p>
      </div><!--appletv_post_con-->
    </div><!--#appletv_post/애플 광고 전체-->
     
    </div>

    <div class="main">
        <h2>전체 영화 목록</h2>

        <div class="MovieList">
            <div class="ui link cards unit">
            <%
				for (MovieVO vo : list) {
					String cat = "";
					
					switch (vo.getCategory()) {
						case 1 :
							cat = "액션";
							break;
						case 2 :
							cat = "로맨스";
							break;
						case 3 :
							cat = "코미디";
							break;
						case 4 :
							cat = "스릴러";
							break;
						case 5 :
							cat = "애니메이션";
							break;
					}
			%>
                <div class="card" onclick="location.href = '/movieInfo.do?movieNo=<%=vo.getMovieNo()%>';">
                    <div class="image">
                        <img src="/images/<%=vo.getImg()%>">
                    </div>

                    <div class="content"> 
                        <div class="header"><%=vo.getMovieName() %></div>

                        <div class="meta">
                            <span class="date"><%=cat %></span>
                        </div>

                        <div class="description">
                        	<%=vo.getInfo() %>
                        </div>
                    </div>

                    <div class="extra content">
                        <span class="right floated">
                       	<%=vo.getRuntime() %>분
                        </span>

                        <span>
                            <i class="user icon"></i>
                            No: <%=vo.getMovieNo() %>
                        </span>
                    </div>
                </div>
            <% } %>
            </div>
        </div>
    </div>
</div>
<script>
	function banner() {

		$(".atv:not(:animated)").animate({
			marginLeft : parseInt($(".atv").css("margin-left")) - 688 + "px"
		}, "slow", "swing", function() {
			$(".atv li:first").appendTo(".atv");
			$(".atv").css("margin-left", "-688px");
			var n = $(".atv li").attr("data-n");
			n++;
			if (n == 7) {
				n = 1;
			}
			$("#appletv_post").removeClass();
			$("#appletv_post").addClass("bg" + n).animate({
				"transition" : ".9s"
			});
		});
	}

	$(document)
			.ready(
					function() {
						// 상업적
						//notice
						$("#notice").css({
							"position" : "fixed",
							"top" : "0",
							"left" : "0",
							"z-index" : "50",
							"width" : "100%",
							"height" : "50px;",
							"text-align" : "center",
							"background-color" : "rgba(0,0,0,0.7)"
						});
						$("#notice").hide();
						$("#notice").delay(0).slideDown(1000);
						$("#notice a").click(function() {
							$("#notice").slideUp(1000);
						});

						//통합검색
						$("#main_menu > ul > li.search div").slideUp(0);
						$("#main_menu > ul > li.search")
								.bind(
										"click",
										function() {
											$("#main_menu > ul > li.search div")
													.stop().slideDown("fast",
															"easeOutBounce");
										});
						$("#main_menu > ul > li.search").bind(
								"mouseleave",
								function() {
									if ($("#search").is(":focus") == true) {
										$("#main_menu > ul > li.search div")
												.show();
									} else {
										$("#main_menu > ul > li.search div")
												.stop().slideUp(400,
														"easeOutBounce");
									}
								}).focusout(
								function() {
									$("#main_menu > ul > li.search div").stop()
											.slideUp(400, "easeOutBounce");
									$("#search").val("");
								});
						//장바구니 wish_list 
						$("#main_menu > ul > li.wish_list > ul").hide();
						$("#main_menu > ul > li.wish_list").click(function() {
							$(this).children("ul").stop().fadeIn();
						}).mouseleave(function() {
							$(this).children("ul").stop().fadeOut();
						});

						//모달태그 추가
						$("body").append("<div id='layer'></div>");

						//기업로그인, 모달태그 숨김
						$("#enterprise_login, #layer").hide();

						//기업로그인 클릭시
						$("#quick_m li:nth-child(2) a").click(function() {
							$("#enterprise_login, #layer").fadeIn();
						});
						//로그인, 모달태그에 닫기버튼
						$(".close_e_login").click(function() {
							$("#enterprise_login, #layer").fadeOut();
						});
						//빠른메뉴 개인로그인 기업로그인 
						$("#quick_m li:nth-child(1) a").addClass("sel");
						$("#quick_m li a").click(function() {
							$("#quick_m li a").removeClass("sel");
							$(this).addClass("sel");
						})
						//로그인 팝업창
						$(".login_popup")
								.click(
										function() {
											var href1 = $(this).attr("href");
											window
													.open(href1, "그래픽",
															"width=650px, height=720px, left=700px, top=200px");
											return false;
										});
						//메뉴전체
						//메뉴 태그추가
						$("#main_menu").before("<p class='bg'></p>");

						//하위 ul, 추가태그 보이기/ 숨기기
						$(".bg, .over1").hide();
						$("#main_menu ul").mouseenter(function() {
							$(".bg, .over1").stop().slideDown("slow")
						}).mouseleave(function() {
							$(".bg, .over1").stop().slideUp("")
						});
						//.bg
						$(".bg").mouseover(function() {
							$(this).stop().show();
							$(".over1").stop().show();
						}).mouseout(function() {
							$(this).stop().slideUp();
							$(".over1").stop().slideUp();
						});
						// $(".over1") 배경
						$(".over1").mouseover(function() {
							$(this).css("background-color", "#666");
						}).mouseout(function() {
							$(this).css("background-color", "");
						});
						// 보상판매( * )trade_in
						$(".trade_in").click(
								function() {
									$("html, body").animate(
											{
												scrollTop : $(
														$.attr(this, "href"))
														.offset().top
											}, 700);
									return false;
								});
						// 포스터 자동슬라이드
						// var li_w = $(".atv li").width();
						var w = 690 * $(".atv li").length + "px";
						$(".atv").css("width", w);
						// console.log(w);
						$(".atv li:last").prependTo(".atv");
						$(".atv").css("margin-left", "-690px");

						$("#appletv_post").addClass("bg1");

						$(".prev").click(
								function() {// <
									$(".atv:not(:animated)").animate(
											{
												marginLeft : parseInt($(".atv")
														.css("margin-left"))
														- 690 + "px"
											},
											function() {
												$(".atv li:first").appendTo(
														".atv");
												$(".atv").css("margin-left",
														"-690px")

												var n = $(".atv li").attr(
														"data-n");
												n++;
												if (n == 7) {
													n = 1;
												}
												$("#appletv_post")
														.removeClass();
												$("#appletv_post").addClass(
														"bg" + n).animate({
													"transition" : ".9s"
												});
											});
								});
						$(".next").click(
								function() {// >
									$(".atv:not(:animated)").animate(
											{
												marginLeft : parseInt($(".atv")
														.css("margin-left"))
														+ 690 + "px"
											},
											function() {
												$(".atv li:last").prependTo(
														".atv");
												$(".atv").css("margin-left",
														"-690px");

												var n = $(".atv li").attr(
														"data-n");
												n++;
												if (n == 7) {
													n = 1;
												}
												$("#appletv_post")
														.removeClass();
												$("#appletv_post").addClass(
														"bg" + n).animate({
													"transition" : ".9s"
												});
											});
								});
						var banner = setInterval("banner()", 3000);

						$(".atv li").mouseover(function() {
							clearInterval(banner);
							$(this).find("img").css("opacity", "0.5");
							// alert("멈췄나요"); 확인
						}).mouseout(function() {
							banner = setInterval("banner()", 3000);
							$(this).find("img").css("opacity", "1.0");
						});
						$(".next").mouseover(function() {
							clearInterval(banner);
							$(this).find("img").css("opacity", "0.5");
							// alert("멈췄나요"); 확인
						}).mouseout(function() {
							banner = setInterval("banner()", 3000);
							$(this).find("img").css("opacity", "1.0");
						});
						$(".prev").mouseover(function() {
							clearInterval(banner);
							$(this).find("img").css("opacity", "0.5");
							// alert("멈췄나요"); 확인
						}).mouseout(function() {
							banner = setInterval("banner()", 3000);
							$(this).find("img").css("opacity", "1.0");
						});

						// SERIES LIFE IS GOOD
						$(".s_se").mouseover(
								function() {
									$(this).attr("src",
											"images/iphone_se_cut_large.jpg")
											.css("width", "151").css("height",
													"257");
								}).mouseout(
								function() {
									$(this).attr("src",
											"images/iphone_se_cut_medium.jpg")
											.css("width", "119").css("height",
													"204");
								});
						$(".s_13").mouseover(
								function() {
									$(this).attr("src",
											"images/iphone_13_cut_large.jpg")
											.css("width", "161").css("height",
													"257");
								}).mouseout(
								function() {
									$(this).attr("src",
											"images/iphone_13_cut_medium.jpg")
											.css("width", "128").css("height",
													"204");
								});
						$(".s_14").mouseover(
								function() {
									$(this).attr("src",
											"images/iphone_14_cut_large.jpg")
											.css("width", "180").css("height",
													"257");
								}).mouseout(
								function() {
									$(this).attr("src",
											"images/iphone_14_cut_medium.jpg")
											.css("width", "143").css("height",
													"204");
								});
						$(".s_14pro")
								.mouseover(
										function() {
											$(this)
													.attr("src",
															"images/iphone_14_pro_cut_large.jpg")
													.css("width", "190").css(
															"height", "257");
										})
								.mouseout(
										function() {
											$(this)
													.attr("src",
															"images/iphone_14_pro_cut_medium.jpg")
													.css("width", "151").css(
															"height", "204");
										});

						// 보상판매 디스플레이부분 ViewMore
						$(".bottom_t_in_m_n li:not(:first)").hide();
						$(".view_more_c").on(
								"click",
								function(e) {
									$(".bottom_t_in_m_n li:not(:first)").stop()
											.fadeToggle(1000);
									return false;
								});

						$("a").click(function() {
							if ($(this).attr("href") == "#") {
								return false;
							}
						});

					});
</script>
<%@ include file="../footer.jsp" %>