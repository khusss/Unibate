<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>UNIBATE - 대학생들의 토론광장</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="http://bootstraptaste.com" />
<!-- css -->
<style type="text/css">
.graph_comm {
	float: left
}

.graph_comm .bg_graph {
	float: left;
	margin: 5px 6px 0 6px;
	border-top: 1px solid #bbb
}

.graph_comm .graph_g {
	display: block;
	width: 143px;
	height: 5px;
	border: 1px solid #d4d4d4;
	background-color: #e1e1e1
}

.graph_comm .bar_g {
	display: block;
	height: 17px;
	margin: -2px 0 0 -1px;
	border-left: 1px solid #a1342d;
	border-top: 1px solid #a1342d;
	background-color: #d4443b
}

.graph_comm .inner_g {
	display: block;
	height: 15px;
	margin-left: -1px;
	border: 1px solid #bc3c35
}

.graph_comm .txt_graph {
	font-size: 15 px;
	font-family: tahoma;
	color: #666
}

.graph_comm .num_g {
	color: #d4443b
}

#best_reply{
float: right;
width: 40%

}
#reply{
clear: both;

}

/* Style the tab */
div.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
div.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
}

/* Change background color of buttons on hover */
div.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
div.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
}
.tabcontent {
    -webkit-animation: fadeEffect 1s;
    animation: fadeEffect 1s; /* Fading effect takes 1 second */
}

@-webkit-keyframes fadeEffect {
    from {opacity: 0;}
    to {opacity: 1;}
}

@keyframes fadeEffect {
    from {opacity: 0;}
    to {opacity: 1;}
}
.topright {
    float: right;
    cursor: pointer;
    font-size: 20px;
}

.topright:hover {color: red;}
</style>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="css/jcarousel.css" rel="stylesheet" />
<link href="css/flexslider.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Theme skin -->
<link href="skins/default.css" rel="stylesheet" />

<script type="text/javascript">

function like_button(ad_like,ad_reply_num,ad_board_num,pageNum,board_group_num){
	
	location.href = '/unibate/reply_update_view.do?ad_like='+ad_like+'&ad_reply_num='+ad_reply_num+'&ad_board_num='+ad_board_num+'&pageNum='+pageNum+'&board_group_num='+board_group_num;
	
}
function dislike_button(ad_dislike,ad_reply_num,ad_board_num,pageNum,board_group_num){
	location.href = '/unibate/reply_update2_view.do?ad_dislike='+ad_dislike+'&ad_reply_num='+ad_reply_num+'&ad_board_num='+ad_board_num+'&pageNum='+pageNum+'&board_group_num='+board_group_num;
	
}
function openCity(evt, cityName) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}
function dateToYYYYMMDD(date){
    function pad(num) {
        num = num + '';
        return num.length < 2 ? '0' + num : num;
    }
    return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
}




function check() {
	if(fr.ad_reply.value == "") {
	    alert("값을 입력해 주세요.");
	    fr.ad_reply.focus();
	    return false;
	  }
    
    <%
    Object obj = session.getAttribute("userid");
    if (obj != null) {%> 
       alert("작성완료");
       
       return true;

   <%      
    }else{

%>alert("로그인이 필요합니다");
return false;

<%

    }

%>
}

