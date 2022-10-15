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

String sql = "select empno from tbl_emp_202108";

PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
ArrayList<String[]> viewList = new ArrayList<String[]>();

while(rs.next()){
	String[] view = new String[1];
	view[0] = rs.getString(1);
	viewList.add(view);
}

pstmt.close();
conn.close();
rs.close();

request.setCharacterEncoding("UTF-8");

String empno = request.getParameter("empno");

boolean check = false;
for(int i = 0; i < viewList.size(); i++){
	if(empno.equals(viewList.get(i)[0])){
		check = true;
		break;
	}
}
if(check == true){
	response.sendRedirect("seat_list_p2.jsp?empno="+empno);
}else{
	response.sendRedirect("seat_list_no.jsp");
}




%>
