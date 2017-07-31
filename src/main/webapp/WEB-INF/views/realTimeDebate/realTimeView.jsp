<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>UNIBATE - 대학생들의 토론광장</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="http://bootstraptaste.com" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- css -->
<style type="text/css">
.graph_comm {
	float: left
}

.graph_comm .bg_graph {
	float: left;
	margin: 5px 6px 0 6px;
	border-top: 1px solid #bbb
}

.graph_comm .graph_g {
	display: block;
	width: 143px;
	height: 5px;
	border: 1px solid #d4d4d4;
	background-color: #e1e1e1
}

.graph_comm .bar_g {
	display: block;
	height: 17px;
	margin: -2px 0 0 -1px;
	border-left: 1px solid #a1342d;
	border-top: 1px solid #a1342d;
	background-color: #d4443b
}

.graph_comm .inner_g {
	display: block;
	height: 15px;
	margin-left: -1px;
	border: 1px solid #bc3c35
}

.graph_comm .txt_graph {
	font-size: 15 px;
	font-family: tahoma;
	color: #666
}

.graph_comm .num_g {
	color: #d4443b
}

#best_reply{
float: right;
width: 40%

}
#reply{
clear: both; 
}

/* Style the tab */
div.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}



#real_left{
float: left;
overflow:auto;
width: 38%;
height:600px;

}
#real_right{
float: right;
overflow:auto;
width: 38%;
height: 600px; 
}
#real_center{
float: left;
text-align:center !important;
width: 24%;
height: 600px; 
}
#no1{
background-color: blue;
float: left;
color: white;
}
#no2{

background-color: red;
float: right;
color: white;

}
#col-main:after{

  background: url('img/back_img.jpg') no-repeat center top; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: 100%;
	opacity: 0.4;
    filter: alpha(opacity=40);

}

</style>
<link href="css/bootstrap.min.css" rel="stylesheet" /> 
 <link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="css/jcarousel.css" rel="stylesheet" />
<link href="css/flexslider.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" /> 

<link href="skins/default.css" rel="stylesheet" /> 

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 




<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> 

<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet">





<script type="text/javascript">

function like_button(ad_like,ad_reply_num,ad_board_num,pageNum,board_group_num){
	
	location.href = '/unibate/reply_update_view.do?ad_like='+ad_like+'&ad_reply_num='+ad_reply_num+'&ad_board_num='+ad_board_num+'&pageNum='+pageNum+'&board_group_num='+board_group_num;
	
}
function dislike_button(ad_dislike,ad_reply_num,ad_board_num,pageNum,board_group_num){
	location.href = '/unibate/reply_update2_view.do?ad_dislike='+ad_dislike+'&ad_reply_num='+ad_reply_num+'&ad_board_num='+ad_board_num+'&pageNum='+pageNum+'&board_group_num='+board_group_num;
	
}

function dateToYYYYMMDD(date){
    function pad(num) {
        num = num + '';
        return num.length < 2 ? '0' + num : num;
    }
    return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
}

function agree_team(){
    <%
    Object obj1 = session.getAttribute("userid");
    if (obj1 != null) {%> 

       location.href="agree_team.do"
       return true;

   <%      
    }else{

%>alert("로그인이 필요합니다");
return false;
<%

    }

%>
}
function disagree_team(){
    <%
    Object obj2 = session.getAttribute("userid");
    if (obj2 != null) {%> 
     
       location.href="disagree_team.do"

       return true;

   <%      
    }else{

%>alert("로그인이 필요합니다");
return false;
<%

    }

%>
}


function check() {
	if(fr.ad_reply.value == "") {
	    alert("값을 입력해 주세요.");
	    fr.ad_reply.focus();
	    return false;
	  }
    
    <%
    Object obj = session.getAttribute("userid");
    if (obj != null) {%> 
       alert("작성완료");
       
       return true;

   <%      
    }else{

%>alert("로그인이 필요합니다");
return false;

<%

    }

%>
}

