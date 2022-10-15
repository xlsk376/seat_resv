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

String sql = "select e.empno, e.empname, e.deptcode, count(r.empno) from tbl_emp_202108 e, tbl_resv_202108 r ";
	sql += " where e.empno=r.empno group by e.empno, e.empname, e.deptcode order by e.deptcode asc";

PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
ArrayList<String[]> viewList = new ArrayList<String[]>();

while(rs.next()){
	String[] view = new String[4];
	view[0] = rs.getString(1);
	view[1] = rs.getString(2);
	String dept = rs.getString(3);
	if(dept.equals("10")){
		dept = "영업팀";
	}else if(dept.equals("20")){
		dept = "총무팀";
	}else if(dept.equals("30")){
		dept = "구매팀";
	}
	view[2] = dept;
	view[3] = rs.getString(4);
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
</style>
</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
	<jsp:include page="include/nav.jsp"></jsp:include>
	<div class="section">
		<h3 class="title">부서별근무일수집계</h3>
		<table class="table" border="1">
			<tr>
				<th>사원번호</th>
				<th>이름</th>
				<th>부서명</th>
				<th>근무일수</th>
			</tr>
			<%
				for(int i = 0; i < viewList.size(); i++) {
			%>
			<tr>
				<td align=center><%=viewList.get(i)[0] %></td>
				<td align=center><%=viewList.get(i)[1] %></td>
				<td align=center><%=viewList.get(i)[2] %></td>
				<td align=center><%=viewList.get(i)[3] %></td>
			</tr>
			<% } %>
		</table>
	</div>
	<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>