<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person" %>
<%
   Person p=(Person)request.getAttribute("personObj");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>In객체읽기</title>
</head>
<body>

<ul>
   <li>Person 이름:${personObj.name}, 나이 : ${personObj.age}</li>
   <li>Person 이름:${personObj.name}, 나이 : ${personObj.age}</li>
   <li>String ${requestScope.stringObj}</li>
   <li>Integer ${integerObj}</li>
</ul>
<h2>파람 매개변수</h2>

<ul>
   <li>${param.back+param['leeback']}</li>
   <li>${param.back}+${param["leeback"]}</li>
</ul>

<br><br>

<ul>
<li><%=p.getName() %>, <%=p.getAge()%></li>
</ul>

   

</body>
</html>