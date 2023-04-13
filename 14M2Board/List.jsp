<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>m2 자료 게시판</title>
<style>a{text-decoration: none;}</style>
</head>
<body>
   <h2>목록 보기</h2>
   <form method="get">
      <table border="1" style="width: 90%;">
         <tr>
            <td align="center">
            <select name="searchType">
            <%if(request.getParameter("searchType")!=null&&request.getParameter("searchType").equals("title")){
               out.print("<option value='title' selected>제목</option>");
               out.print("<option value='content'>내용</option>");
            }
            else if(request.getParameter("searchType")!=null&&request.getParameter("searchType").equals("content")){
               out.print("<option value='title'>제목</option>");
               out.print("<option value='content' selected>내용</option>");
            }else{
               out.print("<option value='title'>제목</option>");
               out.print("<option value='content'>내용</option>");
            }
            %>
            </select> 
            <input type="search" name="searchStr" value="${param.searchStr}" />
            <input type="submit" value="검색" />
            </td>
         </tr>
      </table>
   </form>
   
   <jsp:useBean id="param" class="java.lang.String" />
<c:set var="searchType" value="${param.searchType}" />
<c:set var="searchStr" value="${param.searchStr}" />

<form method="get">
    <table border="1" style="width: 90%;">
        <tr>
            <td align="center">
                <select name="searchType">
                    <c:if test="${searchType == 'title'}">
                        <option value="title" selected>제목</option>
                        <option value="content">내용</option>
                    </c:if>
                    <c:if test="${searchType == 'content'}">
                        <option value="title">제목</option>
                        <option value="content" selected>내용</option>
                    </c:if>
                    <c:if test="${empty searchType}">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </c:if>
                </select>
                <input type="search" name="searchStr" value="${searchStr}" />
                <input type="submit" value="검색" />
            </td>
        </tr>
    </table>
</form>
   
   
   
   <table border="1" width="90%">
      <tr>
         <th>번호</th>
         <th>제목</th>
         <th>작성자</th>
         <th>조회수</th>
         <th>작성일</th>
         <th>첨부파일</th>
      </tr>
      <c:choose>
         <c:when test="${empty boardList}">
            <tr>
               <td colspan="6" align="center">등록된 게시물이 없습니다</td>
            </tr>
         </c:when>
         <c:otherwise>
               <c:forEach items="${boardList}" var="list" varStatus="stat">
                  <tr align="center">
                     <td>${map.totalCount-((map.pageNum-1)*map.pageSize)-stat.index}</td>
                     <td align="center">
                        <a href="../m2board/view.do?idx=${list.idx}">${list.title}</a>
                     </td>
                     <td>${list.name}</td>
                     <td>${list.visitcount}</td>
                     <td>${list.postdate}</td>
                     <td>
                        <c:if test="${not empty list.ofile}">
                           <a href="../m2board/download.do?ofile=${list.ofile}
							&nfile=${list.nfile}&idx=${list.idx}">[${list.ofile}]</a>
                        </c:if>
                     </td>
                  </tr>
               </c:forEach>
         </c:otherwise>
      </c:choose>
      
   </table>
   
<!--       하단 메뉴 페이징 글쓰기 -->
   <table border="1" width="90%">
      <tr align="center">
         <td>
            ${map.pagingStr}
         </td>
         <td width="100">
           <button type="button" onclick="location.href='../m2board/write.do';">글쓰기</button>
         </td>
      </tr>
   
   </table>








</body>
</html>