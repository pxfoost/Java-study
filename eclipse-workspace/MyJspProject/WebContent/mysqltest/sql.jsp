<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//com.mysql.cj.jdbc.Driver
		//jdbc:mysql://localhost:3306/数据库名
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("加载驱动成功");
		String url = "jdbc:mysql://localhost:3306/mydbs?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false";
		//String url = "jdbc:mysql://localhost:3306/mydbs";
		String user = "root";
		String password = "123456";
		Connection conn = DriverManager.getConnection(url, user, password);
		Statement statement = conn.createStatement();
		String sql = "select * from departments";
		ResultSet set = statement.executeQuery(sql);
		while(set.next()){
			out.write(set.getString("dept_no")+"\t");
			out.write(set.getString("dept_name")+"<br/>");
		}
		
		set.close();
		statement.close();
		conn.close();
		
	%>
</body>
</html>