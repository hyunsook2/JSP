<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import="utils.ManageCookie" %>
 <%
    String loginId = ManageCookie.readCookie(request, "loginId");
    String cookieCheck= "";
    if(!loginId.equals(""))
    cookieCheck="checked";
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form action="IdSaveProcess.jsp" method="post">
        <fieldset>
                <legend>�α��� ������</legend>
                <label>���̵�</label>
                <input type="text" name="user_id" value="<%=loginId %>"/>
                <input type="checkbox" name="save_check" value="Y" <%=cookieCheck%>/>
                ���̵� �����ϱ�
                <br>
                <label>�н�����</label>
                <input type="text" name="user_pw">
                <br>
                <input type="submit" value="�α����ϱ�">
        </fieldset>

</form>
   
</body>
</html>