<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Supplier-OrganoCart</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style type="text/css">

.panel>.panel-heading {
	color: #558b2f;
	background-color: #aed581;
	border-color: #aed581;
}
.panel>.panel-body
{
	background-color: #f1f8e9;
	border-color: #aed581;
}

.list-group-item {
	overflow: hidden;
	margin: 3px;
	border-radius: 3px;
}
#removebuttons
{
	color: #ffffff;
	background-color: #e57373;
}
#removebuttons:HOVER {
	color: #ffffff;
	background-color: #e53935;
}
#editbuttons{
	background: linear-gradient(to bottom, #9ccc65 50%, #8bc34a 50%);	
	color: #ffffff;
}
#editbuttons:HOVER {
	background: linear-gradient(to bottom, #aed581 50%, #9ccc65 50%);
	color: #ffffff;
}
</style>
<script src="resources/js/angular.js"></script>

<script>
	var supplier = ${supplierslist};
	angular.module('organocartpackage', []).controller('SupplierController',
			function($scope) {
				$scope.supplierAngularObject = supplier;

			});
</script>
<title>Organocart</title>
</head>
<div>
	<jsp:include page="header.jsp" />
</div>
<body style="background-color:#dcedc8">
	<div class="container-fluid"
		style="width: 80%; margin-top: 10px; margin-bottom: 10px">
		<div class="panel animated fadeInDown delay-05s" id="panel1">
			<div class="panel-heading">
				<span class="lead">Managing Supplier</span>
			</div>
			<!-- end panel heading -->
			<div class="panel-body">
				<div class="formcontainer ">

					<c:if test="${check}">
						<form:form name="addsupplierform" commandName="newSupplierObject"
							action="addingsupplier" method="post">

							<div class="form-group">
								<form:input id="name" class="form-control"
									Placeholder="Supplier Id" type="text" path="SupplierId" required="true"></form:input>
							</div>
							<div class="form-group">
								<form:input id="name" class="form-control"
									Placeholder="Supplier Name" type="text" path="SupplierName" required="true"></form:input>
							</div>
							<div class="form-group">
								<form:input type="text" class="form-control"
									placeholder="Supplier Phone Number" path="SupplierPhone" required="true"></form:input>
							</div>
							<div class="form-group">
								<form:input type="text" id="name" class="form-control"
									Placeholder="Supplier Address" path="SupplierAddress" required="true"></form:input>
							</div>
							<form:button type="submit" class="btn" id="editbuttons" name="Addingsupplier">Add
							Supplier</form:button>
							<form:button type="button" class="btn" id="removebuttons">Reset
							Details</form:button>
						</form:form>
					</c:if>
					<c:if test="${!check}">
					<form:form name="addsupplierform" commandName="newSupplierObject"
						action="addingsupplier" method="post">

						<div class="form-group">
							<form:input id="name" class="form-control"
								Placeholder="Supplier Id" type="text" path="SupplierId" readonly="true" required="true"></form:input>
						</div>
						<div class="form-group">
							<form:input id="name" class="form-control"
								Placeholder="Supplier Name" type="text" path="SupplierName" required="true"></form:input>
						</div>
						<div class="form-group">
							<form:input type="text" class="form-control"
								placeholder="Supplier Phone Number" path="SupplierPhone" required="true"></form:input>
						</div>
						<div class="form-group">
							<form:input type="text" id="name" class="form-control"
								Placeholder="Supplier Address" path="SupplierAddress" required="true"></form:input>
						</div>
						<form:button id="editbuttons" type="submit" class="btn btn-success " name="EditingSupplier">Edit
							Supplier</form:button>
						<form:button id="removebuttons" type="button" class="btn btn-danger ">Reset
							Details</form:button>
					</form:form>
					</c:if>
				</div>
			</div>
			<!-- panel body end -->
		</div>
		<!-- panel end -->
		<div class="panel animated fadeInUp delay-05s" id="panel-2">
			<div class="panel-heading">
				<span class="lead">List Of Suppliers</span>
			</div>
			<!-- end panel2 heading -->
			<div class="panel-body" ng-app="organocartpackage"
				ng-controller="SupplierController">
				<ul class="list-group">
					<li class="list-group-item" height="45px"
						ng-repeat="sup in supplierAngularObject">
						<div class="pull-left">
							<ul class="list-inline">
								<li><span><b>Supplier Id:</b></span>{{ sup.SupplierId }}</li>
								<li><span><b>Supplier Name:</b></span> {{ sup.SupplierName}}</li>
								<li><span><b>Supplier Phone:</b></span>
									{{sup.SupplierPhone}}</li>
								<li><span><b>Supplier Address:</b></span>
									{{sup.SupplierAddress}}</li>
							</ul>
						</div>
						<div class="pull-right">
							<a href="editingsupplierbutton?getsupplierid={{ sup.SupplierId }}"><button id="editbuttons"
									type="submit" class="btn">Edit</button></a> <a
								href="removingsupplier/{{ sup.SupplierId }}"><button id="removebuttons"
									type="button" class="btn btn-danger ">Remove</button></a>
						</div>
					</li>

				</ul>
			</div>
			<!-- panel2 body end -->
		</div>
		<!-- panel2 end -->
	</div>
	<!-- container end -->
</body>
<div>
	<jsp:include page="footer.jsp" />
</div>
</html>