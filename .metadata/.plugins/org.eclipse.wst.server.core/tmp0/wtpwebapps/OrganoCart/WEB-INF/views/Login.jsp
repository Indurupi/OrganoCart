<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login-Organocart</title>
<style type="text/css">
.wrapper {
	margin-top: 20px;
	margin-bottom: 20px;
	border-radius: 10px;
}

.form-signin {
	max-width: 420px;
	padding: 30px 38px 66px;
	margin: 0 auto;
	background-color: #eee;
	border: 3px dotted rgba(0, 0, 0, 0.1);
}

.form-signin-heading {
	text-align: center;
	margin-bottom: 30px;
}

.form-control {
	position: relative;
	font-size: 16px;
	height: auto;
	padding: 10px;
}

input[type="text"] {
	margin-bottom: 0px;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
}

input[type="password"] {
	margin-bottom: 20px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

#loginbutton {
	background: linear-gradient(to bottom, #aed581 50%, #9ccc65 50%);
	color: #ffffff;
	width: 100%;
	margin-bottom: 10px;
}

#loginbutton:HOVER {
	background: linear-gradient(to bottom, #9ccc65 50%, #8bc34a 50%);	
	color: #ffffff;
}

#useridcontrol:FOCUS, #passwordcontrol:FOCUS {
	border: 2.5px solid #9ccc65;
}
#smileyimage
{
	height:100px;
	width:100px;
	margin-top: 10px;
}
.colorgraph {
	height: 7px;
	border-top: 0;
	background: #c4e17f;
	border-radius: 5px;
	background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%,
		#f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%,
		#db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%,
		#669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
	background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%,
		#f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%,
		#db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%,
		#669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
	background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca
		25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe
		50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1
		87.5%, #62c2e4 87.5%, #62c2e4);
	background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca
		25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe
		50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1
		87.5%, #62c2e4 87.5%, #62c2e4);
}
</style>
</head>
<jsp:include page="header.jsp" />
<body style="background-color: #dcedc8">
	<div class="container">
		<div class="wrapper animated fadeInUp delay-05s">
			<form action="perform_login" method="post" class="form-signin">
				<h3 class="form-signin-heading" style="color: #9ccc65">Hooray !! Welcome Back !!<img id="smileyimage" alt="smiley" src="resources/img/happiness.png"></h3>
				<hr class="colorgraph">
				<br> <input type="text" class="form-control" id="useridcontrol"
					placeholder="Email Id" id="usename" name="usename" required="true"> <input
					type="password" class="form-control" id="passwordcontrol"
					placeholder="Password" id="userpassword" name="userpassword" required="true">
				
				<button class="btn btn-lg" name="Submit" id="loginbutton"
					value="Login" type="Submit">Login</button>
				
				<a href="Signup" class="btn" id="loginbutton">New Users Sign Up Here </a>
				
			</form>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp" />
</html>