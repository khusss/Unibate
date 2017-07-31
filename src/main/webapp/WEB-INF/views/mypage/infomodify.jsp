<%@ page language ="java" contentType="text/html; charset=UTF-8"
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	  $("#email_address").blur(function(){
		  emailAjax();
		});
	  
	  $("#password1").blur(function(){
		  pwdAjax();
		});
	  
	  $("#name").blur(function(){
		  nameAjax();
		});
	  $("#school").blur(function(){
		  schoolAjax();
		});
	  $("#major").blur(function(){
		  majorAjax();
		});

	 });


	 function idAjax() {
	  $.ajax({
	   type : "post",
	   url : "id_check.do",
	   data : {
		  id : $('#mem_id').val()
	   },
	   success : whenSuccess,
	   error : whenError
	  });
	 }
	 
	 function emailAjax() {
		  $.ajax({
		   type : "post",
		   url : "email_check.do",
		   data : {
			  e_mail : $('#email_address').val()
		   },
		   success : emailSuccess,
		   error : whenError
		  });
	}
	 
	 function pwdAjax() {
		  $.ajax({
		   type : "post",
		   url : "pwd_check.do",
		   data : $("form[name=member_insert]").serialize(),
		   success : pwdSuccess,
		   error : whenError
		  });
	}
	 
	 function nameAjax(){
		  $.ajax({
		   type : "post",
		   url : "name_check.do",
		   data : {
			  name : $('#name').val()
		   },
		   success : nameSuccess,
		   error : whenError
		  });
		}
	 function schoolAjax(){
		  $.ajax({
		   type : "post",
		   url : "school_check.do",
		   data : {
			  school : $('#school').val()
		   },
		   success : schoolSuccess,
		   error : whenError
		  });
		}
	 function majorAjax(){
		  $.ajax({
		   type : "post",
		   url : "major_check.do",
		   data : {
			  major : $('#major').val()
		   },
		   success : majorSuccess,
		   error : whenError
		  });
		}
	 
	 
	 function whenSuccess(resdata) {
	  $("#check_id").html(resdata);
	  console.log(resdata);
	 }
	 
	 function emailSuccess(resdata) {
		  $("#check_email").html(resdata);
		  console.log(resdata);
		}
	 
	 function pwdSuccess(resdata) {
		  $("#check_pwd").html(resdata);
		  console.log(resdata);
	 }
	 
	 function nameSuccess(resdata) {
		  $("#check_name").html(resdata);
		  console.log(resdata);
	 }
	 
	 function schoolSuccess(resdata) {
		  $("#check_school").html(resdata);
		  console.log(resdata);
	 }
	 
	 function majorSuccess(resdata) {
		  $("#check_major").html(resdata);
		  console.log(resdata);
	 }
	 
	 function whenError() {
	  alert("Error");
	 } 

</script>

 
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
                        <li class="active">
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
                                <li><a href="science.do">IT / 과학</a></li>
                                <li><a href="social.do">사회 / 정치</a></li>
								<li><a href="literature.do">문학</a></li>
								<li><a href="education.do">교육</a></li>
								<li><a href="philosophy.do">철학</a></li>
								<li><a href="sport.do">스포츠</a></li>
								<li><a href="environment.do">환경</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">자유독서토론<b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="b_science.do">IT / 과학</a></li>
                                <li><a href="b_social.do">사회 / 정치</a></li>
								<li><a href="b_literature.do">문학</a></li>
								<li><a href="b_education.do">교육</a></li>
								<li><a href="b_philosophy.do">철학</a></li>
								<li><a href="b_sport.do">스포츠</a></li>
								<li><a href="b_environment.do">환경</a></li>
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
                        
                        
                        <c:if test="${empty sessionScope.userid}">
                        <li>
                        	<a href="login.do">로그인</a>
                        </li>
                       	</c:if>
                        <c:if test="${!empty sessionScope.userid}">
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
                        </c:if>
                       
                        <!-- 회원가입 패이지는 singup.do -->
                    </ul>
                </div>
            </div>
        </div>
	</header>
	<c:if test="${!empty realert}">
		<script type="text/javascript">
			alert('${realert}');
		</script>
	</c:if>
	<div class="container" align="center">						
	<div class="row">
	<div class="col-lg-12">
	 <article class="container">
        <div class="page-header">
          <h1>Unibate <small>정보수정</small></h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form action="info_modify.do" method="post" name="member_insert">
          	<div class="form-group">
              <label for="InputID">아이디</label>
              <input type="text" name="id" id="mem_id" value="${sessionScope.userid}" class="form-control" readonly="readonly">
              <div id="check_id"></div>
            </div>
            <div class="form-group">
              <label for="InputEmail">이메일 주소</label>
              <input type="text" name="email_address" id="email_address" class="form-control" value="${user.email}" readonly="readonly"  placeholder="이메일 주소">
              <div id="check_email"></div>
            </div>
            <div class="form-group">
              <label for="InputPassword">비밀번호</label>
              <input type="password" id="password" name="password"  class="form-control"  placeholder="비밀번호">
            </div>
            <div class="form-group">
              <label for="InputPassword1">비밀번호 확인</label>
              <input type="password" name="password1" id="password1" class="form-control" onblur="checkpwd()"  placeholder="비밀번호 확인">
              <div id="check_pwd"></div>
            </div>
            <div class="form-group">
              <label for="username">이름</label>
              <input type="text" name="name" id="name" value="${user.name}" readonly="readonly" class="form-control"  placeholder="이름을 입력해 주세요">
              <div id="check_name"></div>
            </div>
            <div class="form-group">
              <label for="school">학교</label>
              <input type="text" name="school" id="school" class="form-control"  placeholder="학교를 입력해 주세요">
              <div id="check_school"></div>
            </div>
            <div class="form-group">
              <label for="school">전공</label>
              <input type="text" name="major" id="major" class="form-control"  placeholder="전공을 입력해 주세요">
              <div id="check_major"></div>
            </div>
            <div class="form-group">
              <label for="지역">지역</label>
              <div class="form-group">
  				<select class="form-control" id="area" name="area">
   					<option value="서울">서울</option>
   					<option value="경기">경기</option>
   				 	<option value="강원도">강원도</option>
    				<option value="충청도">충청도</option>
    				<option value="전라도">전라도</option>
    				<option value="경상도">경상도</option>
    				<option value="제주도">제주도</option>
 				</select>
			</div>
            </div>
            <div class="form-group text-center">
              <button type="submit" class="btn btn-primary">정보수정<i class="fa fa-check spaceLeft"></i></button>
              <button type="reset" class="btn btn-primary">다시입력<i class="fa fa-times spaceLeft"></i></button>
              <button type="button"  class="btn btn-primary" onclick="location.href='mem_leave.do?club_num=${user.club_num}'">탈퇴하기<i class="fa fa-times spaceLeft"></i></button>
            </div>
          </form>
          
        </div>
        </div>
        </div>
        </div>
        
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