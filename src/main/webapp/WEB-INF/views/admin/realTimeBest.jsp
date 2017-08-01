<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>관리자 페이지</title>
	<style type="text/css">
	button{height: 200px; width: 200px;}
	</style>
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
<script type="text/javascript">
function sendcheck(){

    	if(fr.check_subj.value == "") {
    	    alert("값을 선택해 주세요.");

  
    	    return false;
    	  }

    
 		alert("등록완료!")
    	return true; 	
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
  		<li role="presentation"><a href="#">HOME</a></li>
  		<li role="presentation" class="active"><a href="realtimeReg.do">실시간 토론 관리</a></li>
  		<li role="presentation"><a href="compReg.do">대회 정보 관리</a></li>
 		<li role="presentation"><a href="noticeReg.do">공지 사항 관리</a></li>
  		<li role="presentation"><a href="proposalReg.do">신고함 관리</a></li>
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
						<h2><span style="color: skyblue;">UNI</span>BATE - 관리자 실시간 토론</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<br><br><br><br><br>
	<section id="content">
	<div class="container">
		<div class="row">
		<form action="bestInsert.do" id="fr"  name="fr" onsubmit='return sendcheck()'>
			<table class="table">
			<tr>
			<td width="10%">년도</td>
			<td><input type="text" name="best_year"></td>
			<td width="10%">월</td>
			<td><input type="text" name="best_month"></td>
			</tr>
			<c:forEach items="${rtResult}" var="x">
			<tr>
				
				<td>${x.d_num}<input type="hidden" value="${x.d_num}" name="d_num"></td>
				<td >토론제목:</td>
				<td colspan="2"><input type="radio" value="${x.d_subject}" name="check_subj">${x.d_subject}</td>
		
			</tr>
			</c:forEach>
			<tr>
					
				<td colspan="4"> <input type="submit" value="작성하기" class="btn btn-default" >
				
				</td>
			</tr>
			</table>
		</form>	
		</div>
		<br>
		<br>
		<br>
		
	</div>
	</section>
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