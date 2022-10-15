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
.table {
	margin : auto;
}
</style>
<script type="text/javascript">
	function checkVal(){
		if(!document.data.resvno.value){
			alert("예약번호를 입력하세요");
			document.data.resvno.focus();
			return false;
		}else if(!document.data.empno.value){
			alert("사원번호를 입력하세요");
			document.data.empno.focus();
			return false;
		}else if(!document.data.resvdate.value){
			alert("근무일자를 입력하세요");
			document.data.resvdate.focus();
			return false;
		}else if(!document.data.seatno.value){
			alert("좌석번호를 입력하세요");
			document.data.seatno.focus();
			return false;
		}else{
			document.getElementById("data").submit();
		}
	}
	
	function re(){
		document.data.resvno.value = "";
		document.data.empno.value = "";
		document.data.resvdate.value = "";
		document.data.seatno.value = "";
		
		document.data.resvno.focus();
	}
</script>
</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
	<jsp:include page="include/nav.jsp"></jsp:include>
	<div class="section">
		<h3 class="title">근무좌석예약</h3>
		<form id="data" name="data" method="post" action="seat_p.jsp" onsubmit="return false">
			<table class="table" border="1">
				<tr>
					<th>예약번호</th>
					<td>
						<input type="text" name="resvno">
						예) 20210001
					</td>
				</tr>
				<tr>
					<th>사원번호</th>
					<td>
						<input type="text" name="empno">
						예) 1001
					</td>
				</tr>
				<tr>
					<th>근무일자</th>
					<td>
						<input type="text" name="resvdate">
						예) 20211231
					</td>
				</tr>
				<tr>
					<th>좌석번호</th>
					<td>
						<input type="text" name="seatno">
						예) S001 ~ S009
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<button onclick="checkVal()">등록</button>
					<button onclick="re()">다시쓰기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>