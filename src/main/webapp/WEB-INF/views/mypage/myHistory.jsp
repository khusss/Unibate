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
#div_center{
width:80%;
height:600px;

float:right;
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
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">토론대전<b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="realtimedebate.do">실시간 토론</a></li>
                                <li><a href="debateresult.do">토론 결과</a></li>
								<li><a href="bestdebate.do">최고의 토론</a></li>
                            </ul>
                        </li>
                       <li class="dropdown">
                            <a href="/unibate/free_Board_List.do?board_group_num=11&pageNum=1" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">자유찬반토론<b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li class="it"><a href="free_Board_List.do?board_group_num=11&pageNum=1">IT/과학</a></li>
							<li class="social"><a href="free_Board_List.do?board_group_num=12&pageNum=1" title="">사회/정치</a></li>
							<li class="literature"><a href="free_Board_List.do?board_group_num=13&pageNum=1" title="">문학</a></li>
							<li class="edu"><a href="free_Board_List.do?board_group_num=14&pageNum=1" title="">교육</a></li>
							<li class="philosophy"><a href="free_Board_List.do?board_group_num=15&pageNum=1" title="">철학</a></li>
							<li class="sport"><a href="free_Board_List.do?board_group_num=16&pageNum=1" title="">스포츠</a></li>
							<li class="environment"><a href="free_Board_List.do?board_group_num=17&pageNum=1" title="">환경</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="/unibate/free_Board_List.do?board_group_num=21&pageNum=1" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">자유독서토론<b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li class="it"><a href="free_Board_List.do?board_group_num=21&pageNum=1">IT/과학</a></li>
							<li class="social"><a href="free_Board_List.do?board_group_num=22&pageNum=1" title="">사회/정치</a></li>
							<li class="literature"><a href="free_Board_List.do?board_group_num=23&pageNum=1" title="">문학</a></li>
							<li class="edu"><a href="free_Board_List.do?board_group_num=24&pageNum=1" title="">교육</a></li>
							<li class="philosophy"><a href="free_Board_List.do?board_group_num=25&pageNum=1" title="">철학</a></li>
							<li class="sport"><a href="free_Board_List.do?board_group_num=26&pageNum=1" title="">스포츠</a></li>
							<li class="environment"><a href="free_Board_List.do?board_group_num=27&pageNum=1" title="">환경</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">커뮤니티<b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="compinfo.do">대회정보</a></li>
                                <li><a href="notice.do">공지사항</a></li>
								<li><a href="suggestion.do">토론주제건의</a></li>
								<li><a href="f_board.do">자유게시판</a></li>
								<li><a href="reported.do">신고함</a></li>
								<li><a href="rank.do">랭킹</a></li>
								<li><a href="qna.do">Q&A</a></li>
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
                         <c:choose>
                         <c:when test="${empty sessionScope.userid}">
                          <li><a href="login.do">로그인</a></li>
                         </c:when>
                         <c:otherwise>
                         
                       <li class="dropdown">
                            <a href="mypage.do" class="dropdown-toggle" data-toggle="dropdown"data-hover="dropdown" data-delay="0" data-close-others="false">마이패이지<b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                            	 <li><a href="my_debating.do">참여중인토론</a></li>
                                <li><a href="my_history.do">즐겨찾기</a></li>
                                <li><a href="ranking.do">내 랭킹</a></li>
								<li><a href="my_club.do">내 동아리</a></li>
								<li><a href="reinfomation.do">가입정보수정</a></li>
								<li><a href="logout.do">로그아웃</a></li>
                            </ul>
                        </li>
                       
                         </c:otherwise>
                        </c:choose>
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
		<td width="50%"  align="center"><span style="font-family: FontAwesome;font-size: 15px;"><b><c:out value="${sessionScope.userid}"/></b></span></td>
		<td width="30%" align="center"><button class="btn btn-default" onclick="location.href='logout.do'">로그아웃</button></td>
	</tr>
	<tr>
		<td colspan="2"><i class="glyphicon glyphicon-log-in">&nbsp;<span style="font-family: FontAwesome;font-size: 15px;"><a href="my_debating.do">참여중인 토론</a></span></i></td>
	</tr>
	<tr>
		<td colspan="2"><i class="glyphicon glyphicon-list">&nbsp;<span style="font-family: FontAwesome;font-size: 15px;"><a href="my_history.do">토론 참여 내역</a></span></i></td>
	
		
	</tr>
	<tr>
		<td colspan="2"><i class="glyphicon glyphicon-map-marker">&nbsp;<span style="font-family: FontAwesome;font-size: 15px;"><a href="ranking.do">내 랭킹</a></span></i></td>
	
		
	</tr>
	<tr>
		<td colspan="2"><i class="glyphicon glyphicon-home">&nbsp;<span style="font-family: FontAwesome;font-size: 15px;"><a href="my_club.do">내 동아리</a></span></i></td>
	
	</tr>
	<tr>
		<td colspan="2"><i class="glyphicon glyphicon-edit">&nbsp;<span style="font-family: FontAwesome;font-size: 15px;"><a href="reinfomation.do">정보수정</a></span></i></td>
	
	</tr>
	</table>
	
	</div>
	 <div id="div_center" >
	 <table class="table" >
	 	<thead  align="center">
		<tr>
			<th colspan="4"><font size="4"><b>날짜</b></font></th>
		</tr>
		</thead>
		<tbody class="tbody">
		<tr>
			<td colspan="4" rowspan="4">참여했던 토론 들어가는 곳</td>	
		</tr>
		</tbody>
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