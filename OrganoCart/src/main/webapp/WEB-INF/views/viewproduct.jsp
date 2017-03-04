<html>
<head>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products-OrganoCart</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="resources/js/angular.js"></script>

<style type="text/css">
.panel {
	display: inline-block;
	background-color: #ffffff;
}

.panel:hover {
	cursor: pointer;
	background-color: #dcedc8;
	-webkit-transition: background-color ease-in 0.4s;
	transition: background-color ease-in 0.4s;
}

#addtocartbutton, #viewproductsbutton {
	background-color: #9CCC65;
	color: #ffffff;
	background: linear-gradient(to bottom, #aed581 50%, #9ccc65 50%);
	margin-left: 4px;
}

#addtocartbutton:hover, #viewproductsbutton:hover {
	background-color: #aed581;
	color: #ffffff;
	background: linear-gradient(to bottom, #9ccc65 50%, #8bc34a 50%);
}

img:hover {
	transition: all 0.5s ease;
	transform: scale(1.07);
}

#pricediv {
	text-align: right;
	font-size: 20px;
	font-weight: bold;
	font-family: sans-serif;
}

#producta {
	color: #000000;
	text-decoration: none;
}

</style>
<script>
	var productlist = ${productlist};
	angular.module('organocartpackage', []).controller('ProductController',
			function($scope) {
				$scope.productangularobject = productlist;
			});
</script>

</head>
<jsp:include page="header.jsp" />
<body ng-app="organocartpackage" ng-controller="ProductController">
	<br />
	<div class="panel panel-success animated fadeInUp delay-04s" style="margin-left: 50px;"
		ng-repeat="p in productangularobject">
		<div class="panel-body">
			<div>
				<a href="viewproduct?getId={{p.ProductId}}" id="producta">
					<div>
						<img class="img-rounded img-fluid"
							src="resources/Pimage/{{p.ProductId}}.jpg" height="200px"
							width="200px">


						<div class="lead" style="margin-top: 5px">{{p.ProductName}}</div>
						<div class="">{{p.ProductDescription}}</div>
						<hr>
					</div>
				</a>
			</div>
			<div id="pricediv">
				<c:if test="${sessionScope.UserLoggedIn !=null}">
					<a href="addtocart?getProductId={{p.ProductId}}"
						data-toggle="tooltip" title="Add To Cart">
						<button style="margin: 5px;" class="btn pull-left"
							id="addtocartbutton">
							<span class="glyphicon glyphicon-shopping-cart"></span>
						</button>
					</a>
					<a href="viewproduct?getId={{p.ProductId}}" data-toggle="tooltip"
						data-placement="bottom" title="View Product Details">
						<button style="margin: 5px;" class="btn pull-left"
							id="viewproductsbutton">
							<span class="glyphicon glyphicon-menu-hamburger"></span>
						</button>
					</a>
				</c:if>
				<c:if test="${sessionScope.UserLoggedIn == null}">
					<a href="viewproduct?getId={{p.ProductId}}" class="btn pull-right" id="viewproductsbutton"><span
						class="glyphicon glyphicon-hand-up"></span>&nbsp; View Product</a>
				</c:if>
				<strong style="margin-top: 5px;margin-right: 5px">Rs.{{p.ProductPrice}}</strong>
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>