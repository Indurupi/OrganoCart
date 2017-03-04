<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta charset="utf-8">
<title>ContactUs-OrganoCart</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="resources/css/bootstrap-theme.css">
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">


<script src="resources/js/bootstrap.js"></script>
<script src="resources/js/bootstrap.min.js"></script>

<style>
.input-group {
	margin: 20px 0px 20px;
	width: 75%;
	border-radius: 10px;
}

input[type=text]:focus,textarea:FOCUS {
	border: 2px solid #9ccc65;
	border-radius: 5px;
}

#submitbtn, #resetbtn {
	width: 36.5%;
	margin-right: 4px;
	background: linear-gradient(to bottom, #aed581 30%, #9ccc65 50%);
	color: #ffffff;
}

#submitbtn:HOVER, #resetbtn:HOVER {
	background: linear-gradient(to bottom, #9ccc65 30%, #8bc34a 50%);
	color: #ffffff;
}

#leftdiv {
	border-right: 2px solid #9ccc65;
}

#rightdiv {
	border-left: 2px solid #9ccc65;
}

#gmap_canvas img {
	max-width: none !important;
	background: none !important;
}
textarea {
    resize: none;
}
</style>
<jsp:include page="header.jsp" />
<body style="background-color: #dcedc8">
	<c:if test="${success!=null}">
		<div class="alert alert-success fade-in" role="alert" margin="10px">
			<strong>${success}</strong>
		</div>
	</c:if>
	<c:if test="${fail!=null}">
		<div class="alert alert-danger fade-in" role="alert" margin="10px">
			<strong>${fail} <a href="mailto:">customercare@Organocart.com</a></strong>
		</div>
	</c:if>

	<div id="mainBody" class="container">
		<form action="sendEmail" method="post">

			<div id="leftdiv" class="col-md-6 animated fadeInLeft delay-05s">
				<h3>
					<b>Drop us your Opinions and Queries</b>
				</h3>
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon1">
						<div class="glyphicon glyphicon-user"></div>
					</span> <input type="text" class="form-control" placeholder="Username"
						id="userName" name="username" aria-describedby="basic-addon1" required="true">
				</div>

				<div class="input-group">
					<span class="input-group-addon" id="basic-addon1">
						<div class="glyphicon glyphicon-phone"></div>
					</span> <input type="text" class="form-control" placeholder="Phone Number"
						id="phoneNumber" name="phonenumber"
						aria-describedby="basic-addon1" required="true">
				</div>

				<div class="input-group">
					<span class="input-group-addon" id="basic-addon1">
						<div class="glyphicon glyphicon-inbox"></div>
					</span> <input type="text" class="form-control" placeholder="Email"
						id="emailId" name="emailid" aria-describedby="basic-addon1" required="true">
				</div>

				<div class="input-group">
					<span class="input-group-addon" id="basic-addon1">
						<div class="glyphicon glyphicon-pencil"></div>
					</span>
					<textarea type="text" rows="7" cols="48"
						placeholder="Your message here..." id="feedBack" name="feedback" required="true"></textarea>
				</div>

				<button id="submitbtn" class="btn" type="submit">Drop In</button>
				<button id="resetbtn" class="btn" type="Reset">Cancel</button>
			</div>
		</form>
		<div id="rightDiv" class="col-md-6" align="center">
			<h3 class="animated fadeInDown delay-05s">
				<b>Get in Touch</b>
			</h3>

			<address class="animated fadeInDown delay-05s">
				12/34 , qwertyuiop st ,<br> asdfghjkl road ,<br> zxcvbnm -
				123456<br> Phone: +91 9000000000 <br> <a href="mailto:#">customercare@Organocart.com</a>
			</address>

			<iframe class="animated fadeInUp delay-10s" width="500" height="300" frameborder="0" scrolling="no"
				marginheight="0"
				src="https://maps.google.com/maps?q=NIIT Limited, Gandipuram, Coimbatore, Tamil Nadu, India, &t=&z=14&ie=UTF8&iwloc=&output=embed"
				marginwidth="0">
				<a class="addmaps" href="http://www.map-embed.com" id="get-map-data"
					mce_href="http://maps.google.com/maps/api/js?sensor=false">map-embed.com</a>
			</iframe>
		</div>
	</div>

</body>

<jsp:include page="footer.jsp" />

<script>
	var submitButton = document.getElementbyId('submitbtn');
	submitButton.onclick = validateform();
	function validateform() {
		var txt = document.getElementbyId('Username').value;
		if (txt == "") {
			document.getElementbyId('Username').value.style.borderColor = "#f44336";
			//alert("Button is working");

			return;
		}
	}
</script>

</html>