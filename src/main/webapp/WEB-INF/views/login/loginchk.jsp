<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result == -1 }">
<script type="text/javascript">
	alert("아이디가 틀렸습니다 \n확인해 주세요");
	history.back();
</script>
</c:if>
<c:if test="${result == 0 }">
<script type="text/javascript">
	alert("비밀번호가 틀렸습니다 \n확인해 주세요");
	history.back();
</script>
</c:if>
<c:if test="${result == 1 }">
<c:set var="userid" value="${id}" scope="session" />

	<c:if test="${sessionScope.userid eq 'administer' }">
	<script type="text/javascript">
	location.href='admain.do';
	</script>
	</c:if>

	<c:if test="${sessionScope.userid ne 'administer' }">
	<script type="text/javascript">
	location.href='main.do';
	</script>
	</c:if>
</c:if>


</body>
</html>