</script>
</head>
<body>
	<jsp:useBean id="toDay" class="java.util.Date" />
	<div id="wrapper">
	<!-- start header -->
	<header>
        <div class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="main.do"><span>UNI</span>BATE</a>
                </div>
                <div class="navbar-collapse collapse ">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">토론대전<b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="realtimedebate.do">실시간 토론</a></li>
                                <li><a href="debateresult.do">토론 결과</a></li>
								<li><a href="bestdebate.do">최고의 토론</a></li>
                            </ul>
                        </li>
                         <li class="dropdown active">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">자유찬반토론<b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="free_Board_List.do?pageNum=1&board_group_num=11">IT / 과학</a></li>
                                <li><a href="free_Board_List.do?pageNum=1&board_group_num=12">사회 / 정치</a></li>
								<li><a href="free_Board_List.do?pageNum=1&board_group_num=13">문학</a></li>
								<li><a href="free_Board_List.do?pageNum=1&board_group_num=14">교육</a></li>
								<li><a href="free_Board_List.do?pageNum=1&board_group_num=15">철학</a></li>
								<li><a href="free_Board_List.do?pageNum=1&board_group_num=16">스포츠</a></li>
								<li><a href="free_Board_List.do?pageNum=1&board_group_num=17">환경</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">자유독서토론<b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="free_Board_List.do?pageNum=1&board_group_num=21">IT / 과학</a></li>
                                <li><a href="free_Board_List.do?pageNum=1&board_group_num=22">사회 / 정치</a></li>
								<li><a href="free_Board_List.do?pageNum=1&board_group_num=23">문학</a></li>
								<li><a href="free_Board_List.do?pageNum=1&board_group_num=24">교육</a></li>
								<li><a href="free_Board_List.do?pageNum=1&board_group_num=25">철학</a></li>
								<li><a href="free_Board_List.do?pageNum=1&board_group_num=26">스포츠</a></li>
								<li><a href="free_Board_List.do?pageNum=1&board_group_num=27">환경</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">커뮤니티<b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="compinfo.do">대회정보</a></li>
                                <li><a href="notice.do?pageNum=1">공지사항</a></li>
								<li><a href="suggestion.do?pageNum=1">토론주제건의</a></li>
								<li><a href="f_board.do?pageNum=1">자유게시판</a></li>
								<li><a href="reported.do">신고함</a></li>
								<li><a href="rank.do">랭킹</a></li>
								<li><a href="qna.do?pageNum=1">Q&A</a></li>
                            </ul>
                        </li>
                        <li><a href="dataanalysis.do">데이터분석</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">토론동아리<b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="clubenrollment.do">동아리 등록</a></li>
                                <li><a href="clubstatus.do?pageNum=1">동아리 현황</a></li>
								<li><a href="recruiting.do?pageNum=1">동아리 모집</a></li>
                            </ul>
                        </li>
        
                         <c:if test="${empty sessionScope.userid}">
                        <li>
                        	<a href="login.do">로그인</a>
                        </li>
                       	</c:if>
                        <c:if test="${!empty sessionScope.userid}">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">마이페이지<b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="my_debating.do">참여중인토론</a></li>
                                <li><a href="my_history.do">즐겨찾기</a></li>
                                <li><a href="ranking.do">내 랭킹</a></li>
								<li><a href="my_club.do">내 동아리</a></li>
								<li><a href="reinfomation.do">가입정보수정</a></li>
								<li><a href="logout.do">로그아웃</a></li>
                            </ul>
                        </li>
                        </c:if>
                        <!-- 회원가입 패이지는 singup.do -->
                    </ul>
                </div>
            </div>
        </div>
	</header>

		<!-- end header -->

		<section id="content">
		<div class="container">
			<div class="row">

				<div class="row">
					<section id="projects">
					<ul id="thumbs" class="portfolio">
						<div class="container">
						<article>

							<div class="post-image">
								<div class="post-heading">

									<h3>
										<a href="#">${board.ad_subject}</a>
									</h3>
								</div>
								<a>${board.board_img}</a> 
							
							</div>
							
							<p>${board.board_content}</p>
							
							
							<div class="bottom-article">
								<ul class="meta-post">
									<li><i class="icon-calendar"></i><a href="#"></a>${board.board_date}</li>
									<li><i class="icon-comments"></i><a href="#">댓글수
											${reply_count}</a></li>
								</ul>

							</div>
						<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'agree')">찬성측</button>
  <button class="tablinks" onclick="openCity(event, 'disagree')">반대측</button>
  
</div>

