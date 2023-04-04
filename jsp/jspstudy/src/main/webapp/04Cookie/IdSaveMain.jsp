<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.ManageCookie" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 값 저장하기</title>
</head>
<body>
	<form action="IdSaveProcess.jsp" method="post">
		<fieldset>
			<legend>로그인 페이지</legend>
			<label>아이디</label>
			<input type="text" name="user id" value="<%=loginId %>"/>
		</fieldset>
	</form>
</body>
</html>