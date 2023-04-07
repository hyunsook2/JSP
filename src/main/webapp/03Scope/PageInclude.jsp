<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 영역 include</title>
</head>
<body>
	<h2>Include 영역 속성값</h2>
<%
	int pInt=(Integer)(pageContext.getAttribute("pInteger"));
	String pStr = pageContext.getAttribute("pString").toString();
	Person pObj = (Person)(pageContext.getAttribute("pObject"));
%>
	<ul>
		<li>숫자:<%=pInt %></li>
		<li>문자열:<%=pStr %></li>
		<li>객체:<%=pObj.getName() %>,<%=pObj.getAge() %></li>
	</ul>

</body>
</html>