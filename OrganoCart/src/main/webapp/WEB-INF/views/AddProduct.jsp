<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Products-OrganoCart</title>
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

.form-control:FOCUS
{
	border: 2px thin #9ccc65;
	border-radius: 5px;
}
.list-group-item {
	overflow: hidden;
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
	var productlist = ${productlist};
	var sl = ${supplierslist};
	var cl = ${categorymodelobject};

	angular.module('organocartpackage', []).controller('ProductController',
			function($scope) {
				$scope.productangularobject = productlist;
				$scope.slo = sl;
				$scope.clo = cl;
			});
</script>

</head>
<jsp:include page="header.jsp" />
<body style="background-color:#dcedc8" ng-app="organocartpackage" ng-controller="ProductController">
	<div class="container-fluid"
		style="width: 90%; margin-top: 10px; margin-bottom: 10px">

		<div class="panel animated fadeInDown delay-05s" id="panel-1">
			<div class="panel-heading">
				<span class="lead">Managing Products</span>
			</div>
			<!-- end panel heading -->
			<div class="panel-body">
				<div class="formcontainer ">

					<form:form commandName="newProductObject" action="addproduct"
						enctype="multipart/form-data">
						<c:if test="${check}">
							<div class="form-group">

								<form:input class="form-control" Placeholder="Product Id"
									type="text" path="ProductId" required="true"></form:input>
							</div>
						</c:if>
						<c:if test="${!check}">
							<div class="form-group">
								<form:input class="form-control" Placeholder="Product Id"
									type="text" path="ProductId" readonly="true" required="true"></form:input>
							</div>
						</c:if>
						<div class="form-group">
							<form:input class="form-control" Placeholder="Product Name"
								type="text" path="ProductName" required="true"></form:input>
						</div>
						<div class="form-group">
							<form:input type="text" class="form-control"
								placeholder="ProductDescription" path="ProductDescription" required="true"></form:input>
						</div>
						<div class="form-group">
							<form:input type="number" class="form-control"
								Placeholder="Product price" path="ProductPrice" required="true"></form:input>
						</div>
						<div class="form-group">
							<form:input type="number" class="form-control"
								placeholder="Stock" path="ProductStock" required="true"></form:input>
						</div>
						<div class="form-group">
							<form:select path="CategoryId" cssClass="form-control">
								<form:option ng-repeat="c in clo" value="{{c.CategoryId}}">
									{{c.CategoryName}}
								</form:option>
							</form:select>
						</div>
						<div class="form-group">
							<form:select path="SupplierId" cssClass="form-control">
								<form:option ng-repeat="s in slo" value="{{s.SupplierId}}">
									{{s.SupplierName}}
								</form:option>
							</form:select>
						</div>
						<div class="form-group">
							<form:input type="file" name="fileToUpload" id="fileToUpload"
								path="PImage" required="true"></form:input>
						</div>
						<c:if test="${check}">
							<form:button id="editbuttons" type="submit" name="Add" class="btn">Add
							Details</form:button>
							<form:button id="removebuttons" type="reset" class="btn">Reset
							Details</form:button>
						</c:if>
						<c:if test="${!check}">
							<form:button id="editbuttons" type="submit" name="Edit" class="btn">Edit
							Details</form:button>
							<form:button id="removebuttons" type="reset" class="btn">Reset
							Details</form:button>
						</c:if>
					</form:form>
				</div>
				<!-- panel body end -->
			</div>
		</div>
		<!-- panel end -->
		<div class="panel animated fadeInUp delay-05s" id="panel-2">
			<div class="panel-heading">
				<span class="lead">Products List</span>
			</div>
			<!-- end panel2 heading -->
			<div class="panel-body">
				<ul class="list-group">
					<li class="list-group-item" height="45px"
						ng-repeat="product in productangularobject">
						<table style="width: 100%">
							<tr>
								<td><img style="width:125px ;height:150px" src="resources/Pimage/{{product.ProductId}}.jpg" />
								</td>
								<td>
									<ul>
										<li><span><b>Product Id: </b></span>{{product.ProductId}}</li>
										<li><span><b>Product Name: </b></span>{{product.ProductName}}</li>
										<li><span><b>Product Price: </b></span>{{product.ProductPrice}}</li>
										<li><span><b>Product Stock: </b></span>{{product.ProductStock}}</li>
										<li><span><b>Supplier Id: </b></span>{{product.SupplierId}}</li>
										<li><span><b>Category Id: </b></span>{{product.CategoryId}}</li>
									</ul>
								</td>
								<td><a href="editingproduct?getpid={{product.ProductId}}"><button id="editbuttons"
											type="submit" class="btn">Edit</button></a> <a
									href="removingproduct/{{product.ProductId}}"><button id="removebuttons"
											type="button" class="btn">Remove</button></a></td>
							</tr>
						</table>
					</li>
				</ul>
			</div>
			<!-- panel2 body end -->
		</div>
		<!-- panel2 end -->
	</div>
	<!-- container end -->
</body>
<jsp:include page="footer.jsp" />
</html>
