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
<c:if test="${result}">
	<b>사용 가능한 이메일 입니다.</b>
</c:if>
<c:if test="${!result}">
	<font color="#FF6600"><b>이메일 형식이 올바르지 않습니다.</b></font>
</c:if>
</body>
</html>