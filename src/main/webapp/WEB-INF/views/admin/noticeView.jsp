<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>관리자 페이지</title>
    <!-- 부트스트랩 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <c:if test="${sessionScope.userid ne 'administer' || empty sessionScope.userid}">
    <script type="text/javascript">
    	alert('관리자 계정이 아니면 이용 불가능 합니다.');
    	location.href='main.do';
    </script>
    </c:if>
 <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  </head>
  <body>
  <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="admain.do">
        <img alt="Brand" src="img/Unibate.png" height="30" width="50">
      </a>
    </div>
  </div>
</nav>
<br>
    <ul class="nav nav-tabs">
  		<li role="presentation"><a href="admain.do">HOME</a></li>
  		<li role="presentation"><a href="realtimeReg.do">실시간 토론 관리</a></li>
  		<li role="presentation"><a href="compReg.do">대회 정보 관리</a></li>
 		<li role="presentation"  class="active"><a href="noticeReg.do?pageNum=1">공지 사항 관리</a></li>
  		<li role="presentation"><a href="proposalReg.do?pageNum=1">신고함 관리</a></li>
  		<li role="presentation"><a href="dataReg.do">데이터 분석 관리</a></li>
  		<li role="presentation"><a href="memberReg.do">회원 관리</a></li>
  		<li role="presentation"><a href="main.do">Unibate 홈으로 이동</a></li>
	</ul>
	<section class="callaction">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="big-cta">
					<div class="cta-text" align="center">
						<h2><span style="color: skyblue;">UNI</span>BATE - 관리자 페이지</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<br>
	<br>
	<div class="container">
				<div class="row" align="center">
					<div class="col-lg-12" align="center">
					<div class="panel panel-primary" align="center">
  						<div class="panel-heading" align="center"><b> 공 지 사 항 </b></div>
					</div>
					 	<table class=".table">
					 <thead>
					 	<tr>
					 		<th width="90%">${noticeboard.notice_subject}</th>
					 		<th width="20%">${noticeboard.notice_date}</th>
					 		<th width="10%">&nbsp;&nbsp;&nbsp;${noticeboard.notice_hits}</th>
					 	</tr>
					 </thead>
					 <tbody>
					 	<tr height="600">
					 		<td colspan="3">${noticeboard.notice_content}</td>
					 	</tr>
					 	<tr>
					 		<td colspan="2">
					 			<c:if test="${noticeboard.notice_board_num < noticesum}">
  								<a href="noticeRegView.do?pageNum=${pageNum}&notice_num=${noticeboard.notice_board_num+1}"  style="color: black;">
  									<span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>
  									다음글	
  								</a>
  								</c:if>
					 		</td>
					 		<td rowspan="2">
					 			<button class="btn btn-default" aria-label="Left Align" onclick="location.href='noticeReg.do?pageNum=${pageNum}'">
					 				목록
					 			</button>
					 		</td>
					 	</tr>
					 	<tr>
					 		<td colspan="2">
					 		<c:if test="${noticeboard.notice_board_num>1}">
  								<a href="noticeRegView.do?pageNum=${pageNum}&notice_num=${noticeboard.notice_board_num-1}"  style="color: black;">
  									<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
  									이전글
  								</a>
  								</c:if>
					 		</td>
					 	</tr>
					 </tbody>
  					</table>
				</div>
			</div>
	</div>
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>