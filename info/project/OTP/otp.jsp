<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OTP</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style type="text/css">
	.container{ /*합칠때 문제생기면 삭제*/
		width : 100%;
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100vh; /*화면크기에 상관없이 가운데 배치 문제있을시 삭제*/
	}
	form{
		display : block;
		width : 500px;
		border: 2px solid black;
	}
</style>
</head>
<body>
	<div class="container">
	   <form action="<%=request.getContextPath() %>/JOTP/OTPTestResult.ok" method="get">
		  <h2 style="margin:10px;">출근</h2>
	      <table border="1" width="100%" class="login">
	         <tr >
	            <td style="font-weight:bold;">키 인증 번호 : </td>
	            <td>
	               <input type="text" class="form-control" name="encodedKey" value="${encodedKey}" readonly="readonly"/>
	            </td> 
	         </tr>
	         <tr >
	            <td style="font-weight:bold;">바코드 주소 : </td>
	            <td>
	               <input type="text" class="form-control" value="${qrUrl}" readonly="readonly"/>
	            </td> 
	         </tr>
	         <tr >
	            <td style="font-weight:bold;">코드 입력창 : </td>
	            <td>
	               <input type="text" class="form-control" id="code" name="code" placeholder="코드를 입력해주세요."/>
	            </td> 
	         </tr>
	      </table>
	      <input type="submit" class="btn btn-lg btn-dark" value="출근" style="margin:10px;">
	   </form> 
   </div>
</body>
<script type="text/javascript">
$(function(){
	var errorMsg = "${errorMsg}";
		if(errorMsg != ""){
		alert(errorMsg); 
	}
});
 
function frmCheck() {
	if ($("#code").val() == "") {
		alert("코드를 입력해주세요.");
		$("#code").focus();
		return false;
	}
}
</script>
</html>