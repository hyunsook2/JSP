<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="utils.AlertFunc"%>
<%
   if(session.getAttribute("UserId")==null){
     	AlertFunc.alertLocation("로그인 하쇼","../07LoginOutPrac/LoginForm.jsp" ,out);
     	return;
   }else if(session.getAttribute("UserId")==("SIBAL")){
	   AlertFunc.alertLocation("똥싸러가라","../07LoginOutPrac/LoginForm.jsp" ,out);
	   return;
   }
%>