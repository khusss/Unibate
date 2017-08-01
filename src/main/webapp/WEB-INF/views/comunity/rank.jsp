<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.stylish-input-group .input-group-addon{
    background: white !important; 
}
.stylish-input-group .form-control{
	border-right:0; 
	box-shadow:0 0 0; 
	border-color:#ccc;
}
.stylish-input-group button{
    border:0;
    background:transparent;
}
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

#div_left{
width:20%;
height:600px;
float: left;
}
#div_right{
width:40%;
height:600px;
float: right;
}
#div_center{
width:40%;
height:600px;

float:left;
}
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




</head>
<body>
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
                      <li><a href="main.do">Home</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">토론대전<b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="realtimedebate.do">실시간 토론</a></li>
                                <li><a href="debateresult.do">토론 결과</a></li>
								<li><a href="bestdebate.do">최고의 토론</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
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
                        <li class="dropdown active">
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
<section id="content">
<div class="container">
<div class="row">
		<!-- end header -->
	<div id="div_left" >
	<table class="table table-bordered table-striped nanum">
	<tr>
		<td width="60%"><i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family: FontAwesome;font-size: 20px;">아이디</span></td>
		<td width="40%" align="center"><b><c:out value="${sessionScope.userid}"/></b></td>
	</tr>
	<tr>
		<td colspan="2"><i class="glyphicon glyphicon-picture">&nbsp;<span style="font-family: FontAwesome;font-size: 20px;">이미지</span></i></td>
	</tr>
	<tr>
		<td><i class="glyphicon glyphicon-map-marker">&nbsp;<span style="font-family: FontAwesome;font-size: 20px;">내 랭킹</span></i></td>
	
		<c:choose>
                        	<c:when test="${empty sessionScope.userid}">
                        		<td align="center">위</td>
                        	</c:when>
                        	<c:otherwise>
                        		<td align="center"><b>${ind_rank.rank}</b>위</td>
                        	</c:otherwise>
		</c:choose>
	</tr>
	<tr>
		<td><i class="glyphicon glyphicon-home">&nbsp;<span style="font-family: FontAwesome;font-size: 20px;">내 동아리</span></i></td>
	
		<c:choose>
                        	<c:when test="${empty sessionScope.userid}">
                        		<td align="center">위</td>
                        	</c:when>
                        	<c:otherwise>
                        		<td align="center"><b>${my_club.rank}</b>위</td>
                        	</c:otherwise>
		</c:choose>
	</tr>
	<tr>
		<c:choose>
                        	<c:when test="${empty sessionScope.userid}">
                        		<td colspan="2" align="center">&nbsp;&nbsp;&nbsp;</td>
                        	</c:when>
                        	<c:otherwise>
                        		<td colspan="2" align="center"><b><span style="font-family: FontAwesome;font-size: 20px;">${my_club.club_name}</span></b></td>
                        	</c:otherwise>
		</c:choose>
	
	</tr>
	</table>
	
	
	</div>
	 <div id="div_center" >
	 <table class="table">
	 	<thead >
		<tr>
			<th colspan="3"><font size="4"><b>개인랭킹</b></font></th>
		</tr>
		<tr>
			<th>순위</th>
			<th>점수</th>
			<th>아이디</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${member}" var="x">
	
		<tr><td>${x.rank}</td><td>${x.score}</td><td>${x.id}</td></tr>
 
 	
		</c:forEach>
		<tr>
			<td>...</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<c:choose>
                        	<c:when test="${empty sessionScope.userid}">
                        		<td></td>
								<td></td>
								<td></td>
                        	</c:when>
                        	<c:otherwise>
                        		<td>${ind_rank.rank}</td>
								<td>${ind_rank.score}</td>
								<td>${sessionScope.userid}</td>
                        	</c:otherwise>
			</c:choose>
		</tr>
		</tbody>
	 <form action="member_Rank_Search.do" class="navbar-form navbar-left" >
	<p align="center"><input type="text" name="mem_rank_search" size="50" maxlength="50" class="btn btn-default">
	
	<input type="submit" value="ID검색" class="btn btn-default"></p>
	</form>
	</table>
	
	
	
	</div>
	
	
	<div id="div_right">
	<table class="table" >
	<thead>
	<tr>
		<th colspan="3"><font size="4"><b>동아리 랭킹</b></font></th>
	</tr>
	<tr>
		<th>순위</th><th>점수</th><th>동아리명</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${club_mem}" var="x">
	
	
	<tr><td>${x.rank}</td><td>${x.score}</td><td>${x.club_name}</td></tr>
	
	</c:forEach>
	</tbody>
	<form action="club_Rank_Search.do" class="navbar-form navbar-left">
	<p align="center"><input type="text" name="club_rank_search" size="50" maxlength="50" class="btn btn-default">
	<input type="submit" value="동아리검색" class="btn btn-default"></p>
	</form>
	</table>
	
	
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