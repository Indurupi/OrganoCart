<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product details-OrganoCart</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/angular.js"></script>

<style type="text/css">
.product-title {
	font-size: 20px;
}

.product-desc {
	font-size: 14px;
}

.product-price {
	font-size: 22px;
}

.product-stock {
	color: #74DF00;
	font-size: 20px;
	margin-top: 10px;
}

.product-info {
	margin-top: 50px;
}

#productdetailscontainer {
	margin-top: 50px;
}

#viewproductsbutton, #cartbutton {
	background: linear-gradient(to bottom, #aed581 50%, #9ccc65 50%);
	color: #ffffff;
}

#viewproductsbutton:HOVER, #cartbutton:HOVER {
	background: linear-gradient(to bottom, #9ccc65 50%, #8bc34a 50%);
	color: #ffffff;
}

#productdetailscontainer {
	display: inline-block;
	background-color: #ffffff;
	border-radius: 5px;
	box-shadow: 0 0 20px #9ccc65;
	padding: 20px;
	margin: 20px 30px;
	vertical-align: middle;
	min-height: 400px;
}

#prodimage {
	height: 400px;
	width: 350px;
}

#rightdiv {
	vertical-align: middle !important;
	margin-top: 35px;
}

#loginproductsbutton {
	color: #ffffff;
	text-decoration: none;
	margin-right: 10px;
	background: linear-gradient(to bottom, #aed581 50%, #9ccc65 50%);
}

#loginproductsbutton:HOVER {
	background: linear-gradient(to bottom, #9ccc65 50%, #8bc34a 50%);
}
</style>
<script>
	var productdetails = ${pro};
	angular.module('organocartpackage', []).controller(
			'ProductDetailsController', function($scope) {
				$scope.pdo = productdetails;
			});
</script>
</head>
<jsp:include page="header.jsp" />
<body style="background-color: #dcedc8;">
	<div class="container animated fadeIn delay-05s"
		id="productdetailscontainer" ng-app="organocartpackage"
		ng-controller="ProductDetailsController">
		<div class="row">
			<div id="leftdiv" class="product col-sm-4 service-image-left">
				<img id="prodimage" class="img-rounded"
					src="resources/Pimage/{{pdo.ProductId}}.jpg">
			</div>
			<div id="rightdiv" class="col-sm-8">
				<div class="product-title">{{pdo.ProductName}}</div>
				<div class="product-desc">{{pdo.ProductDescription}}</div>
				<hr>
				<div class="product-price">Rs.{{pdo.ProductPrice}}</div>
				<div class="product-stock">In Stock</div>
				<hr>
				<div class="btn-group cart">
					<c:if test="${sessionScope.UserLoggedIn !=null}">
						<a href="addtocart?getProductId={{pdo.ProductId}}" class="btn"
							id="cartbutton" style="color: #ffffff; margin-right: 10px;">
							<span class="glyphicon glyphicon-shopping-cart"></span> Add to
							cart
						</a>
						<a href="buyproductpage" class="btn" id="viewproductsbutton"
							style="color: #ffffff;"> <span
							class="glyphicon glyphicon-menu-hamburger"></span> View More
							Products
						</a>
					</c:if>
					<c:if test="${sessionScope.UserLoggedIn == null}">
						<a href="perlogcheck?getProductId={{pdo.ProductId}}"
							class="btn" id="loginproductsbutton"
							style="color: #ffffff; margin-right: 10px;"><span
							class="glyphicon glyphicon-shopping-cart"></span>&nbsp; Add to
							Cart</a>
						<a href="buyproductpage" class="btn" id="viewproductsbutton"
							> <span
							class="glyphicon glyphicon-menu-hamburger"></span> View More
							Products
						</a>
					</c:if>
				</div>
			</div>
		</div>
		<!-- row end -->
	</div>
	<!-- container end -->
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>