<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="css/jcarousel.css" rel="stylesheet" />
<link href="css/flexslider.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
 
<!-- Theme skin -->
<link href="skins/default.css" rel="stylesheet" />

<script type="text/javascript">
function sc_check(){
	if(fr.sc_name.value  == "") {
	    alert("학교이름을 입력해주세요")
	    fr.sc_name.focus()
	    return false
  }else{
	  return true
  }
}


function sendChildValue(name){
	opener.setChildValue(name);
	window.close();
}

function sendChildValue2(){
	var sc_name = document.getElementById("sc_name2").value;
	opener.setChildValue(sc_name);
	window.close();
}



</script>
</head>
<body>

<form action="sc_search.do" name="fr" onsubmit="return sc_check()">
<table class="table">
	<tr>
		<td>학교</td>
		<td><input type="text" name="sc_name1" id="sc_name"></td>
		<td><input type="submit" value="검색"></td>
	</tr>
	<c:forEach items="${sc_info}" var="x">
	<tr>
	<td colspan="3"><a href="javascript:sendChildValue('${x.sc_name}')">${x.sc_name}</a></td>
	</tr>
	</c:forEach>
	<tr>
		<td>직접입력</td>
		<td><input type="text" name="sc_name2" id="sc_name2"></td>
		<td><input type="button" value="입력" onclick="javascript:sendChildValue2()"></td>
	</tr>

</table>
</form>
</body>
</html>