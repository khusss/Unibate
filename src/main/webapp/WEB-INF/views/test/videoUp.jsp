<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>유튜브 비디오 업로드</h3>
<form action="videoView.do">
<table>
	<tr>
		<td colspan="2">Url</td>
	</tr>
	<tr>
		<td> <input type="text" class="form-control" placeholder="URL을 넣어주세요." name="geturl"></td>
		<td>
		 	<button type="submit" class="btn btn-primary" >업로드
			</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>