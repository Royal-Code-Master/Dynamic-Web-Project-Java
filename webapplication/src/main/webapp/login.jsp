<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*" %>

<%

if(request.getMethod().equals("POST")){

String login_email = request.getParameter("login_mail");
String login_password = request.getParameter("login_pwd");

	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp","root","password");
		Statement stmt = con.createStatement();
		
		PreparedStatement ps = con.prepareStatement("SELECT Email, Passwords FROM register WHERE Email = ?;");
		ps.setString(1, login_email);
		
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()){
			String storedEmail = rs.getString("Email");
			String storedPasswords = rs.getString("Passwords");
			
			// macth checking.
			
			if(storedEmail.equals(login_email) && storedPasswords.equals(login_password)){
				session.setAttribute("loggedIn", true);
				session.setAttribute("username", login_email);
				

					response.sendRedirect("questions.jsp");
			}
			else
				response.sendRedirect("questions.jsp");
		}
		
	}catch(Exception e){
		out.print(e.getCause());
	}
}
else{
	response.sendRedirect("error_page.jsp");
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>