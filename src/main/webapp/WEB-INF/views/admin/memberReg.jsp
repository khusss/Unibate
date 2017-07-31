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
    <script type="text/javascript">
    function delmem(data){
	var retVal = confirm("정말로 강퇴 합니까?");
	var inputdata=data;
	var url='memdeletechk.do?userid='+inputdata;
	if( retVal == true ){
		location.href=url
	}else{
 		history.go(0);
	}
    }
    
    function delmem2(data){
    	var retVal = confirm("정말로 강퇴 합니까?");
    	var inputdata=data;
    	var url='clubdeletechk.do?club_num='+inputdata;
    	if( retVal == true ){
    		location.href=url
    	}else{
     		history.go(0);
    	}
        }
	</script>
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
 		<li role="presentation"><a href="noticeReg.do?pageNum=1">공지 사항 관리</a></li>
  		<li role="presentation"><a href="proposalReg.do?pageNum=1">신고함 관리</a></li>
  		<li role="presentation"><a href="dataReg.do">데이터 분석 관리</a></li>
  		<li role="presentation" class="active"><a href="memberReg.do">회원 관리</a></li>
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
		<div class="row">
			<div class="col-lg-12">
			<form action="memberReg_chk.do" method="get">
			<div class="col-lg-6">
				<button type="submit" class="btn btn-default"  style="height: 200px; width: 200px;">회원 관리</button>
				<input type="hidden" name="option" value="mem" >
			</div>
			</form>
			<form action="memberReg_chk.do" method="get">
			<div class="col-lg-6">
				<button type="submit" class="btn btn-primary"  style="height: 200px; width: 200px;">동아리 관리</button>
				<input type="hidden" name="option" value="club">
			</div>
			</form>
			</div>
		</div>
		<c:if test="${!empty user}">
		<div class="container">
		<table class="table">
			<thead class="thead-inverse">
				<tr>
					<th width="20%">아이디</th>
					<th width="10%">이름</th>
					<th width="35%">이메일</th>
					<th width="10%">학교</th>
					<th width="10%">클럽넘버</th>
					<th width="15%">강퇴</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="user" items="${user}">
				<tr>
					<td>${user.id}</td>
					<td>${user.name}</td>
					<td>${user.email}</td>
					<td>${user.school}</td>
					<td>${user.club_num}</td>
					<td>
						<button type="button" class="btn btn-default" onclick="delmem('${user.id}')" >삭제</button>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	</c:if>
	<c:if test="${!empty club}">
		<div class="container">
		<table class="table">
			<thead class="thead-inverse">
				<tr>
					<th width="10%">번호</th>
					<th width="20%">클럽이름</th>
					<th width="35%">만든날</th>
					<th width="10%">클럽장</th>
					<th width="10%">맴버수</th>
					<th width="15%">삭제</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="club" items="${club}">
				<tr>
					<td>${club.club_num}</td>
					<td>${club.club_name}</td>
					<td>${club.club_make_date}</td>
					<td>${club.id}</td>
					<td>${club.club_mem}</td>
					<td>
						<button type="button" class="btn btn-default" onclick="delmem2('${club.club_num}')" >삭제</button>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	</c:if>


    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>