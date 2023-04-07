<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Application 영역 속성 값</title>
</head>
<body>
	<h2>application 속성</h2>
<%
    Map<String, Person> maps = (Map<String, Person>) application.getAttribute("maps");
    if (maps != null) {
        out.println("<h2>Map Data:</h2>");
        for (Map.Entry<String, Person> entry : maps.entrySet()) {
            out.println("<p>이름 : " + entry.getKey() + " 나이 : " + entry.getValue().getAge() + "</p>");
        }
    } else {
        out.println("<p>Map 데이터가 없습니다.</p>");
    }

%>
</body>
</html>