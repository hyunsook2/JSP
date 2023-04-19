<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reboot</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>

.sidebar {
  background-color: #4169E1;
  height: 100%;
  width: 65px;
  position: fixed;
  top: 0;
  left: 0px;
  overflow-x: hidden;
  padding-top: 20px;
  border-right: 4px solid white;
}

.sidebar ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}

.sidebar ul li a {
  display: flex;
  align-items: center;
  color: black;
  padding: 5px 5px;
  text-decoration: none;
  flex-direction : column;
  margin: 5px 5px;
  background-color: orange;
  border-radius: 5px;
}

.sidebar ul li a img {
  width: 16px;
  height: 16px;
  margin-right: 3px;
}

.sidebar ul li a:hover {
  background-color: blue;
  color: white;
}

.sidebar-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 8px 16px;
  background-color: #f2f2f2;
  text-align: center;
  border-bottom: 5px solid white;
}


.sidebar-header h1 {
  font-size: 20px;
  margin: 0;
}

/* 사이드바 2 스타일링 */
.sidebar2 {
  background-color: #4169E1;
  height: 100%;
  width: 200px;
  position: fixed;
  top: 95px;
  left:64px;
  overflow-x: hidden;
  padding-top: 20px;
}

.sidebar2 ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}

.sidebar2 ul li a {
  display: block;
  color: white;
  padding: 8px 16px;
  text-decoration: none;
}


.sidebar2 ul li a:hover {
  background-color: #555;
  color: white;
}

.sidebar2 .active {
  background-color: #555;
  color: white;
}
.sidebar2-header {
  height: 100%;
  width: 200px;
  position: fixed;
  top: 0;
  left:64px;
  overflow-x: hidden;
  padding-top: 20px;
  border-bottom: 4px solid white;
 }
 
.sidebar2-header img {
  width: 200px;
  height: 70px;
  margin: 0 auto;
  padding:0;
  margin-right: 8px;
}
.center-header{
  display:block;
  width: 300px;
  height: 60px;
  font-size: 20px;
  margin: 30px 280px;
  text-align: center;
  background-color: #4169E1;
  padding-top: 20px;
  border-radius: 5px;
}
.center-header a:hover {
  color: white;
}
.center-header a{
  color:white;
}


.board {
 background-color: skyblue;
  height: 100%;
  width:84.3%;
  position: fixed;
  top: 95px;
  left: 270px;
  overflow-x: hidden;
  padding-top: 20px;
  border-right: 4px solid white;
}
.box{
  width:100px;
  height:40px;
  background-color:black;
  border-radius: 5px;
  color:white;
  
}
.board button {
  position: fixed;
  width:100px;
  height:40px;
  right:400px;
  bottom:60px;	
  color:white;
  border-radius: 5px;
}
table{
 border-color: skyblue;
}
</style>
</head>
<body>
	<div class="sidebar">
    	<ul>
      		<li>
        		<a href="#">
          			<img src="img/user.png" alt="메뉴 1">
        			<span style="font-size: 9pt;">프로필</span>
        		</a>
      		</li>
      		<li>
        		<a href="#" onclick="handleSidebar1click(1)">
          			<img src="img/Attendance.png" alt="메뉴 2">
          			<span style="font-size: 3pt;">근태기록</span>
        		</a>
      		</li>
      		<li>
        		<a href="#" onclick="handleSidebar1click(2)">
          		<img src="img/Approval.png" alt="메뉴 3">
          		<span style="font-size:3pt;">전자결재</span>
        	</a>
      		</li>
      		<li>
        		<a href="#">
          		<img src="img/organization.png" alt="메뉴 4">
          		<span style="font-size: 9pt;">조직도</span>
        		</a>
      		</li>
    	</ul>
  	</div>
  
  	<!-- 사이드바헤드 이미지 -->
  	<div class="sidebar2-header">
  		<a href="#">
    		<img style="button" src="img/logo2.png" alt="로고 이미지" >
  		</a>
    </div>
  	<!-- 사이드바 2 -->
	<div class="sidebar2">
  		<ul>
  			<br>
    		<li><a href="#" class="menu-item">개인정보 조회 및 수정</a></li>
    		<li><a href="#" class="menu-item">Menu 2</a></li>
    		<li><a href="#" class="menu-item">Menu 3</a></li>
  		</ul>
	</div>
	<!-- 로그인정보 -->
  	<div class="center-header">
  		<h2><a href="#" onclick="handleSidebar1click(4)">로그인정보</a></h2>
  	</div>
  	
  	<!-- 가운데 -->
  	<div class="board">
  	<br>
  	<br>
  	<br>
  	<form>
  		<table border="1" width ="800" height="600"  align = "center" >
    <tr>
		<td><b>사번 : <input type="text" class="box" pattern="[0-9]{6}" maxlength="7"/></b></td>
		<td><b>이름 : <input type="text" /></b></td>
    </tr>
    <tr>
		<td colspan="2"><b>비밀번호 : <input type="password" size=50 maxlength="20"/></b></td>
    </tr>
    <tr>
		<td><b>입사일 : <input type="date" disabled/></b></td>
		<td><b>퇴사일 : <input type="date" disabled /></b></td>
    </tr>
    <tr>
      <td><b>부서명 : <select name="team" disabled>
          <option value="0">업무팀</option>
          <option value="1">인사팀</option>
          <option value="2">시스템팀</option>
                   </select></b></td>
      <td><b>직급 : <select name="grade" disabled>
      <option value="a">사원</option>
          <option value="b">팀장</option>
          <option value="c">사장</option></b></td>
    </tr>
    <tr>
	<td><b>생년월일 : <input type="date" /></b></td>
	<td><b>
	<form action="process.jsp" method="post">
  <label for="phone">연락처:</label>
  <input type="tel" id="phone" name="phone" onkeyup="insertHyphen(this)" maxlength="11" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="예)010-1234-5678" required>
	</form>
	</b>
	</td>
    </tr>
    <tr>
	<td colspan="2"><b>주소 : <input type="text" size=80 maxlength="50" /></b></td>
    </tr>
</table>
  	<button type="submit" onclick="location.href='#'" style="background-color: #4169E1">수정완료</button>
  	</form>
  	</div>
  
	<script>
  function handleSidebar1Click(index) {
    // query string에 index 값을 추가하여 사이드바2로 전달
    window.location.href = "sidebar2.html?index=" + index;
  }
	document.querySelector("a").addEventListener('click',function(event){
		event.preventDefault();
		console.log("!!");
	    window.location.href = "sidebar2.html?index=" + index;
	})
  // query string에서 index 값을 추출하여 해당하는 메뉴를 활성화
  const queryParams = new URLSearchParams(window.location.search);
  const index = queryParams.get("index");
  if (index !== null) {
    const menuItem = document.querySelectorAll(".sidebar2 .menu-item")[index];
    menuItem.classList.add("active");
  }
  
  function insertHyphen(element) {
	  let value = element.value.replace(/-/g, ''); // 기존 하이픈 제거
	  let regex = /^(\d{3})(\d{4})(\d{4})$/; // 정규표현식
	  if (regex.test(value)) {
	    value = value.replace(regex, '$1-$2-$3'); // 하이픈 삽입
	    element.value = value; // 변환된 값으로 업데이트
	  }
	}
</script>
  
</body>
</html>