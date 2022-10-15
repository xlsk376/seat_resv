<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.title{
	text-align : center;
}
.table{
	margin : auto;
}
.section button{
	margin : auto;
	display:block;
}
</style>

</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
	<jsp:include page="include/nav.jsp"></jsp:include>
	<div class="section">
		<h3 class="title">좌석예매 정보가 존재하지 않습니다.</h3>
		<br>
		<button onclick="location.href='seat_list.jsp'">돌아가기</button>
	</div>
	<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>