function insert(){
	
	if(fr2.d_opinion.value == "") {
	    alert("값을 입력해 주세요.");
	    fr2.d_opinion.focus();
	    return false;
	  }
	
	

	alert("등록완료!")
	
	return true;
	
	
}

function team_cancel(){
	
       var confirmflag = confirm("취소할 경우 지금까지 작성한 의견은 모두 삭제 됩니다.취소하시겠습니까?");
 
       if(confirmflag){
          location.href='team_cancel.do'
         
          return true;
       }else{
       return false;
   }

	
	
}
function cheer_up(id){

	   var confirmflag = confirm("응원은 하루에 한번만 가능 합니다. 응원할까요?");
	   
       if(confirmflag){
         location.href='real_like_up.do?id='+id
         
          return true;
       }else{
       return false;
   }

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
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="dropdown active">
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

		<section id="content">
		<div class="container">
			<div class="row">

				<div class="row">
					<section id="projects">
					<ul id="thumbs" class="portfolio">
						<div class="container">
						<article>

							<div class="post-image">
								<div class="post-heading" align="center">

									<h3 align="center" >
										<a href="#" style="font-family: 'Jeju Gothic', serif;">${rt_debate.d_subject}</a>
									</h3>
								</div>
								<a href="${rt_debate.d_content}">관련기사</a> 
							
							</div>
							
							<p align="center">
							<iframe src="${rt_debate.d_content}" width="100%" height="400"></iframe>
							</p>

						<fmt:parseDate var="regDate" value="${at}" pattern="yyyy-MM-dd HH:mm:ss" />	
						<fmt:parseNumber value="${toDay.time}" integerOnly="true" var="nowTime" scope="request" />
						<fmt:parseNumber value="${regDate.time}" integerOnly="true" var="afterTime" scope="request" />
						<fmt:parseNumber value="${(afterTime-nowTime)/(1000*60)}" integerOnly="true" var="result" scope="request" />
							
							<div class="bottom-article">
							<p align="center" style="font-family: 'Jeju Gothic', serif;">

									<c:if test="${result < 60 }">
  											 ${result}분 후 마감
									</c:if>
									
									<c:if test="${result >= 60 and result < 60*24}">
										<fmt:parseNumber value="${result/60}" integerOnly="true" var="result" scope="request" />
     								 ${result}시간 후 마감
									</c:if>
									
									<c:if test="${result >= 60*24 and result < 60*24*31}">
										<fmt:parseNumber value="${result/(60*24)}" integerOnly="true" var="result" scope="request" />
      								
      								${result}일 후 마감
									</c:if>
									
									<c:if test="${ result >= 60*24*31 and result < 60*24*31*12}">
									${result}달 후 마감
									</c:if>
									
									<c:if test="${ result >= 60*24*31*12}">
									${result}년 후 마감
									</c:if>

								</p>

							</div>	
				</article>
				<div id="real_left">
				<table class="table">
					<thead align="right">
						<tr align="right">
						<th align="right" colspan="2" style="font-family: 'Jeju Gothic', serif; font-size: x-large;"><b>찬성측 참여자 ${agree_team_count} 명</b></th>
						
						</tr>
					</thead>
				
				<tbody >

				<c:forEach items="${rt_opinion}" var="x">
				<c:if test="${!empty x.d_opinion }">
				<c:if test="${x.group_num == '1'}">
				
					<tr >
						<td width="25%" style="font-family: 'Jeju Gothic', serif;"><b>${x.school}학교 ${x.id}:</b></td>
						
						<td width="75%" style="font-family: 'Nanum Gothic', serif;">${x.d_opinion}</td>

					</tr>
					
				</c:if>	
				</c:if>	
				</c:forEach>
	
				</tbody>
					
					<tr>
						<td></td>
				
					</tr>
				

				
				</table>
				
				</div>
				<div id="real_center">
				<table height="275px" align="center">
				<thead >
				<tr>
					<th align="center" style="font-family: 'Jeju Gothic', serif;"><b>찬성 팀 목록</b></th>
				
						<c:choose>
                        	<c:when test="${my_group_num == 1}">
                        	<c:choose>
                        	<c:when test="${!empty sessionScope.userid}">
                        				<th align="center" style="font-family: 'Jeju Gothic', serif;"><button class="btn btn-default" onclick="team_cancel()">취소</button></th>
                      		</c:when>
                      			<c:otherwise>
                      			
                      					<th align="center" style="font-family: 'Jeju Gothic', serif;"><button class="btn btn-default" onclick="agree_team()">참가</button></th>
                      			</c:otherwise>
                        	</c:choose>
                        	</c:when>
                        	<c:otherwise>
                        		<th align="center" style="font-family: 'Jeju Gothic', serif;"><button class="btn btn-default" onclick="agree_team()">참가</button></th>
                        	</c:otherwise>
                        </c:choose>
					
					
					
					
				</tr>
				</thead>
				
			<div id="agree_team_mem" style="overflow: auto;">
				<tbody>				
				<tr>
					<td colspan="2">
						<ol>
				
				
						<c:forEach items="${real_agree_member}" var="x">
								
				 				<li style="font-family: 'Jeju Gothic', serif;"> ${x.name}&nbsp;(${x.id})&nbsp;&nbsp;<span>
				 				 <c:choose>
									<c:when test="${!empty sessionScope.userid}">
										<button class="btn btn-default" onclick="cheer_up('${x.id}')">
											<i class="glyphicon glyphicon-thumbs-up">&nbsp;${x.opinion_num}</i>
											</button>
										</span> 
									</c:when> 
								<c:otherwise>
								</c:otherwise> 
								</c:choose>
								</li>
					</c:forEach>
						</ol>
					</td>
				</tr>
				
				</tbody>
				</div>
				</table>
				
				
				<table height="50px" align="center">
					<tr align="center">
						<td align="center"><font size="10px">VS</font></td>
					</tr>
				
				</table>
				
				
				<table height="275px"  align="center" >
					<thead >
				<tr >
					<th style="font-family: 'Jeju Gothic', serif;"><b>반대 팀 목록</b></th>
					<c:choose>
                        	<c:when test="${my_group_num == 2}">
													<c:choose>
														<c:when test="${!empty sessionScope.userid}">
															<th align="center"><button class="btn btn-default"
																	onclick="team_cancel()">취소</button></th>
														</c:when>
														<c:otherwise>

															<th align="center"><button class="btn btn-default"
																	onclick="agree_team()">참가</button></th>
														</c:otherwise>
													</c:choose>
												</c:when>
                        	<c:otherwise>
                        		<th align="center"><button class="btn btn-default" onclick="disagree_team()">참가</button></th>
                        	</c:otherwise>
                        </c:choose>
				</tr>
				</thead>
				<div id="disagree_team_mem" >
				
				<tbody>
					<tr>
					<td colspan="2">
						<ol >
				
				
						<c:forEach items="${real_disagree_member}" var="x">
								
				 				<li style="font-family: 'Jeju Gothic', serif;"> ${x.name}&nbsp;(${x.id})&nbsp;&nbsp;<span>
				 				 <c:choose>
									<c:when test="${!empty sessionScope.userid}">
										<button class="btn btn-default" onclick="cheer_up('${x.id}')">
											<i class="glyphicon glyphicon-thumbs-up">&nbsp;${x.opinion_num}</i>
											</button></span> 
									</c:when> 
								<c:otherwise>
								</c:otherwise> 
								</c:choose>
								</li>
						</c:forEach>
						</ol>
					</td>
				</tr>
				
				</tbody>
				</div>
				
				</table>
				
				</div>
				<div id="real_right">
					<table class="table">
					<thead align="right">
						<tr align="right">
						<th align="left" colspan="2" style="font-family: 'Jeju Gothic', serif; font-size: x-large;" ><b>반대측 참여자 ${disagree_team_count} 명</b></th>
						
						</tr>
					</thead>
				
				<tbody>
	
				<c:forEach items="${rt_opinion}" var="x">
				<c:if test="${!empty x.d_opinion }">
				<c:if test="${x.group_num == '2'}">
				
					<tr>
						<td width="25%" style="font-family: 'Jeju Gothic', serif;"><b>${x.school}학교 ${x.id}:</b></td>
						
						<td width="75%" style="font-family: 'Nanum Gothic', serif;">${x.d_opinion}</td>
					</tr>
				</c:if>	
				</c:if>		
				</c:forEach>
				
				</tbody>	
				<tr>
					<td></td>
				
				</tr>
				
				

				
				</table>
				
				
				</div>
				
			
			
			<table width="100%" height="100px">
			<tr>
				<td>
				<c:if test="${!empty sessionScope.userid}">
				<c:if test="${my_group_num==1}">
				<form onsubmit="return insert()" id="fr2" action="insert_op.do">
				<table id="left_tab">
				<tr>
					<td>
						<textarea rows="5" cols="70" class="form-control col-sm-5" name="d_opinion"></textarea>
					</td>
				
				</tr>
				<tr>
					<td><input type="submit" value="의견달기" class="btn btn-default" style="float:right;"></td>
				</tr>
				</table>
				</form>
				</c:if>
				</c:if>
				</td>
				
					<td>
					<c:if test="${!empty sessionScope.userid}">
					<c:if test="${my_group_num == 2}">
					<form onsubmit="return insert()" id="fr2" action="insert_op.do">
					<table id="left_tab" align="right">
				<tr>
					<td>
						<textarea rows="5" cols="70" class="form-control col-sm-5" name ="d_opinion" ></textarea>
					</td>
				
				</tr>
				<tr>
					<td><input type="submit" value="의견달기" class="btn btn-default" style="float:right;"></td>
				</tr>
				</table>
				</form>
				</c:if>
				</c:if>
				</td>
			</tr>
			
			<tr>
					<td>
					
					<table style="clear: right;" width="100%">
					<tr>
					<td>
						<div class="table" >
  							 <div style="width: ${score}%"  id="no1" align="center">${score}%</div>
 							 <div style="width: ${dis_score}%" id="no2" align="center">${dis_score}%</div>
						</div>
					</td>
					</tr>
					</table>
					
					</td>
			</tr>
			
			</table>
							

					<table>
								<tr>
									<td>
										<div id="reply">


											<table >
												<tbody>

													<c:forEach items="${rt_opinion}" var="x">
													<c:if test="${!empty x.d_opinion }">
													<c:if test="${x.group_num == '3'}">
													<fmt:parseDate var="regDate" value="${x.opinion_date}" pattern="yyyy-MM-dd HH:mm:ss" />

															<!-- 두값을 비교하기위해 time format(millisecond)의 숫자형으로 변환 -->

													<fmt:parseNumber value="${toDay.time}" integerOnly="true" var="nowTime" scope="request" />
													<fmt:parseNumber value="${regDate.time}" integerOnly="true" var="replyTime" scope="request" />
													<fmt:parseNumber value="${(nowTime-replyTime)/(1000*60)}" integerOnly="true" var="result" scope="request" />
														<tr>
															<td width="10%" style="padding: 10px;">
																<h4 class="media-heading" style="font-family: 'Jeju Gothic', serif;"><b>${x.id}</b></h4>
															</td>
															<td ><span class="label label-info">
															<c:if test="${result < 60 }"> ${result}분 전 </c:if> 
																								
															<c:if test="${result >= 60 and result < 60*24}">
															<fmt:parseNumber value="${result/60}" integerOnly="true" var="result" scope="request" />
															${result}시간 전
															</c:if>

 															<c:if test="${result >= 60*24 and result < 60*24*31}">
															<fmt:parseNumber value="${result/(60*24)}" integerOnly="true" var="result" scope="request" />
															${result}일 전
															</c:if>
															
															<c:if test="${ result >= 60*24*31 and result < 60*24*31*12}">
															${result}달 전
															</c:if>
															<c:if test="${ result >= 60*24*31*12}">
															${result}년 전
															</c:if>
															</span>
															</td>
														</tr>
														<tr style="padding: 10px;">

															<td width="1200px" style="border-bottom: 1px solid #E1E0E0; padding: 10px; font-family: 'Nanum Gothic', serif;" colspan="2">${x.d_opinion}</td>
															
														</tr>
														</c:if>
														</c:if>
													</c:forEach>
												</tbody>
											</table>

										</div>
									</td>
								</tr>
							</table>






							<div>
							<c:if test="${!empty sessionScope.userid}">
							<c:if test="${my_group_num == 3 or empty my_group_num}">
								<form action="insert_op.do" method="get" role="form" class="contactForm" onsubmit="return insert()" name="fr2">
									<input type="hidden" name="end" value="${pageEnd}"> 
									<input type="hidden" name="start" value="${pageStart}"> 
									<input type="hidden" name="pageNum" value="${pageNum }"> <input type="hidden" name="ad_board_num" value="${ad_board_num}">
									<input type="hidden" name="board_group_num" value="${board_group_num}">
									<input type="hidden" name="flag" value="0">
									
									<div class="form-group">
										<textarea class="form-control" name="d_opinion" rows="5"
											data-rule="required" data-msg="Please write something for us"
											placeholder="Message"></textarea>
										<div class="validation"></div>
									</div>

									<div class="text-center">
										<button type="submit" class="btn btn-theme">댓글 달기</button>
									</div>
									
								</form>
							</c:if>
							</c:if>
							
							
							<c:if test="${empty sessionScope.userid}">
							
							<table align="center">
							<tr>
								<td>
								 로그인 후에 댓글을 작성 할 수 있습니다.
								</td>
							</tr>	
							</table>
							
							</c:if> 
							
							
							
							</div>
							<div class="text-center">
								<ul class="pagination pagination-large">
									<c:if test="${pageNum <= 10}">
										<li class="disabled"><a href="#">Prev</a></li>
									</c:if>
									<c:if test="${pageNum > 10}">
										<li><a
											href="/unibate/reply_view.do?pageNum=${pageNum-10}&ad_board_num=${ad_board_num}&board_group_num=${board_group_num}">Prev</a></li>
									</c:if>
									<c:if test="${pageBlock*10<pageCount}">
										<c:forEach var="i" begin="${pageStart}" step="1"
											end="${pageEnd}">
											<li><a
												href="/unibate/reply_view.do?pageNum=${i}&ad_board_num=${ad_board_num}&board_group_num=${board_group_num}">${i}</a></li>
										</c:forEach>
									</c:if>
									<c:if test="${pageBlock*10>=pageCount}">
										<c:forEach var="i" begin="${pageStart}" step="1"
											end="${pageCount}">
											<li><a
												href="/unibate/reply_view.do?pageNum=${i}&ad_board_num=${ad_board_num}&board_group_num=${board_group_num}">${i}</a></li>
										</c:forEach>
									</c:if>
									<c:if test="${pageCount <= 10 }">
										<li class="disabled"><a href="#">Next</a></li>
									</c:if>
									<c:if test="${pageCount >= pageNum+10 and pageCount > 10}">
										<li><a
											href="/unibate/reply_view.do?pageNum=${pageNum+10}&ad_board_num=${ad_board_num}&board_group_num=${board_group_num}">Next</a></li>
									</c:if>
									<c:if test="${pageCount < pageNum+10 and pageCount > 10}">
										<li><a
											href="/unibate/reply_view.do?pageNum=${pageCount}&ad_board_num=${ad_board_num}&board_group_num=${board_group_num}">Next</a></li>
									</c:if>
								</ul>
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