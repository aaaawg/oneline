<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String url = "jdbc:mysql://localhost/world?characterEncoding=UTF-8&serverTimezone=UTC"; 
	String user = "root"; 
	String passwd = "a025763"; 
	Connection con = null;
	String sql = "delete from oneline where no=?";
	PreparedStatement pstmt = null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(url, user, passwd); 
	int delete = Integer.parseInt(request.getParameter("delete"));
	pstmt = con.prepareStatement(sql);
	
	pstmt.setInt(1,delete);
	pstmt.executeUpdate();

	pstmt.close();
	con.close();
	response.sendRedirect("memo_list.jsp");
%>
</body>
</html>