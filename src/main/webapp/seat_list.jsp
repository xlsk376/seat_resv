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
</style>
<script type="text/javascript">
	function checkVal(){
		if(!document.data.empno.value){
			alert("사원번호가 입력되지 않았습니다");
			document.data.empno.focus();
			return false;
		}else{
			document.getElementById("data").submit();
		}
	}
</script>
</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
	<jsp:include page="include/nav.jsp"></jsp:include>
	<div class="section">
		<h3 class="title">좌석예약조회</h3>
		<form id="data" name="data" method="post" action="seat_list_p.jsp" onsubmit="return false">
			<table class="table" border="1">
				<tr>
					<th>사원번호를 입력하시오.</th>
					<td>	
						<input type="text" name="empno">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button onclick="checkVal()">좌석예약조회</button>
						<button onclick="location.href='index.jsp'">홈으로</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>