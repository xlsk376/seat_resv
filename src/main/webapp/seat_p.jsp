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

String sql = "insert into tbl_resv_202108 values (?,?,?,?)";

PreparedStatement pstmt = conn.prepareStatement(sql);

pstmt.setString(1, request.getParameter("resvno"));
pstmt.setString(2, request.getParameter("empno"));
pstmt.setString(3, request.getParameter("resvdate"));
pstmt.setString(4, request.getParameter("seatno"));


pstmt.executeUpdate();

pstmt.close();
conn.close();

response.sendRedirect("index.jsp");
%>