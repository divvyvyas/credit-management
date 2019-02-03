<%@page import="java.sql.*"%>
<%@page errorPage="errorPage.jsp" %>
<%
	String name=request.getParameter("name");
	String college=request.getParameter("college");
	String email=request.getParameter("email");
	int age=Integer.parseInt(request.getParameter("age"));
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/credit", "root", "123456");
	String msg="Profile Updated Successfully..!!";
	String qr="update user set college=?, email=?, age=? where name=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, college);
	ps.setString(2, email);
	ps.setInt(3, age);
	ps.setString(4, name);
	ps.executeUpdate();
%>