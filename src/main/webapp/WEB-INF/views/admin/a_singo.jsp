<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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

<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>관리자 페이지</title>
<c:set var="current_page" value="${current_page}" />
<c:set var="total_cnt" value="${total_singo}" />
<style type="text/css">
button {
	height: 200px;
	width: 200px;
}
</style>
<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="admain.do"> <img alt="Brand"
				src="img/Unibate.png" height="30" width="50">
			</a>
		</div>
	</div>
	</nav>
	<br>
	<ul class="nav nav-tabs">
		<li role="presentation" class="active"><a href="#">HOME</a></li>
		<li role="presentation"><a href="realtimeReg.do">실시간 토론 관리</a></li>
		<li role="presentation"><a href="compReg.do">대회 정보 관리</a></li>
		<li role="presentation"><a href="noticeReg.do">공지 사항 관리</a></li>
		<li role="presentation"><a href="proposalReg.do?pageNum=1">신고함 관리</a></li>
		<li role="presentation"><a href="dataReg.do">데이터 분석 관리</a></li>
		<li role="presentation"><a href="memberReg.do">회원 관리</a></li>
		<li role="presentation"><a href="main.do">Unibate 홈으로 이동</a></li>
	</ul>
	<br>
	<br>
	<section class="callaction">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="big-cta">
					<div class="cta-text" align="center">
						<h2>
							<span style="color: skyblue;">UNI</span>BATE - 관리자 페이지
						</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>





	<div class="row">
		<section id="projects">
		<ul id="thumbs" class="portfolio">
			<div class="container">
				<table class="table">
					<tr>
						<td>
					<c:if test="${!empty data}">
					<tr>
						<td colspan="4">
							${data.proposal_content}
						</td>
					</tr>
					</c:if>
						</td>
					</tr>
				</table>
				<table class="table">
				<thead class="thead-inverse">
					<tr>
						<td colspan="4">
						<h5>
							총 신고 건수 :
							<c:out value="${total_singo}" />
							<p align="right">
								페이지 :
								<c:out value="${pageNum}" />
						</h5>
						</td>
					</tr>
					


						<tr>
							<th>신고번호</th>
							<th>신고내용</th>
							<th>신고한 아이디</th>
							<th>신고한 날짜</th>

						</tr>
					</thead>
					<c:set var="number" value="${total_singo-(pageNum-1)*15}" />
					<tbody>
						<c:forEach var="proposal" items="${proposal_List}">
							<tr>
								<td><p align="left">${proposal.proposal_num}</p></td>
								<td><p align="left"><a href="proposal_View.do?pageNum=${pageNum}&proposal_num=${proposal.proposal_num}">${proposal.proposal_subject}</a></p></td>
								<td><p align="left">${proposal.id}</p></td>
								<td><p align="left">${proposal.proposal_date}</p></td>
							</tr>
							<c:set var="number" value="${number-1}" />
						</c:forEach>
					</tbody>
				</table>
				<div class="text-center">
					<ul class="pagination pagination-large">
						<c:if test="${pageNum <= 10}">
							<li class="disabled"><a href="#">Prev</a></li>
						</c:if>
						<c:if test="${pageNum > 10}">
							<li><a href="proposalReg.do?pageNum=${pageNum-10}">Prev</a></li>
						</c:if>
						<c:if test="${pageBlock*10<pageCount}">
							<c:forEach var="i" begin="${pageStart}" step="1" end="${pageEnd}">
								<li><a href="proposalReg.do?pageNum=${i}">${i}</a></li>
							</c:forEach>
						</c:if>
						<c:if test="${pageBlock*10>=pageCount}">
							<c:forEach var="i" begin="${pageStart}" step="1"
								end="${pageCount}">
								<li><a href="proposalReg.do?pageNum=${i}">${i}</a></li>
							</c:forEach>
						</c:if>
						<c:if test="${pageCount <= 10 }">
							<li class="disabled"><a href="#">Next</a></li>
						</c:if>
						<c:if test="${pageCount >= pageNum+10 and pageCount > 10}">
							<li><a href="proposalReg.do?pageNum=${pageNum+10}">Next</a></li>
						</c:if>
						<c:if test="${pageCount < pageNum+10 and pageCount > 10}">
							<li><a href="proposalReg.do?pageNum=${pageCount}">Next</a></li>
						</c:if>
					</ul>
				</div>

			</div>




			<div>
				<form action="/unibate/free_Board_Search.do">
					<input type="hidden" name="pageNum" value="${pageNum}"> <input
						type="hidden" name="board_group_num" value="${board_group_num}">
					<p align="center">
						<input type="text" name="ad_search" size="50" maxlength="50">
						<input type="submit" value="회원찾기">
					</p>

				</form>
			</div>
		</ul>
		</section>
	</div>
	<br>
	<div class="jumbotron">
		<h3 align="right">
			<font color="skyblue">unibate</font> 관리 페이지
		</h3>
		<a href="main.do" style="color: black;"><p align="right">unibate
				홈으로 이동</p></a>
	</div>


	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Placed at the end of the document so the pages load faster -->

</body>
</html>