<div id="agree" class="tabcontent">
<span onclick="this.parentElement.style.display='none'" class="topright">x</span> 
  <p><table class="table ">
								<thead>
								<tr>
								<th colspan="3"><span style="font-family: FontAwesome;font-size: 25px;">최고의 의견</span></th>
								</tr>
								</thead>
								<tbody>
								<tr> 
									<td width="10%">아이디</td>
									<td>최고 댓글1</td>
									<td width="10%"><button	onclick="like_button(${x.ad_like},${x.ad_reply_num},${ad_board_num},${pageNum},${board_group_num})" 
									class="btn btn-success">
									<div class="glyphicon glyphicon-thumbs-up" />
																</button></td>
									<td width="10%"><button
																	onclick="dislike_button(${x.ad_dislike},${x.ad_reply_num},${ad_board_num},${pageNum},${board_group_num})"
																	class="btn btn-warning">
																	<div class="glyphicon glyphicon-thumbs-down" />
																</button></td>
								</tr>
								<tr> 
									<td width="10%">아이디</td>
									<td>최고 댓글2</td>
									<td width="10%"><button	onclick="like_button(${x.ad_like},${x.ad_reply_num},${ad_board_num},${pageNum},${board_group_num})" 
									class="btn btn-success">
									<div class="glyphicon glyphicon-thumbs-up" />
																</button></td>
									<td width="10%"><button
																	onclick="dislike_button(${x.ad_dislike},${x.ad_reply_num},${ad_board_num},${pageNum},${board_group_num})"
																	class="btn btn-warning">
																	<div class="glyphicon glyphicon-thumbs-down" />
																</button></td>
								</tr>
								<tr> 
									<td width="10%">아이디</td>
									<td>최고 댓글3</td>
									<td width="10%"><button	onclick="like_button(${x.ad_like},${x.ad_reply_num},${ad_board_num},${pageNum},${board_group_num})" 
									class="btn btn-success">
									<div class="glyphicon glyphicon-thumbs-up" />
																</button></td>
									<td width="10%"><button
																	onclick="dislike_button(${x.ad_dislike},${x.ad_reply_num},${ad_board_num},${pageNum},${board_group_num})"
																	class="btn btn-warning">
																	<div class="glyphicon glyphicon-thumbs-down" />
																</button></td>
								</tr>
								<tr> 
									<td width="10%">아이디</td>
									<td>최고 댓글4</td>
									<td width="10%"><button	onclick="like_button(${x.ad_like},${x.ad_reply_num},${ad_board_num},${pageNum},${board_group_num})" 
									class="btn btn-success">
									<div class="glyphicon glyphicon-thumbs-up" />
																</button></td>
									<td width="10%"><button
																	onclick="dislike_button(${x.ad_dislike},${x.ad_reply_num},${ad_board_num},${pageNum},${board_group_num})"
																	class="btn btn-warning">
																	<div class="glyphicon glyphicon-thumbs-down" />
																</button></td>
								</tr>
								<tr> 
									<td width="10%">아이디</td>
									<td>최고 댓글5</td>
									<td width="10%"><button	onclick="like_button(${x.ad_like},${x.ad_reply_num},${ad_board_num},${pageNum},${board_group_num})" 
									class="btn btn-success">
									<div class="glyphicon glyphicon-thumbs-up" />
																</button></td>
									<td width="10%"><button
																	onclick="dislike_button(${x.ad_dislike},${x.ad_reply_num},${ad_board_num},${pageNum},${board_group_num})"
																	class="btn btn-warning">
																	<div class="glyphicon glyphicon-thumbs-down" />
																</button></td>
								</tr>
								</tbody>
							</table></p>
							
</div>

<div id="disagree" class="tabcontent">
<span onclick="this.parentElement.style.display='none'" class="topright">x</span>
  <p><table class="table ">
								<thead>
								<tr>
								<th colspan="4"><span style="font-family: FontAwesome;font-size: 25px;">최고의 의견</span></th>
								</tr>
								</thead>
								<tbody>
								<tr> 
									<td width="10%">아이디</td>
									<td>최고 댓글1</td>
									<td width="10%"><button	onclick="like_button(${x.ad_like},${x.ad_reply_num},${ad_board_num},${pageNum},${board_group_num})" 
									class="btn btn-success">
									<div class="glyphicon glyphicon-thumbs-up" />
																</button></td>
									<td width="10%"><button
																	onclick="dislike_button(${x.ad_dislike},${x.ad_reply_num},${ad_board_num},${pageNum},${board_group_num})"
																	class="btn btn-warning">
																	<div class="glyphicon glyphicon-thumbs-down" />
																</button></td>
								</tr>
								<tr> 
									<td width="10%">아이디</td>
									<td>최고 댓글2</td>
									<td width="10%"><button	onclick="like_button(${x.ad_like},${x.ad_reply_num},${ad_board_num},${pageNum},${board_group_num})" 
									class="btn btn-success">
									<div class="glyphicon glyphicon-thumbs-up" />
																</button></td>
									<td width="10%"><button
																	onclick="dislike_button(${x.ad_dislike},${x.ad_reply_num},${ad_board_num},${pageNum},${board_group_num})"
																	class="btn btn-warning">
																	<div class="glyphicon glyphicon-thumbs-down" />
																</button></td>
								</tr>
								<tr> 
									
									<td width="10%">아이디</td>							
									<td>최고 댓글3</td>
									<td width="10%"><button	onclick="like_button(${x.ad_like},${x.ad_reply_num},${ad_board_num},${pageNum},${board_group_num})" 
									class="btn btn-success">
									<div class="glyphicon glyphicon-thumbs-up" />
																</button></td>
									<td width="10%"><button
																	onclick="dislike_button(${x.ad_dislike},${x.ad_reply_num},${ad_board_num},${pageNum},${board_group_num})"
																	class="btn btn-warning">
																	<div class="glyphicon glyphicon-thumbs-down" />
																</button></td>
								</tr>
								<tr> 
									<td width="10%">아이디</td>
									<td>최고 댓글4</td>
									<td width="10%"><button	onclick="like_button(${x.ad_like},${x.ad_reply_num},${ad_board_num},${pageNum},${board_group_num})" 
									class="btn btn-success">
									<div class="glyphicon glyphicon-thumbs-up" />
																</button></td>
									<td width="10%"><button
																	onclick="dislike_button(${x.ad_dislike},${x.ad_reply_num},${ad_board_num},${pageNum},${board_group_num})"
																	class="btn btn-warning">
																	<div class="glyphicon glyphicon-thumbs-down" />
																</button></td>
								</tr>
								<tr> 
									<td width="10%">아이디</td>
									<td>최고 댓글5</td>
									<td width="10%"><button	onclick="like_button(${x.ad_like},${x.ad_reply_num},${ad_board_num},${pageNum},${board_group_num})" 
									class="btn btn-success">
									<div class="glyphicon glyphicon-thumbs-up" />
																</button></td>
									<td width="10%"><button
																	onclick="dislike_button(${x.ad_dislike},${x.ad_reply_num},${ad_board_num},${pageNum},${board_group_num})"
																	class="btn btn-warning">
																	<div class="glyphicon glyphicon-thumbs-down" />
																</button></td>
								</tr>
								</tbody>
							</table></p> 
