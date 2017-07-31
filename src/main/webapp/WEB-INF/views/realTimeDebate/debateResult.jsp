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
<meta name="viewport" content="width=device-width, initial-scale=1">
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

#h1{

  text-shadow: 0 1px 0 #ccc,
               0 2px 0 #c9c9c9,
               0 3px 0 #bbb,
               0 4px 0 #b9b9b9,
               0 5px 0 #aaa,
               0 6px 1px rgba(0,0,0,.1),
               0 0 5px rgba(0,0,0,.1),
               0 1px 3px rgba(0,0,0,.3),
               0 3px 5px rgba(0,0,0,.2),
               0 5px 10px rgba(0,0,0,.25),
               0 10px 10px rgba(0,0,0,.2),
               0 20px 20px rgba(0,0,0,.15);


}

#real_left{
float: left;
overflow:auto;
width: 35%;
height:300px;
font-size:medium;

font-family: 'Nanum Gothic', serif;
}

#real_center{
float: left;
text-align:center !important;
width: 65%;
height: 300px; 
font-size:large;


font-family: 'Jeju Hallasan', serif;
}

</style>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="css/jcarousel.css" rel="stylesheet" />
<link href="css/flexslider.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" /> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Theme skin -->
<link href="skins/default.css" rel="stylesheet" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link async href="http://fonts.googleapis.com/css?family=Anton" data-generated="http://enjoycss.com" rel="stylesheet" type="text/css"/>
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/jejuhallasan.css" rel="stylesheet">

<script type="text/javascript">


	
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
                        <li class="dropdown active">
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
						</article>
						<c:if test="${empty rt_result}">
						<div class="col-lg-12" align="center">
							<div class="alert alert-info" role="alert" align="center" style="font-size: large;">
							<br>
등록된 <b>토론 결과</b>가 없습니다.<br>
다른 서비스를 이용해 주세요.
<br>
<br>
							</div>
						</div>
						</c:if>
		<c:forEach items="${rt_result}" var="x">				
				<div id="real_left">
				<table class="table">
					<thead align="right">
						<tr align="right">
						<th align="right" colspan="2"><b><font size="5px" style="font-family: 'Jeju Gothic', serif;">${x.d_subject}</font></b></th>
						</tr>
					</thead>
				<tbody>
				<tr>
					<td width="35%">토론기간:</td>
					<td>${x.start_date} ~ <br>${x.end_date}</td>
				</tr>
				<tr>
					<td>최고의 플레이어</td>
					<td>${x.best_mem}</td>
				</tr>
				<tr>
					<td>토론결과</td>
					<c:if test="${x.agree_score > x.disagree_score}">
					<td>찬성 승리</td>
					</c:if>
					<c:if test="${x.agree_score < x.disagree_score}">
					<td>반대 승리</td>
					</c:if>
				</tr>
				
				</tbody>
					
					<tr>
						<td></td>
				
					</tr>
				
				
				</table>
				
				</div>
				
				
				<div id="real_center">
				
				<table height="150px">
					<thead>
					<c:if test="${x.agree_score > x.disagree_score}">
					<tr>
						<td width="50%"><font style="font-family: 'Jeju Gothic', serif;">승리</font></td>
						<td></td>
					
						<td width="50%" style="font-family: 'Jeju Gothic', serif;">패배</td>
						<td></td>
					</tr>
					</c:if>
					<c:if test="${x.agree_score < x.disagree_score}">
					<tr>
						<td width="50%" style="font-family: 'Jeju Gothic', serif;">패배</td>
						<td></td>
					
						<td width="50%" style="font-family: 'Jeju Gothic', serif;"><font>승리</font></td>
						<td></td>
					</tr>
					</c:if>
					
					
					</thead>
					<tbody>
				

					
					
						<tr align="center">
							<td width="35%">
								
								<h1><font size="10" class="label label-primary" style="size: 10px;"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true">찬성</font></span></h1>
							</td>
							<td align="center" width="10%"><font size="10px" id="h1" color="black">VS</font></td>
							<td width="35%">
							
								<h1><font size="5" class="label label-success" style="size: 5px;"><span class="glyphicon glyphicon-thumbs-down" aria-hidden="true">반대</font></span></h1>
							</td>
							<td width="20%"><input type="button" value="이동" class="btn btn-default"></td>
													
						</tr>
						
						<tr>
							<td ><font id="h1" size="5px" color="blue">${x.agree_score}%</font></td>
							<td></td>
							<td><font id="h1" size="5px" color="green">${x.disagree_score}%</font></td>
							<td></td>
						</tr>
					</tbody>
				</table>
							
				</div>
</c:forEach>				
				

				
			

						
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