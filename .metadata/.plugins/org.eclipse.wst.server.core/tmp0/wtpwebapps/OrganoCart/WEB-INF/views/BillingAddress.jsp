<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shipping Address-Organocart</title>
<script src="resources/js/angular.js"></script>

<script type="text/javascript">
	var addresses = ${addressesjson};
	angular.module('organocartpackage', []).controller('AddressController',
			function($scope) {
				$scope.addressitems = addresses;
			})
</script>
<style>
.input-group {
	margin: 20px 0px 20px;
	width: 75%;
	border-radius: 10px;
}

input[type=text]:focus {
	border: 2px solid #9ccc65;
	border-radius: 10px;
}

#leftdiv {
	border-right: 2px solid #9ccc65;
}

#holder {
	display: inline-block;
	background-color: #ffffff;
	border-radius: 5px;
	box-shadow: 2px 2px 20px #dcedc8;
	margin: 10px;
}

#top-block {
	padding-top: 4px;
}

#bottom-block {
	padding: 15px 20px;
}

#submitbtn, #resetbtn {
	width: 34.5%;
	margin-right: 4px;
	background-color: #9ccc65;
	color: #ffffff;
	background: linear-gradient(to bottom, #9ccc65 50%, #8bc34a 50%);	
}

#paybutton {
	width: 100%;
	margin-right: 4px;
	color: #ffffff;
	background: linear-gradient(to bottom, #9ccc65 50%, #8bc34a 50%);	
}

#submitbtn:hover, #resetbtn:hover, #paybutton:HOVER {
	background: linear-gradient(to bottom, #aed581 50%, #9ccc65 50%);
	color: #ffffff;
}

#editlink, #removelink {
	color: #9ccc65;
	font-size: 15px;
}
</style>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body ng-app="organocartpackage" ng-controller="AddressController">

	<div id="mainBody" class="container">
		<form:form action="addnewaddress" method="post"
			modelAttribute="billingAddressObj">
			<div id="leftdiv" class="col-sm-6">
				<h3>
					<b>ShippingAddress</b>
				</h3>
				<div class="input-group">
					<form:input type="hidden" class="form-control" id="" name=""
						aria-describedby="basic-addon1" path="AddressId"></form:input>
				</div>
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon1"> <i
						class="fa fa-user-o" aria-hidden="true"></i>
					</span>
					<form:input type="text" class="form-control"
						placeholder="User Name" id="" name=""
						aria-describedby="basic-addon1" path="UserName"></form:input>
				</div>

				<div class="input-group">
					<span class="input-group-addon" id="basic-addon1"> <i
						class="fa fa-address-card" aria-hidden="true"></i>
					</span>
					<form:input type="text" class="form-control"
						placeholder="AddresssLine 1" id="" name=""
						aria-describedby="basic-addon1" path="AddressLine1"></form:input>
				</div>

				<div class="input-group">
					<span class="input-group-addon" id="basic-addon1"> <i
						class="fa fa-address-card" aria-hidden="true"></i>

					</span>
					<form:input type="text" class="form-control"
						placeholder="AddresssLine 2" id="" name=""
						aria-describedby="basic-addon1" path="AddressLine2"></form:input>
				</div>

				<div class="input-group">
					<span class="input-group-addon" id="basic-addon1">
						<div class="glyphicon glyphicon-inbox"></div>
					</span>
					<form:input type="text" class="form-control" placeholder="city"
						id="" name="" aria-describedby="basic-addon1" path="City"></form:input>
				</div>
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon1">
						<div class="glyphicon glyphicon-inbox"></div>
					</span>
					<form:input type="text" class="form-control" placeholder="state"
						id="" name="" aria-describedby="basic-addon1" path="State"></form:input>
				</div>
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon1"> <i
						class="fa fa-globe" aria-hidden="true"></i>
					</span>
					<form:input type="text" class="form-control" placeholder="country"
						id="" name="" aria-describedby="basic-addon1" path="Country"></form:input>
				</div>
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon1">
						<div class="glyphicon glyphicon-inbox"></div>
					</span>
					<form:input type="text" class="form-control" placeholder="pincode"
						id="" name="" aria-describedby="basic-addon1" path="Pincode"></form:input>
				</div>
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon1">
						<div class="glyphicon glyphicon-phone"></div>
					</span>
					<form:input type="text" class="form-control"
						placeholder="Phone number" id="" name=""
						aria-describedby="basic-addon1" path="PhoneNumber"></form:input>
				</div>
				<c:if test="${newobj}">
					<button name="addnew" id="submitbtn" class="btn" type="submit">
						<i class="fa fa-credit-card" aria-hidden="true"></i> Add Address
					</button>
					<button id="resetbtn" class="btn" type="Reset">
						<i class="fa fa-times" aria-hidden="true"></i> Reset Address
					</button>
				</c:if>
				<c:if test="${!newobj}">
					<button name="edit" id="submitbtn" class="btn" type="submit">
						<i class="fa fa-credit-card" aria-hidden="true"></i> Edit Address
					</button>
					<button id="resetbtn" class="btn" type="Reset">
						<i class="fa fa-times" aria-hidden="true"></i> Reset Address
					</button>
				</c:if>
			</div>
		</form:form>

		<div id="rightDiv" class="holder col-sm-6">

			<div id="holder" ng-repeat="a in addressitems">
				<div id="top-block">
					<a href="editaddress?getaddressid={{a.AddressId}}" class="btn"
						id="editlink"><span class="glyphicon glyphicon-pencil"></span></a>
					<a href="removeaddress?getaddressid={{a.AddressId}}"
						class="btn pull-right" id="removelink"><span
						class="glyphicon glyphicon-remove"></span></a>
				</div>
				<div id="bottom-block">
					<div class="lead">{{a.UserName}}</div>
					<div>{{a.AddressLine1}}</div>
					<div>{{a.AddressLine2}}</div>
					<div>{{a.City}}</div>
					<div>{{a.State}}</div>
					<div>{{a.Country}}</div>
					<div>{{a.Pincode}}</div>
					<div><i class="fa fa-mobile" aria-hidden="true"></i>
					  {{a.PhoneNumber}}</div>
					<div>
						<a href="generatinginvoice?getaddressid={{a.AddressId}}" id="paybutton" class="btn" type="submit"> 
						<i class="fa fa-truck" aria-hidden="true"></i> Deliver Here
						</a>
					</div>
				</div>

			</div>

		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>