</div>

									
							
							
				</article>
				

							<div class="progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="60"
									aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
									60%</div>
							</div>
							<table>
								<tr>
									<td>
										<div id="reply">


											<table class="table">
												<tbody>
													<c:forEach items="${reply}" var="x">
														<tr>
															<td><div class="media">
																	<div class="media-left media-middle">
																		<a href="#"> <img class="media-object"
																			src="img/default_img.png" alt="...">
																		</a>
																	</div>
																	<div class="media-body">
																		<h4 class="media-heading">${x.id}</h4>

																	</div>
																</div></td>
														</tr>
														<tr>


															<td width="800px">${x.ad_reply}</td>
															<td><button
																	onclick="like_button(${x.ad_like},${x.ad_reply_num},${ad_board_num},${pageNum},${board_group_num})"
																	class="btn btn-success">
																	<div class="glyphicon glyphicon-thumbs-up" />
																</button></td>
															<td><span class="badge">${x.ad_like}</span></td>
															<td><button
																	onclick="dislike_button(${x.ad_dislike},${x.ad_reply_num},${ad_board_num},${pageNum},${board_group_num})"
																	class="btn btn-warning">
																	<div class="glyphicon glyphicon-thumbs-down" />
																</button></td>
															<td><span class="badge">${x.ad_dislike}</span></td>
															<!-- 여기부터는 반복문 안쪽 -->

															<fmt:parseDate var="regDate" value="${x.reply_date}"
																pattern="yyyy-MM-dd HH:mm:ss" />

															<!-- 두값을 비교하기위해 time format(millisecond)의 숫자형으로 변환 -->

															<fmt:parseNumber value="${toDay.time}" integerOnly="true"
																var="nowTime" scope="request" />
															<fmt:parseNumber value="${regDate.time}"
																integerOnly="true" var="replyTime" scope="request" />



															<fmt:parseNumber value="${(nowTime-replyTime)/(1000*60)}"
																integerOnly="true" var="result" scope="request" />


															<!-- 아래는 비교문 -->

															<td><span class="label label-info"><c:if
																		test="${result < 60 }">
      ${result}분 전
	</c:if> <c:if test="${result >= 60 and result < 60*24}">
																		<fmt:parseNumber value="${result/60}"
																			integerOnly="true" var="result" scope="request" />
      ${result}시간 전
</c:if> <c:if test="${result >= 60*24 and result < 60*24*31}">
																		<fmt:parseNumber value="${result/(60*24)}"
																			integerOnly="true" var="result" scope="request" />
      ${result}일 전
</c:if>
	<c:if test="${ result >= 60*24*31 and result < 60*24*31*12}">
		${result}달 전
	</c:if>
	<c:if test="${ result >= 60*24*31*12}">
		${result}년 전
	</c:if>
