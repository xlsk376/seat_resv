<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection conn = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "system";
String pw = "1234";

try{
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, id, pw);
	System.out.println("DB 접속");
	
}catch(Exception e){
	e.printStackTrace();
}

request.setCharacterEncoding("UTF-8");

String empno = request.getParameter("empno");

String sql = "select e.empno, e.empname, r.resvdate, s.seatno, s.office, s.callno from tbl_emp_202108 e, tbl_seat_202108 s, tbl_resv_202108 r";
	sql += " where e.empno=r.empno and r.seatno=s.seatno and e.empno="+empno;
	sql += " order by r.resvdate desc";

PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
ArrayList<String[]> viewList = new ArrayList<String[]>();

while(rs.next()){
	String[] view = new String[6];
	view[0] = rs.getString(1);
	view[1] = rs.getString(2);
	view[2] = rs.getString(3);
	view[3] = rs.getString(4);
	view[4] = rs.getString(5);
	view[5] = rs.getString(6);
	viewList.add(view);
}

pstmt.close();
conn.close();
rs.close();
%>
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
	display : block;
}
</style>

</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
	<jsp:include page="include/nav.jsp"></jsp:include>
	<div class="section">
		<h3 class="title">사원번호 :<%=empno %>님의 좌석예약조회</h3>
			<table class="table" border="1">
				<tr>
					<th>사원번호</th>
					<th>이름</th>
					<th>근무일자</th>
					<th>좌석번호</th>
					<th>좌석위치</th>
					<th>내선번호</th>
				</tr>
				<%
					for(int i = 0; i < viewList.size(); i++){
				%>
				<tr>
					<td align="center"><%=viewList.get(i)[0] %></td>
					<td align="center"><%=viewList.get(i)[1] %></td>
					<td align="center"><%=viewList.get(i)[2] %></td>
					<td align="center"><%=viewList.get(i)[3] %></td>
					<td align="center"><%=viewList.get(i)[4] %></td>
					<td align="center"><%=viewList.get(i)[5] %></td>
				</tr>
				<% } %>
			</table>
			<br>
		<button onclick="location.href='seat_list.jsp'">돌아가기</button>
	</div>
	<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>

