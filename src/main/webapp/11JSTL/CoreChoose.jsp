<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTLcore choose/when/otherwise</title>

</head>
<body>
<c:set var="num" value="99"/>

<h4>choose</h4>
<c:choose>
	<c:when test="${num mod 2 eq 0}">
		${num}는 짝수입니다.
	</c:when>
	<c:when test="${num mod 2 eq 1}">
		${num}는 홀수입니다.
    </c:when>
</c:choose>

<h4>영어 수학 과학 점수 입력받아서 평균을 구하고 학점 출력</h4>
<form>
	영어: <input type="number" name="eng" min="0" max="100" value="${param.eng}"/><br>
	수학: <input type="number" name="math" min="0" max="100" value="${param.math}"/><br>
	과학: <input type="number" name="sci" min="0" max="100" value="${param.sci}"/><br>
	<input type="submit" value="학점 구하기"/>
</form>
<!-- 90이상 수 80 이상 우 70 이상 미 60이상 양     나머지 가 -->
<!-- 평균점수 : ?? / 학점 : ?? -->
<c:if test="${not(empty param.eng or empty param.math or empty param.sci)}">
   <c:set var="avg1" value="${param.eng}"/>
   <c:set var="avg2" value="${param.math}"/>
   <c:set var="avg3" value="${param.sci}"/>
   <c:set var="AVG" value="${(avg1+avg2+avg3)/3}"/>
		평균 : ${AVG}
		학점 : 
   <c:choose>
      <c:when test="${AVG ge 90}">수</c:when>
      <c:when test="${AVG ge 80}">우</c:when>
      <c:when test="${AVG ge 70}">미</c:when>
      <c:when test="${AVG ge 60}">양</c:when>
      <c:otherwise>가</c:otherwise>
   </c:choose>
</c:if>
</body>
</html>