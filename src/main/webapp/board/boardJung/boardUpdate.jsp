<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>BoardUpdate</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Animate.css -->
	<link rel="stylesheet" href="../../css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="../../css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="../../css/bootstrap.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="../../css/style.css">
	<!-- Board -->
	<link rel="stylesheet" href="../../css/board.css">
	<!-- Modernizr JS -->
	<script src="../../js/modernizr-2.6.2.min.js"></script>

	<!-- 유효성 검사 -->
	<script type="text/javascript" src="../../js/board.js"></script>
</head>
<body>
<div class="fh5co-loader"></div>
<div id="page">
	<%@include file="/header.jsp"%>
	<!-- 게시판 수정 -->
	<div id="fh5co-work">
		<div class="container_board">
			<form action="/board/update" method="post">
				<input type="hidden" name="num" value="${board.num}">
				<table>
					<tr>
						<th>카테고리</th>
						<td>
							<select name="type">
								<option value="Y" ${board.type == 'Y' ? 'selected' : ""}>양도하기</option>
								<option value="B" ${board.type == 'B' ? 'selected' : ""}>분실물</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${sessionScope.id}<input type="hidden" value="${sessionScope.id}" name="id"></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" value="${board.title}" name="title"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea cols="70" rows="15" name="content">${board.content}</textarea>
						</td>
					</tr>
				</table>
				<br><br>
				<input type="submit" value="수정" onclick="return boardCheck()">
				<input type="button" value="목록" onclick="location.href='/board/list?type=${type}'">
			</form>
		</div>
		<br><br>
		<%@include file="/footer.jsp"%>
	</div>
	<!-- jQuery -->
	<script src="../../js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="../../js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="../../js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="../../js/jquery.waypoints.min.js"></script>
	<!-- Main -->
	<script src="../../js/main.js"></script>
</div>
</body>
</html>