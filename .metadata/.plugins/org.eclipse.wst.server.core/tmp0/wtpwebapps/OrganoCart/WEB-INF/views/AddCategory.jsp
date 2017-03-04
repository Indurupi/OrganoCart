<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Category-OrganoCart</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style type="text/css">

.form-control:FOCUS
{
	border: 2px solid #9ccc65;
	border-radius: 5px;
}

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
	color: #ffffff;
	background: linear-gradient(to bottom, #aed581 50%, #9ccc65 50%);
}
#editbuttons:HOVER {
	color: #ffffff;
	background: linear-gradient(to bottom, #9ccc65 50%, #8bc34a 50%);
}
</style>
<script src="resources/js/angular.js"></script>

<script>
	var cat = ${categorymodelobject};

	angular.module('organocartpackage', []).controller('CategoryController',
			function($scope) {
				$scope.Catagory = cat;
			});
</script>
</head>
<jsp:include page="header.jsp" />
<body style="background-color:#dcedc8">
	<div class="container-fluid"
		style="width: 80%; margin-top: 10px; margin-bottom: 10px">
		<div class="panel animated fadeInDown delay-05s" id="panel-1">
			<div class="panel-heading">
				<span class="lead">Managing Category</span>
			</div>
			<!-- end panel heading -->
			<div class="panel-body">
				<div class="formcontainer">
					<c:if test="${check}">
						<form:form name="addCategoryObject"
							modelAttribute="addCategoryObject1" action="addingcategory"
							method="post">
							<div class="form-group">
								<form:input class="form-control"
									Placeholder="Category Id" type="text" path="CategoryId" required="true"></form:input>
							</div>
							<div class="form-group">
								<form:input class="form-control"
									Placeholder="Category Name" type="text" path="CategoryName" required="true"></form:input>
							</div>
							<div class="form-group">
								<form:input type="text" class="form-control"
									placeholder="Category Description" path="Description" required="true"></form:input>
							</div>
							<form:button id="editbuttons" type="submit" name="Addcategory"
								class="btn">Add Category</form:button>
							<form:button id="removebuttons" type="reset" class="btn">Reset
              Details</form:button>

						</form:form>
					</c:if>
					
					<c:if test="${!check}">
						<form:form name="addCategoryObject"
							modelAttribute="addCategoryObject1" action="addingcategory"
							method="post">
							<div class="form-group">
								<form:input id="name" class="form-control"
									Placeholder="Category Id" type="text" path="CategoryId" readonly="true"></form:input>
							</div>
							<div class="form-group">
								<form:input id="name" class="form-control"
									Placeholder="Category Name" type="text" path="CategoryName"></form:input>
							</div>
							<div class="form-group">
								<form:input type="text" class="form-control"
									placeholder="Category Description" path="Description"></form:input>
							</div>
							<form:button id="editbuttons" type="submit" name="EditCategory"
								class="btn">Edit Category</form:button>
							<form:button id="removebuttons" type="reset" class="btn">Reset
              Details</form:button>
						</form:form>
					</c:if>
				</div>
			</div>
			<!-- panel1 body end -->
		</div>
		<!-- panel1 end -->
		<div class="panel animated fadeInUp delay-05s" id="panel-2">
			<div class="panel-heading">
				<span class="lead">List Of Categories</span>
			</div>
			<!-- end panel2 heading -->
			<div class="panel-body" ng-app="organocartpackage"
				ng-controller="CategoryController" width="100%">
				<ul class="list-group ">
					<li class="list-group-item" height="45px"
						ng-repeat="Cat in Catagory">
						<div class="pull-left">
							<ul class="list-inline">
								<li><span><b>Category Id: </b></span>{{Cat.CategoryId}}</li>
								<li><span><b>Category Name: </b></span>{{Cat.CategoryName}}</li>
								<li><span><b>Category Description: </b></span>{{Cat.Description}}</li>
							</ul>
						</div>
						<div class="pull-right">
							<a href="editcategorybutton?getcid={{Cat.CategoryId}}"><button id="editbuttons"
									type="submit" class="btn">Edit</button></a> <a
								href="removecategory/{{Cat.CategoryId}}"><button  id="removebuttons"
									type="button" class="btn">Remove</button></a>
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