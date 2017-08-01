<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result==-1}">
	<font color="#FF6600"><b>10자 이상 입력해주세요.</b></font>
</c:if>
<c:if test="${result==0}">
	<b>${id}는 사용 가능합니다.</b> 
</c:if>
<c:if test="${result==1}">
	<font color="#FF6600"><b>${id}는 이미 사용중입니다.</b></font>
</c:if>
<c:if test="${result==2}">
	<font color="#FF6600"><b>존재하지 않는 아이디 입니다.</b></font>
</c:if>

</body>
</html>