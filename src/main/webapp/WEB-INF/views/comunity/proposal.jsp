<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>UNIBATE - 대학생들의 토론광장</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="http://bootstraptaste.com" />
<!-- css -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="css/jcarousel.css" rel="stylesheet" />
<link href="css/flexslider.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />

<!-- Theme skin -->
<link href="skins/default.css" rel="stylesheet" />

<!-- =======================================================
    Theme Name: Moderna
    Theme URL: https://bootstrapmade.com/free-bootstrap-template-corporate-moderna/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
======================================================= -->

</head>
<body>
<div id="wrapper">
	<!-- start header -->
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
					<div class="col-lg-12">
						<div class="big-cta">
							<div class="cta-text">
								<h2><span><font size="20">신고</font></span>함</h2>
							</div>
						</div>
						<div class="clearfix">
						</div>
						<div class="row">
							<section id="projects">
								<ul id="thumbs" class="portfolio">
									<div class="container">
									<div class="row">
										<table width="700" align="center" cellspacing="50">
											<sf:form action="reported_com.do" modelAttribute="proposal" method="GET">
											<thead>
												<tr height="60">
													<td rowspan="2">
												</tr>
											</thead>
											<tbody>
												<tr height="50">
													<td width="20%">신고 유형</td>
													<td width="80%">
														<sf:select path="proposal_flag">
															<sf:option value="1">욕설</sf:option>
															<sf:option value="2">음란</sf:option>
															<sf:option value="3">불법자료</sf:option>
															<sf:option value="4">운영자사칭</sf:option>
															<sf:option value="5">불법거래</sf:option>
															<sf:option value="6">스팸/광고</sf:option>
															<sf:option value="7">기타</sf:option>
														</sf:select>
													</td>		
												</tr>
												<tr height="50">
													<td>제목</td>
													<td>
														<sf:input path="proposal_subject" size="30" />
													</td>
												</tr>
												<tr>
													<td>내용</td>
													<td><sf:textarea rows="10" cols="60" path="proposal_content"></sf:textarea></td>
												</tr>
												<tr height="50">
													<td></td>
													<td>
														<input type="submit" value="신고하기" onclick="alert('신고가 접수 되었습니다.')"> &nbsp;&nbsp;&nbsp;
														<input type="reset" value="다시 쓰기">
														<sf:hidden path="id" value="123" />
													</td>
												</tr>
											</tbody>
											</sf:form>
										</table>
									</div>
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
				<div class="col-lg-12">
					<div class="copyright">
						<p>&copy; Unibate Theme. All right reserved.</p>
                        <div class="credits">
                            <!-- 
                                All the links in the footer should remain intact. 
                                You can delete the links only if you purchased the pro version.
                                Licensing information: https://bootstrapmade.com/license/
                                Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Moderna
                            -->
                            <a href="https://www.unibate.co.kr/">UNIBATE</a> by <a href="https://www.unibate.co.kr/">UNIBATE TEAM</a>
                        </div>
					</div>
				</div>
				<div class="col-lg-6">
					<ul class="social-network">
						<li><a href="#" data-placement="top" title="Facebook"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#" data-placement="top" title="Twitter"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#" data-placement="top" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
						<li><a href="#" data-placement="top" title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
						<li><a href="#" data-placement="top" title="Google plus"><i class="fa fa-google-plus"></i></a></li>
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