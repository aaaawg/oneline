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
	String sql = "select * from oneline";
	PreparedStatement pstmt = null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	con = DriverManager.getConnection(url, user, passwd); 
	
	pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery(); 

	while(rs.next()) {
		int no = rs.getInt(1); 
		String memo = rs.getString("memo"); 
		String wdate = rs.getString(3);
		
		out.println("일련번호" + no + ": " + memo + "(" + wdate + ")<br>");
	}	
	rs.close();
	pstmt.close();
	con.close();
	out.println("DB조회 성공"); 
%>
	<br><input type="button" value="작성" onclick="location.href='memo01.html'">
	<form action="memo_delete.jsp">
		<input type="text" name="delete" placeholder="일련번호 입력">
		<input type="submit" value="삭제">
	</form>
</body>
</html>