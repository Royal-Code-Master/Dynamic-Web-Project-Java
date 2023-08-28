<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


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
        

    <link rel="shortcut icon" href="https://img.favpng.com/17/20/24/computer-icons-favicon-scalable-vector-graphics-web-design-png-favpng-FxX7qA70tWMUi0GGnu9h35mX8.jpg">
    
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<meta charset="ISO-8859-1">
<title>Quiz Web App</title>
</head>

<style>

.navbar{
	border-radius:50px !important;
}


label{
	margin-top:1rem;
	margin-bottom:1rem;
	font-weight:700;
	font-size:16px;
}
</style>

<body>
	
	<script>
    
    // aos js animation
        AOS.init({
            duration:2000,
        });
    </script>

	<script>
		function checkAll(){
			const option1 = document.getElementById("q1").value;
			const option2 = document.getElementById("q2").value;
			const option3 = document.getElementById("q3").value;
			const option4 = document.getElementById("q4").value;
			const option5 = document.getElementById("q5").value;
			const option6 = document.getElementById("q6").value;
			const option7 = document.getElementById("q7").value;
			const option8 = document.getElementById("q8").value;
			const option9 = document.getElementById("q9").value;
			const option10 = document.getElementById("q10").value;


			if (option1 === null || option2 === null || option3 === null || option4 === null || option5 === null || option6 === null || option7 === null || option8 === null || option9 === null || option10 === null) {
				alert("Please Answer All The Questions !!");
			}
		}
	</script>
    
	<div class="container m-auto mt-5">
			<nav class="navbar navbar-light bg-warning">
  				<div class="container">
    				<a class="navbar-brand text text-center text-dark p-0 mt-1 mb-1">
    					 &nbsp;&nbsp;<i class="fa fa-cube" aria-hidden="true"></i>  <strong>Technical Quiz</strong>
    				</a>
    				<div><a href="logout.jsp" class="btn btn-outline-dark" role="button" style="border-radius:20px; width:120px;"><strong><i class="fa fa-user-circle-o"></i> logout</strong></a></div>
    			</div>
			</nav>
			<br>
			
			<form  name="myform" method="post" action="ResultValidation.jsp" >
				<div class="row p-3">
					<div class="col-sm-6">
						
						<!-- question1 -->
						<label>1. Who invented Java Programming?</label>
						<select id="q1" name="q1" class="form-select" required>
							<option></option>
							<option value="a">Guido van Rossum</option>
							<option value="b"> James Gosling </option>
							<option value="c">Dennis Ritchie</option>
							<option value="d">Bjarne Stroustrup</option>  <!-- b -->
						</select>
						
						<!-- question2 -->
						<label>2. Which component is used to compile, debug and execute the java programs?</label>
						<select id="q2" name="q2" class="form-select" required>
							<option></option>
							<option value="a">JRE</option>
							<option value="b"> JIT </option>
							<option value="c">JDK</option>
							<option value="d">JVM</option>  <!-- c -->
						</select>
						
						<!-- question3 -->
						<label>3. Which one of the following is not a Java feature?</label>
						<select id="q3" name="q3" class="form-select" required>
							<option></option>
							<option value="a">Object-oriented</option>
							<option value="b"> Use of pointers </option>
							<option value="c">Portable</option>
							<option value="d">Dynamic and Extensible</option>  <!-- b -->
						</select>
							
						<!-- question4 -->
						<label>4. Which one of the following is a Java File extension?</label>
						<select id="q4" name="q4" class="form-select" required>
							<option></option>
							<option value="a">.js</option>
							<option value="b">.txt</option>
							<option value="c">.class</option>
							<option value="d">.java</option>  <!-- d -->
						</select>	
						
						<!-- question5 -->
						<label>5. Which of the following is not an OOPS concept in Java?</label>
						<select id="q5" name="q5" class="form-select" required>
							<option></option>
							<option value="a">Polymorphism</option>
							<option value="b">Inheritance</option>
							<option value="c">Compilation</option>
							<option value="d">Encapsulation</option>  <!-- c -->
						</select>
					</div>
					<div class="col-sm-6">
					
						<!-- question6 -->
						<label>6. Which exception is thrown when java is out of memory?</label>
						<select id="q6" name="q6" class="form-select" required>
							<option></option>
							<option value="a">MemoryError</option>
							<option value="b">OutOfMemoryError</option>
							<option value="c">MemoryOutOfBoundsException</option>
							<option value="d">MemoryFullException</option>  <!-- b -->
						</select>
						
						
						<!-- question7 -->
						<label>7. Which of these are selection statements in Java?</label>
						<select id="q7" name="q7" class="form-select" required>
							<option></option>
							<option value="a">break</option>
							<option value="b">continue</option>
							<option value="c">for()</option>
							<option value="d">if()</option>  <!-- d -->
						</select>
						
						
						<!-- question8 -->
						<label>8. Which of the following is a superclass of every class in Java?</label>
						<select id="q8" name="q8" class="form-select" required>
							<option></option>
							<option value="a">ArrayList</option>
							<option value="b">Abstract class</option>
							<option value="c">Object class</option>
							<option value="d">String</option>  <!-- c -->
						</select>
						
						
						<!-- question9 -->
						<label>9. Which of the below is not a Java Profiler?</label>
						<select id="q9" name="q9" class="form-select" required>
							<option></option>
							<option value="a">JProfiler</option>
							<option value="b">Eclipse Profiler</option>
							<option value="c">JVM</option>
							<option value="d"> JConsole</option>  <!-- c -->
						</select>
						
						
						<!-- question10 -->
						<label>10. Which of these packages contains the exception Stack Overflow in Java?</label>
						<select id="q10" name="q10" class="form-select" required>
							<option></option>
							<option value="a">java.io</option>
							<option value="b">java.system</option>
							<option value="c">java.lang</option>
							<option value="d">java.util</option>  <!-- c -->
						</select>
					</div>
				</div>	
				<button type="submit" class="btn btn-warning mt-2" name="submit" onclick="checkAll()"><strong>Submit Quiz</strong></button>
			</form>
	</div>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>