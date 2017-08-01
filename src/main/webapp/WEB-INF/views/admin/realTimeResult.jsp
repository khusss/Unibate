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
 <c:if test="${sessionScope.userid ne 'administer' || empty sessionScope.userid}">
    <script type="text/javascript">
    	alert('관리자 계정이 아니면 이용 불가능 합니다.');
    	location.href='main.do';
    </script>
    </c:if>
<script type="text/javascript">
	alert("이미 최신 업데이트가 되어 있습니다.");
	history.back();
</script>




</body>
</html>