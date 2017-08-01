<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <li class="dropdown active">
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
		<section id="inner-headline">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<ul class="breadcrumb">
							<li><a href="#"><i class="fa fa-home"></i></a><i
								class="icon-angle-right"></i></li>
							<li class="active">독서토론 / 교육</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<section id="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<ul class="portfolio-categ filter">
							<li class="it"><a href="/unibate/free_Board_List.do?board_group_num=21&pageNum=1">IT/과학</a></li>
							<li class="social"><a href="/unibate/free_Board_List.do?board_group_num=22&pageNum=1" title="">사회/정치</a></li>
							<li class="literature"><a href="/unibate/free_Board_List.do?board_group_num=23&pageNum=1" title="">문학</a></li>
							<li class="edu"><a href="/unibate/free_Board_List.do?board_group_num=24&pageNum=1" title="">교육</a></li>
							<li class="philosophy"><a href="/unibate/free_Board_List.do?board_group_num=25&pageNum=1" title="">철학</a></li>
							<li class="sport"><a href="/unibate/free_Board_List.do?board_group_num=26&pageNum=1" title="">스포츠</a></li>
							<li class="environment"><a href="/unibate/free_Board_List.do?board_group_num=27&pageNum=1" title="">환경</a></li>
						</ul>
						<div class="clearfix"></div>
						<div class="row">
							<section id="projects">
								<ul id="thumbs" class="portfolio">
									<div class="container">
										<table class="table">
											<thead class="thead-inverse">
													<tr>
													<th>글번호</th>
													<th>주제</th>
													<th>작성일자</th>
													<th>조회수</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${ad_board_list}" var="x">
												<tr>
												<th scope="row">${x.array_num}</th>
												<td><a href="/unibate/book_reply_view.do?ad_board_num=${x.ad_board_num}&pageNum=${pageNum}&board_group_num=${board_group_num}">${x.ad_subject}</a></td>
												<td>${x.board_date}</td>
												<td>${x.board_count}</td>
												</tr>
											</c:forEach>	
											</tbody>
										</table>


									</div>

							<div class="text-center">
	<ul class="pagination pagination-large">
		<c:if test="${pageNum <= 10}">
			<li class="disabled"><a href="#">Prev</a></li>
		</c:if>
		<c:if test="${pageNum > 10}">
			<li><a href="/unibate/free_Board_List.do?pageNum=${pageNum-10}&board_group_num=${board_group_num}">Prev</a></li>
		</c:if>
		<c:if test="${pageBlock*10<pageCount}">
			<c:forEach var="i" begin="${pageStart}" step="1" end="${pageEnd}">
				<li><a href="/unibate/free_Board_List.do?pageNum=${i}&board_group_num=${board_group_num}">${i}</a></li>
			</c:forEach>
		</c:if>
		<c:if test="${pageBlock*10>=pageCount}">
			<c:forEach var="i" begin="${pageStart}" step="1" end="${pageCount}">
				<li><a href="/unibate/free_Board_List.do?pageNum=${i}&board_group_num=${board_group_num}">${i}</a></li>
			</c:forEach>
		</c:if>
		<c:if test="${pageCount <= 10 }">
			<li class="disabled"><a href="#">Next</a></li>
		</c:if>
		<c:if test="${pageCount >= pageNum+10 and pageCount > 10}">
			<li><a href="/unibate/free_Board_List.do?pageNum=${pageNum+10}&board_group_num=${board_group_num}">Next</a></li>
		</c:if>
		<c:if test="${pageCount < pageNum+10 and pageCount > 10}">
			<li><a href="/unibate/free_Board_List.do?pageNum=${pageCount}&board_group_num=${board_group_num}">Next</a></li>
		</c:if>
	</ul>
</div>
<div>
<form action="/unibate/free_Board_Search.do">
<input type="hidden" name="pageNum" value="${pageNum}">
<input type="hidden" name="board_group_num" value="${board_group_num}">
<p align="center"><input type="text" name="ad_search" size="50" maxlength="50">
<input type="submit" value="글찾기"></p>

</form>
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