</span></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>

										</div>
									</td>
								</tr>
							</table>






							<div>
								<form action="/unibate/reply_insert_view.do" method="get"
									role="form" class="contactForm" onsubmit="return check()" name="fr">
									<input type="hidden" name="end" value="${pageEnd}"> <input
										type="hidden" name="start" value="${pageStart}"> <input
										type="hidden" name="pageNum" value="${pageNum }"> <input
										type="hidden" name="ad_board_num" value="${ad_board_num}">
									<input type="hidden" name="board_group_num" value="${board_group_num}">
									<input type="hidden" name="flag" value="0">
									<div class="form-group">
										<textarea class="form-control" name="ad_reply" rows="5"
											data-rule="required" data-msg="Please write something for us"
											placeholder="Message"></textarea>
										<div class="validation"></div>
									</div>

									<div class="text-center">
										<button type="submit" class="btn btn-theme">댓글 달기</button>
									</div>
									
								</form>
							</div>
							<div class="text-center">
								<ul class="pagination pagination-large">
									<c:if test="${pageNum <= 10}">
										<li class="disabled"><a href="#">Prev</a></li>
									</c:if>
									<c:if test="${pageNum > 10}">
										<li><a
											href="/unibate/reply_view.do?pageNum=${pageNum-10}&ad_board_num=${ad_board_num}&board_group_num=${board_group_num}">Prev</a></li>
									</c:if>
									<c:if test="${pageBlock*10<pageCount}">
										<c:forEach var="i" begin="${pageStart}" step="1"
											end="${pageEnd}">
											<li><a
												href="/unibate/reply_view.do?pageNum=${i}&ad_board_num=${ad_board_num}&board_group_num=${board_group_num}">${i}</a></li>
										</c:forEach>
									</c:if>
									<c:if test="${pageBlock*10>=pageCount}">
										<c:forEach var="i" begin="${pageStart}" step="1"
											end="${pageCount}">
											<li><a
												href="/unibate/reply_view.do?pageNum=${i}&ad_board_num=${ad_board_num}&board_group_num=${board_group_num}">${i}</a></li>
										</c:forEach>
									</c:if>
									<c:if test="${pageCount <= 10 }">
										<li class="disabled"><a href="#">Next</a></li>
									</c:if>
									<c:if test="${pageCount >= pageNum+10 and pageCount > 10}">
										<li><a
											href="/unibate/reply_view.do?pageNum=${pageNum+10}&ad_board_num=${ad_board_num}&board_group_num=${board_group_num}">Next</a></li>
									</c:if>
									<c:if test="${pageCount < pageNum+10 and pageCount > 10}">
										<li><a
											href="/unibate/reply_view.do?pageNum=${pageCount}&ad_board_num=${ad_board_num}&board_group_num=${board_group_num}">Next</a></li>
									</c:if>
								</ul>
							</div>
					</ul>
					</section>
				</div>
			</div>
		</div>
	</div>
	</section>
	<footer>
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="copyright">
					<p>&copy; Unibate Theme. All right reserved.</p>
					<div class="credits">
						<!-- 
                                All the links in the footer should remain intact. 
                                You can delete the links only if you purchased the pro version.
                                Licensing information: https://bootstrapmade.com/license/
                                Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Moderna
                            -->
						<a href="https://www.unibate.co.kr/">UNIBATE</a> by <a
							href="https://www.unibate.co.kr/">UNIBATE TEAM</a>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<ul class="social-network">
					<li><a href="#" data-placement="top" title="Facebook"><i
							class="fa fa-facebook"></i></a></li>
					<li><a href="#" data-placement="top" title="Twitter"><i
							class="fa fa-twitter"></i></a></li>
					<li><a href="#" data-placement="top" title="Linkedin"><i
							class="fa fa-linkedin"></i></a></li>
					<li><a href="#" data-placement="top" title="Pinterest"><i
							class="fa fa-pinterest"></i></a></li>
					<li><a href="#" data-placement="top" title="Google plus"><i
							class="fa fa-google-plus"></i></a></li>
				</ul>
			</div>
		</div>
	</div>
	</footer>
	</div>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.fancybox.pack.js"></script>
	<script src="js/jquery.fancybox-media.js"></script>
	<script src="js/google-code-prettify/prettify.js"></script>
	<script src="js/portfolio/jquery.quicksand.js"></script>
	<script src="js/portfolio/setting.js"></script>
	<script src="js/jquery.flexslider.js"></script>
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>

</body>
</html>