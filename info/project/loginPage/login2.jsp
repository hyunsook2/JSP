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
  background-color: #f2f2f2;
  height: 100%;
  width: 200px;
  position: fixed;
  top: 0;
  left: 0;
  overflow-x: hidden;
  padding-top: 20px;
  border-right: 3px solid black; /* 우측 바 추가 */
  border-left: 3px solid black; /* 좌측 바 추가 */
}
.sidebar ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}
.sidebar ul li a {
  display: flex;
  align-items: center;
  color: #000;
  padding: 8px 16px;
  text-decoration: none;
}
.sidebar ul li a img {
  width: 24px;
  height: 24px;
  margin-right: 8px;
}
.sidebar ul li a:hover {
  background-color: #555;
  color: white;
}
.sidebar-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 8px 16px;
  background-color: #f2f2f2;
  text-align: center;
}
.sidebar-header img {
	display: block;
	width: 200px;
	height: 60px;
  	margin: 0 auto;
  	margin-right: 8px;
}
.sidebar-header h1 {
  font-size: 20px;
  margin: 0;
}
/* 사이드바 2 스타일링 */
.sidebar2 {
  background-color: #f2f2f2;
  height: 100%;
  width: 200px;
  position: fixed;
  top: 0;
  right: 0;
  overflow-x: hidden;
  padding-top: 20px;
  border-left: 3px solid black; /* 좌측 바 추가 */
}
.sidebar2 ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}
.sidebar2 ul li a {
  display: block;
  color: #000;
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
</style>
</head>
<body>
	<div class="sidebar-wrapper">
		<div class="sidebar">
			<div class="sidebar-header">
				<img src="img/logo2.png" alt="로고 이미지">
			</div>
			<ul>
				<li>
					<a href="#" onclick="handleSidebar1Click(0)">
						<img src="img/user.png" alt="메뉴 1">
						<span>프로필</span>
					</a>
				</li>
				<li>
					<a href="#" onclick="handleSidebar1Click(1)">
						<img src="img/Attendance.png" alt="메뉴 2">
						<span>근태기록</span>
					</a>
				</li>
				<li>
					<a href="#" onclick="handleSidebar1Click(2)">
						<img src="img/Approval.png" alt="메뉴 3">
						<span>전자결재</span>
					</a>
				</li>
				<li>
					<a href="#">
							<img src="img/organization.png" alt="메뉴 4">
							<span>조직도</span>
					</a>
				</li>
			</ul>
		</div>
		
		<!-- 사이드바 2 -->
		<div class="sidebar2">
			<ul>
				<li><a href="#" class="menu-item">Menu 1</a></li>
				<li><a href="#" class="menu-item">Menu 2</a></li>
				<li><a href="#" class="menu-item">Menu 3</a></li>
			</ul>
		</div>
	</div>

	<script>
		function handleSidebar1Click(index) {
			// query string에 index 값을 추가하여 사이드바2로 전달
			window.location.href = "sidebar2.html?index=" + index;
		}
		// query string에서 index 값을 추출하여 해당하는 메뉴를 활성화
		const queryParams = new URLSearchParams(window.location.search);
		const index = queryParams.get("index");
		if (index !== null) {
			const menuItem = document.querySelectorAll(".sidebar2 .menu-item")[index];
			menuItem.classList.add("active");
		}
	</script>
  
</body>
</html>