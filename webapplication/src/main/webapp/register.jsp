<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
<%@page import="java.sql.*" %>

<% 

String full_name = request.getParameter("fullname");
long user_phone = (Long.parseLong(request.getParameter("phone")));
String user_email = request.getParameter("email");
String user_password = request.getParameter("pwd");
String user_security_question = request.getParameter("hint-opt");
String user_security_ans = request.getParameter("hint");
try{	
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp","root","password");
	Statement stmt = con.createStatement();
	
	PreparedStatement ps = con.prepareStatement("INSERT INTO register VALUES (?,?,?,?,?,?);");
	ps.setString(1, full_name);
	ps.setLong(2,user_phone);
	ps.setString(3,user_email);
	ps.setString(4,user_password);
	ps.setString(5,user_security_question);
	ps.setString(6,user_security_ans);
	
	if (ps.executeUpdate() == 1) {
		response.sendRedirect("login.html");
	}
	else {
		System.out.println("<p>Registeration Failed !!!</p>");
		}
}
catch (SQLException e) {
    e.printStackTrace();
}

%>    
    
    
    
    