<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>


<%

Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
if (loggedIn != null && loggedIn) {
    String username = (String) session.getAttribute("username");
}
else{
	response.sendRedirect("error_page.jsp");
}

%>
    
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
       
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="shortcut icon" href="https://img.favpng.com/17/20/24/computer-icons-favicon-scalable-vector-graphics-web-design-png-favpng-FxX7qA70tWMUi0GGnu9h35mX8.jpg">
    
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  	
<meta charset="ISO-8859-1">
<title>Dash Board</title>
</head>
<body>
	<header id="head1">
		<nav class="navbar navbar-expand-lg navbar-light sticky-top bg-warning">
			<div class="container p-1">
				<a class="navbar-brand text text-dark">
					<strong>
						.Dashboard
					</strong>
				</a>
  				<div>
  				 
  				 <a href="admin_logout.jsp" class="btn btn-outline-dark" role="button" style="border-radius:20px; width:120px;">
  			 		<strong><i class="fa fa-user-circle-o"></i> logout</strong>
  				 </a>
  				 
  				 
  				</div>

			</div>
			
		</nav>
	</header>
	
					
						<%

							try{
								Class.forName("com.mysql.cj.jdbc.Driver");
								Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp","root","password");
								Statement stmt = con.createStatement();
								ResultSet rs = stmt.executeQuery("SELECT * FROM quiz_result;");
						%>
						<main class="mt-5">		
						<div class="table-responsive container">
						<h5 class="text text-dark p-4 mt-1 mb-3" style="text-align:center;">Student Quiz Results</h5>
								<table class="table table-hover table-bordered bg-light">
   									 <thead class="bg-success text-light text-center mb-1 mt-1">
       									 	<th>Full Name</th>
								        	<th>Email Address</th>
       										<th>Marks</th>
        									<th>Status</th>
        									
   									</thead>
    							<%
    								while (rs.next()) {
    							%>
    							<tbody class="text text-dark text-center">
    							<tr>
        							<td><%= rs.getString(1) %></td>
        							<td><%= rs.getString(2) %></td>
       								<td><%= rs.getString(3) %></td>
        							<td><%= rs.getString(4) %></td>
        							  
       						
       							
   								 </tr>
   								 </tbody>
    							<%
    						}
    					rs.close();
    					stmt.close();
    					con.close();
					} catch (Exception e) {
   
    				out.print("An error occurred: " + e.getMessage());
					}
					%>
				</table>
				</div>
			</main>
</body>
</html>    