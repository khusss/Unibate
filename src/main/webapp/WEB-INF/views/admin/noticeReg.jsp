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
  <script type="text/javascript">
  function delmem(data){
		var retVal = confirm("정말로 삭제 합니까?");
		var inputdata=data;
		var url='noticedel.do?notice_num='+inputdata+"&pageNum="+${pageNum};
		if( retVal == true ){
			location.href=url
		}else{
	 		history.go(0);
		}
	    }
  </script>
 <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
										<table class="table">
											<thead class="thead-inverse">
												<tr>
													<th colspan="4" align="center">
													<button type="button" class="btn btn-default" onclick="location.href='insertNotice.do?pageNum=${pageNum}'" >공지사항쓰기
													</button>
													</th>
												</tr>
												<tr>
													<th width="15%">번호</th>
													<th width="65%">제목</th>
													<th width="10%">게시일자</th>
													<th width="10%">삭제</th>
												</tr>
											</thead>
											<c:set var="number" value="${allNotice-(pageNum-1)*15}" />
											<tbody>
											<c:forEach items="${nboard}" var="nb">
												<tr>
													<td>${nb.notice_board_num}</td>
													<th scope="row"><a href="noticeRegView.do?pageNum=${pageNum}&notice_num=${nb.notice_board_num}">${nb.notice_subject}</a></th>
													<td>${nb.notice_date}</td>
													<td>
														<button type="button" class="btn btn-default" onclick="delmem('${nb.notice_board_num}')" >삭제</button>
													</td>
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
													<li><a href="notice.do?pageNum=${pageNum-10}">Prev</a></li>
												</c:if>
												<c:if test="${pageBlock*10<pageCount}">
													<c:forEach var="i" begin="${pageStart}" step="1" end="${pageEnd}">
														<li><a href="notice.do?pageNum=${i}">${i}</a></li>
													</c:forEach>
												</c:if>
												<c:if test="${pageBlock*10>=pageCount}">
													<c:forEach var="i" begin="${pageStart}" step="1" end="${pageCount}">
														<li><a href="notice.do?pageNum=${i}">${i}</a></li>
													</c:forEach>
												</c:if>
												<c:if test="${pageCount <= 10 }">
													<li class="disabled"><a href="#">Next</a></li>
												</c:if>
												<c:if test="${pageCount >= pageNum+10 and pageCount > 10}">
													<li><a href="notice.do?pageNum=${pageNum+10}">Next</a></li>
												</c:if>
												<c:if test="${pageCount < pageNum+10 and pageCount > 10}">
													<li><a href="notice.do?pageNum=${pageCount}">Next</a></li>
												</c:if>
											</ul>
										</div>
									</div>
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>