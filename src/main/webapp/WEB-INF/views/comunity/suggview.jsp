<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="utf-8">
<title>UNIBATE - 대학생들의 토론광장</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="http://bootstraptaste.com" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

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
<script type="text/javascript">
function limitRe(){
	alert('댓글 작성후에는 1분후에 다시 작성 가능합니다.');
	history.go(0)
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
	<section id="inner-headline">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<ul class="breadcrumb">
							<li><a href="suggestion.do?pageNum=${pageNum}"><i class="fa fa-home"></i></a><i
								class="icon-angle-right"></i></li>
							<li class="active">주제건의</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
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
										<a href="#">${board.suggestion_subject}</a>
									</h3>
								</div>
							</div>
							<p>${board.suggestion_content}</p>
							<div class="bottom-article">
								<ul class="meta-post">
									<li><i class="icon-calendar"></i><a href="#">${board.suggestion_date}</a></li>
									<li><i class="icon-comments"></i><a href="#">조회수
											${board.suggestion_hit}</a></li>
									<li><i class="icon-comments"></i><a href="#">댓글수
											${reply_count}</a></li>
											<c:if test="${sessionScope.userid eq board.id }">
									<li><i class="icon-comments"></i><a href="deleteSugg.do?pageNum=${pageNum}&suggest_num=${suggest_num}">글삭제
											${reply_count}</a></li>
									</c:if>
								</ul>
							</div>
							</article>
							<div>
								<form action="s_reply_insert.do" method="get" role="form" class="contactForm">
									<input type="hidden" name="pageNum" value="${pageNum }"> 
									<input type="hidden" name="suggest_num" value="${board.suggestion_board_num}">
									<div class="form-group">
										<textarea class="form-control" name="suggest_reply" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message">
										</textarea>
										<div class="validation"></div>
									</div>
								
									<c:if test="${empty sessionScope.tReply}">
										<c:if test="${!empty sessionScope.userid}">
											<div class="text-center">
											<button type="submit" class="btn btn-theme">댓글 달기</button>
											</div>
										</c:if>
										<c:if test="${empty sessionScope.userid}">
										<div class="text-center">
											<button type="button" class="btn btn-theme" onclick="alert('로그인 후 이용해 주세요.')">댓글 달기</button>
										</div>
										</c:if>
									</c:if>
									<c:if test="${!empty sessionScope.tReply}">
											<fmt:parseDate var="tReply" value="${sessionScope.tReply}" pattern="yyyy-MM-dd HH:mm:ss" />
											<!-- 두값을 비교하기위해 time format(millisecond)의 숫자형으로 변환 -->
											<fmt:parseNumber value="${toDay.time}" integerOnly="true" var="nTime" scope="request" />
											<fmt:parseNumber value="${tReply.time}" integerOnly="true" var="replyT" scope="request" />
											<fmt:parseNumber value="${(nTime-replyT)/(1000*60)}" integerOnly="true" var="timer" scope="request" />
											${timer}
										<c:if test="${timer>=1}">
											<div class="text-center">
											<button type="submit" class="btn btn-theme">댓글 달기</button>
											</div>
										</c:if>
										<c:if test="${timer<1}">
											<div class="text-center">
												<button type="button" class="btn btn-theme" onclick="limitRe()">댓글 달기</button>
											</div>
										</c:if>
									</c:if>
								</form>
							</div>
							<table>
								<tr>
									<td>
										<div>
											<table class="table">
												<tbody>
													<c:forEach items="${reply}" var="x" varStatus="status" begin="0" step="1" end="${rlen}">
														<tr>
															<td colspan="6"><div class="media">
																	<div class="media-left media-middle">
																		<a href="#">
																			<img class="media-object" src="img/default_img.PNG" width="10%" height="20%">
																		</a>
																	</div>
																	<div class="media-body">
																		<h4 class="media-heading">${x.id}</h4>
																	</div>
																</div>
															</td>
														</tr>
														<tr>
														<c:if test="${!empty sessionScope.userid and replychk[status.index]==0}">
															<td width="800px">${x.sg_reply}</td>
															<c:if test="${sessionScope.userid eq x.id}">
															<td><button class="btn btn-success" onclick="alert('본인 댓글 에는 불가능 합니다.')">
																	<div class="glyphicon glyphicon-thumbs-up" />
																</button>
															</td>
															<td><span class="badge">${x.sg_like}</span></td>
															<td><button class="btn btn-warning" onclick="alert('본인 댓글 에는 불가능 합니다.')">
																	<div class="glyphicon glyphicon-thumbs-down" />
																</button>
															</td>
															</c:if>
															<c:if test="${sessionScope.userid ne x.id}">
															<td><button class="btn btn-success" onclick="location.href='sg_replylike.do?pageNum=${pageNum}&suggest_num=${suggest_num}&sg_reply_num=${x.sg_reply_num}&val=like'">
																	<div class="glyphicon glyphicon-thumbs-up" />
																</button>
															</td>
															<td><span class="badge">${x.sg_like}</span></td>
															<td><button class="btn btn-warning" onclick="location.href='sg_replylike.do?pageNum=${pageNum}&suggest_num=${suggest_num}&sg_reply_num=${x.sg_reply_num}&val=dlike'">
																	<div class="glyphicon glyphicon-thumbs-down" />
																</button>
															</td>
															</c:if>
														</c:if>
														<c:if test="${!empty sessionScope.userid and replychk[status.index]!=0}">
															<td width="800px">${x.sg_reply}</td>
															<td><button class="btn btn-success" onclick="alert('이미 공감을 하셨습니다.')">
																	<div class="glyphicon glyphicon-thumbs-up" />
																</button>
															</td>
															<td><span class="badge">${x.sg_like}</span></td>
															<td><button class="btn btn-warning" onclick="alert('이미 공감을 하셨습니다.')">
																	<div class="glyphicon glyphicon-thumbs-down" />
																</button>
															</td>
														</c:if>
														<c:if test="${empty sessionScope.userid}">
															<td width="800px">${x.sg_reply}</td>
															<td><button class="btn btn-success" onclick="alert('로그인 후 사용해 주세요.')">
																	<div class="glyphicon glyphicon-thumbs-up" />
																</button>
															</td>
															<td><span class="badge">${x.sg_like}</span></td>
															<td><button class="btn btn-warning" onclick="alert('로그인 후 사용해 주세요.')">
																	<div class="glyphicon glyphicon-thumbs-down" />
																</button>
															</td>
														</c:if>
															<td><span class="badge">${x.sg_dislike}</span></td>
															<!-- 여기부터는 반복문 안쪽 -->
															<fmt:parseDate var="regDate" value="${x.sg_reply_date}" pattern="yyyy-MM-dd HH:mm:ss" />
															<!-- 두값을 비교하기위해 time format(millisecond)의 숫자형으로 변환 -->
															<fmt:parseNumber value="${toDay.time}" integerOnly="true" var="nowTime" scope="request" />
															<fmt:parseNumber value="${regDate.time}" integerOnly="true" var="replyTime" scope="request" />
															<fmt:parseNumber value="${(nowTime-replyTime)/(1000*60)}" integerOnly="true" var="result" scope="request" />
															<!-- 아래는 비교문 -->
															<td><span class="label label-info">
															<c:if test="${result < 60 }">
																${result}분 전
															</c:if>
															<c:if test="${result >= 60 and result < 60*24}">
																		<fmt:parseNumber value="${result/60}" integerOnly="true" var="result" scope="request" />
																		${result}시간 전
															</c:if> 
															<c:if test="${result >= 60*24 and result < 60*24*31}">
																<fmt:parseNumber value="${result/(60*24)}" integerOnly="true" var="result" scope="request" />
																${result}일 전
															</c:if>
															<c:if test="${ result >= 60*24*31 and result < 60*24*31*12}">
																<fmt:parseNumber value="${result/31}" integerOnly="true" var="result" scope="request" />
																${result}달 전
															</c:if>
															<c:if test="${ result >= 60*24*31*12}">
																<fmt:parseNumber value="${result/12}" integerOnly="true" var="result" scope="request" />
																${result}년 전
															</c:if>
															</span>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>

										</div>
									</td>
								</tr>
							</table>
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