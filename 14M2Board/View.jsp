<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
</head>
<body>
   <h2>글 상세보기</h2>
   <table style="width:90%" border="1">
         <colgroup>
            <col width="15%"/><col width="35%" /> <col width="15%" /><col width="*" />
         </colgroup>
      <tr>
            <td>번호</td><td>${dto.idx}</td>
         <td>작성자</td><td>${dto.name}</td>
         
      </tr>
      <tr>
            <td>작성일</td><td>${dto.postdate}</td>
            <td>조회수</td><td>${dto.visitcount}</td>
      </tr>
      <tr>
      <td>제목</td><td colspan="3">${dto.title}</td>
      
      </tr>
      <tr>
      <td>내용</td><td colspan="3">${dto.content}</td>
      
      </tr>
      <tr>
         <td>첨부파일</td>
         <td>
            <c:if test="${not empty dto.ofile}">
            ${dto.ofile}
            <a href="../m2board/download.do?ofile=${dao.ofile}&nfile=${dto.nfile}&idx=${dto.idx}&nfile={dto.nfile}">[다운로드]</a>
            <button type="button" id="downbtn">다운로드</button>
            </c:if>
         </td>
         <td>다운로드수</td>
         <td id="dcount">${dto.downcount}</td>
      </tr>
       <tr>
      <td colspan="4" align="center">
         <button type="button" onclick="location.href='../m2board/pass.do?mode=edit&idx=${param.idx}';">
            수정하기
         </button>
         <button type="button" onclick="location.href='../m2board/delete.do?mode=edit&idx=${param.idx}';">
            삭제하기
         </button>
         <button type="button" onclick="location.href='../m2board/list.do';">
         	목록바로가기
         </button>
         </td>
         </tr>
   </table>
</body>
</html>