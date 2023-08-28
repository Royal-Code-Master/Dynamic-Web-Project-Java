<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>



<%! 

int marks = 0;
String status, username; 
String full_name;
String user_email;

%>
    
<%

Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
if (loggedIn != null && loggedIn && request.getMethod().equals("POST")) {
   username = (String) session.getAttribute("username");
}
else{
	response.sendRedirect("error_page.jsp");
}


// getting values

String s1 = request.getParameter("q1");
String s2 = request.getParameter("q2");
String s3 = request.getParameter("q3");
String s4 = request.getParameter("q4");
String s5 = request.getParameter("q5");
String s6 = request.getParameter("q6");
String s7 = request.getParameter("q7");
String s8 = request.getParameter("q8");
String s9 = request.getParameter("q9");
String s10 = request.getParameter("q10");

try{

if(s1.equals("b"))
	marks = marks + 10;

if(s2.equals("c"))
	marks = marks + 10;

if(s3.equals("b"))
	marks = marks + 10;

if(s4.equals("d"))
	marks = marks + 10;

if(s5.equals("c"))
	marks = marks + 10;


if(s6.equals("b"))
	marks = marks + 10;

if(s7.equals("d"))
	marks = marks + 10;

if(s8.equals("c"))
	marks = marks + 10;

if(s9.equals("c"))
	marks = marks + 10;

if(s10.equals("c"))
	marks = marks + 10;

if(marks > 50){
	status = "Passed";
}else
	status = "failed";

}
catch(Exception e){
	out.print(e.getCause());
}
// table data


try{
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp","root","password");
	PreparedStatement ps = con.prepareStatement("SELECT * FROM register WHERE Email = ? ;");
	ps.setString(1,username);
	
	ResultSet rs = ps.executeQuery();
	// getting data
	while(rs.next()){
		full_name = rs.getString("FullName");
		user_email = rs.getString("Email");
		
		// insert into result table
		PreparedStatement psu = con.prepareStatement("INSERT INTO quiz_result VALUES (?,?,?,?) ;");
		psu.setString(1,full_name);
		psu.setString(2, user_email);
		psu.setInt(3, marks);
		psu.setString(4, status);
		
		if(psu.execute()){
			out.print("<script>Quiz Completed Successfully.</script>");
		}
		else{
			out.print("<script>Error in Server</script>");
		}
		
		psu.close();
		
	}
	
	
	rs.close();
    ps.close();
    con.close();
	
}catch(Exception e){
	out.print(e.getMessage());
}


%>    
    
<!DOCTYPE html>
<html>
<head>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<style>

.container{
	margin-top:5rem;
	max-width :900px;
	height : auto;
	box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
}


</style>

<body>
	<center>
		<div class="container p-3 mt-5">
			<h2 class="text text-dark mt-4">Quiz Participation Certificate</h2>
			<i class="fa fa-certificate fa-5x text-warning mt-3 mb-2 p-1"></i>	
			<p>This is Certified to </p>
			<h3 class="p-2 mt-1 mb-1"><%= full_name %></h3>
			<p>Participated and Passed </p>
			<h5>Technical Quiz</h5>
			<p><strong>Email Address</strong> <%= user_email %></p>
			<p><strong>Quiz Status</strong> <%= status %>
			<hr class="mt-5">
			<p>Design & Developed By <strong>Team - 7 </strong></p>
		</div>
	</center>
	
	
</body>
</html>