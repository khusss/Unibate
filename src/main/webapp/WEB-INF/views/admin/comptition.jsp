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
  		<li role="presentation" class="active"><a href="compReg.do">대회 정보 관리</a></li>
 		<li role="presentation"><a href="noticeReg.do?pageNum=1">공지 사항 관리</a></li>
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
						<h2><span style="color: skyblue;">UNI</span>BATE - 관리자 페이지</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<br><br><br><br><br>
	<div class="container">
		<table class="table">
			<thead class="thead-inverse">
				<tr>
					<th width="5%">번호</th>
					<th width="70%">대회명</th>
					<th width="15%">장소</th>
					<th width="10%">대회일자</th>
					</tr>
			</thead>
			<tbody>
			<c:if test="${!empty comp}">
			<c:forEach var="compit" items="${comp}">
				<tr>
					<td>
						<span class="badge badge-warning">${counter}</span></td>
						<th scope="row"><a href="#" onclick="javascript:window.open('${compit.competition_url}','_blank')">${compit.competition_name}</a></th>
						<td>${compit.competition_local}</td>
						<td>${compit.competition_date}</td>
						</tr>
						<c:set var="counter" value="${counter = counter-1 }" />
			</c:forEach>
			</c:if>
			<c:if test="${empty comp}">
				<tr>
					<td colspan="4">
						입력된 대회 정보가 없습니다.
					</td>
				</tr>
			</c:if>
			</tbody>
		</table>
	</div>
	<form action="compcheck.do" method="POST">
	<div class="container" align="center">
	<div class="input-group">
		<span class="input-group-addon" id="sizing-addon2">대회이름</span>
  		<input type="text" name="competition_name" class="form-control" placeholder="대회이름" aria-describedby="sizing-addon2">
	</div>
	<br>
	<div class="input-group">
		<span class="input-group-addon" id="sizing-addon2">대회장소</span>
  		<input type="text" name="competition_local" class="form-control" placeholder="대회장소" aria-describedby="sizing-addon2">
	</div>
	<br>
	<div class="input-group">
		<span class="input-group-addon" id="sizing-addon2">홈패이지주소</span>
  		<input type="text" class="form-control" name="competition_url" placeholder="홈패이지주소" aria-describedby="sizing-addon2">
	</div>
	<br>
	<div class="input-group">
		<span class="input-group-addon" id="sizing-addon2">년</span>
  		<input type="text"  name="year" class="form-control" placeholder="ex)2017" aria-describedby="sizing-addon2">
  		<span class="input-group-addon" id="sizing-addon2">월</span>
  		<input type="text" name="mon" class="form-control" placeholder="ex)07" aria-describedby="sizing-addon2">
  		<span class="input-group-addon" id="sizing-addon2">일</span>
  		<input type="text" name="date" class="form-control" placeholder="ex)06" aria-describedby="sizing-addon2">
	</div>
	<br>
	<button type="submit" class="btn btn-default">토론 관리</button>
	</div>
	<form>
	<br>
	<br>
	<br>
	<br>
	<div class="jumbotron" >
  		<h3 align="right"><font color="skyblue">unibate</font> 관리 페이지</h3>
  		<a href="main.do" style="color: black;"><p align="right">unibate 홈으로 이동</p></a>
	</div>


    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>