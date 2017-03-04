<link href="resources/img/logo.ico" rel="shortcut icon" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OrganoCart</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="resources/css/font-awesome.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/animate.css">

<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/angular.js"></script>

<style type="text/css">
li:hover {
	background-color: #dcedc8;
	-webkit-transition: background-color ease-in 0.4s;
	transition: background-color ease-in 0.4s;
}

#companyname:HOVER {
	background-color: transparent;
	cursor: default;
}

.close:hover, .close:focus {
	color: #f44336;
	cursor: pointer;
}

.badge {
	background-color: #9ccc65;
	font-size: 11px;
	border-radius: 2px;
}

#searchtext:focus {
	border: 2px solid #9ccc65;
}

#companyname {
	color: #9ccc65;
	font-size: 0.8cm;
	margin-left: 190px;
	font-family: Apple Chancery, san-serif;
	font-weight: bold;
	padding: 5px;
	user-select: none;
	-webkit-touch-callout: none; /* iOS Safari */
	-webkit-user-select: none; /* Safari */
	-khtml-user-select: none; /* Konqueror HTML */
	-moz-user-select: none; /* Firefox */
	-ms-user-select: none;
}
</style>

<nav id="navigationbar" class="navbar navbar-default"
	style="margin-bottom: 0px;">
	<div class="" style="margin: 0px; width: 100%">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="glyphicon glyphicon-menu-hamburger"></span>
			</button>
		</div>
		<div class="navbar-collapse collapse"
			id="bs-example-navbar-collapse-1">
			<c:choose>
				<c:when test="${sessionScope.AdminLoggedIn != null}">
					<ul class="nav navbar-nav">
						<li><a href="index">Home</a></li>
						<li><a href="Contactus">Contact Us</a></li>
						<li><a href="buyproductpage">Products</a></li>
						<li><a class="dropdown dropdown-toggle"
							data-toggle="dropdown" style="cursor: pointer;">Manage <span
								class="caret"></span>
						</a>
							<ul class="dropdown-menu animated fadeInDown delay-05s">
								<li><a href="showingcategorypage"><i
										class="fa fa-angle-double-right" aria-hidden="true"></i>&nbsp;
										Category </a></li>
								<li><a href="showsupplier"><i
										class="fa fa-angle-double-right" aria-hidden="true"></i>&nbsp;
										Suppliers</a></li>
								<li><a href="showproductpage"><i
										class="fa fa-angle-double-right" aria-hidden="true"></i>&nbsp;
										Products</a></li>
							</ul></li>
						<li id="companyname"><img width="35px" height="33px"
							alt="Logo" src="resources/img/leaveslogo.png"> <em>OrganoCart</em></li>

						<!-- <li><a href="showproductpage">Manage Products</a></li>
						<li><a href="showsupplier">Manage Supplier</a></li>
						<li><a href="showingcategorypage">Manage Category</a></li> -->


					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li style="margin-top: 15px;">Hi !
							${sessionScope.AdminLoggedIn}</li>
						<li><a href="logout">Logout</a></li>
					</ul>

				</c:when>
				<c:when test="${sessionScope.UserLoggedIn !=null}">
					<ul class="nav navbar-nav">
						<li><a href="index">Home</a></li>
						<li><a href="Aboutus">About Us</a></li>
						<li><a href="Contactus">Contact Us</a></li>
						<li><a href="buyproductpage">Products</a></li>
						<li id="companyname"><img width="35px" height="33px"
							alt="Logo" src="resources/img/leaveslogo.png"> <em>OrganoCart</em></li>

					</ul>
					<ul class="nav navbar-nav navbar-right">

						<li><a class="dropdown dropdown-toggle"
							data-toggle="dropdown" style="cursor: pointer;">Hi !
								${sessionScope.UserLoggedIn} <span class="caret"></span>
						</a>
							<ul class="dropdown-menu animated fadeInDown delay-05s">

								<!-- <li><a href=""><span
										class="btn glyphicon glyphicon-user"></span> Profile</a></li>
									 <li><a href=""><span
										class="btn glyphicon glyphicon-th-list"></span> Placed Orders</a></li>-->

								<li><a href="billingaddresspage"><span
										class="btn glyphicon glyphicon-envelope"></span> Address</a></li>
								<li><a href="showcartpage"> &ensp;&ensp;<span
										class="glyphicon glyphicon-shopping-cart"></span>&ensp;&ensp;
										My Cart&ensp;&ensp;<span class="badge">${sessionScope.grandquantity}</span>&ensp;
								</a></li>
								<li class="divider"></li>
								<li><a href="logout"><span
										class="btn glyphicon glyphicon-log-out"></span> Logout</a></li>
							</ul></li>
						<li><a href="showcartpage"
							style="color: #9ccc65; font-size: 19px"> <span
								class="glyphicon glyphicon-shopping-cart"></span> <span
								class="badge">${sessionScope.grandquantity}</span>
						</a></li>
						<li><a href="logout"><span
								class="glyphicon glyphicon-log-out"></span></a></li>
					</ul>

				</c:when>
				<c:otherwise>
					<ul class="nav navbar-nav">
						<li><a href="index">Home</a></li>
						<li><a href="Aboutus">About Us</a></li>
						<li><a href="Contactus">Contact Us</a></li>
						<li><a href="buyproductpage">Products</a></li>
						<li id="companyname"><img width="35px" height="33px"
							alt="Logo" src="resources/img/leaveslogo.png"> <em>OrganoCart</em></li>
					</ul>

					<ul class="nav navbar-nav navbar-right">

						<li><a href="Signup">Signup</a></li>
						<li><a href="pLogin">Login</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>
<!-- /.navbar-collapse -->
