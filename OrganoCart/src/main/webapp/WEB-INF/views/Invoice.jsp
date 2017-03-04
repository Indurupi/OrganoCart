<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Invoice - Organocart</title>
<style type="text/css">
#emailinvoicebtn, #continuebutton {
	background-color: #9ccc65;
	color: #ffffff;
	background: linear-gradient(to bottom, #aed581 50%, #9ccc65 50%);
}

#emailinvoicebtn:HOVER, #continuebutton:HOVER {
	color: #ffffff;
	background-color: #aed581;
	background: linear-gradient(to bottom, #9ccc65 50%, #8bc34a 50%);
}

#emailbox:FOCUS {
	border: 2px solid #9ccc65;
	border-radius: 5px;
}

#welldiv {
	background-color: #dcedc8;
	padding: 20px;
	display: inline-block;
}

#prodimage {
	width: 100px;
	height: 125px;
}

#jumbotrondiv {
	background-color: #dcedc8;
	width: 80%;
	border-radius:10px;
}

.form-control:FOCUS {
	border: 2px solid #9ccc65;
}
</style>
<script src="resources/js/angular.js"></script>

<script type="text/javascript">
	var cartproductlist = ${itemsincart};
	var addressjson = ${addressobject};
	angular.module('organocartpackage', []).controller('InvoiceController',
			function($scope) {
				$scope.citems = cartproductlist;
				$scope.address = addressjson;
			});
</script>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body ng-app="organocartpackage" ng-controller="InvoiceController">
	<c:if test="${bill}">
		<div class="row" style="min-height: 400px;">
			<div id="welldiv" style="border-radius: 5px;"
				class="col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
				<div class="row">
					<div class="col-xs-4 col-sm-4 col-md-4">
						<address>
							<strong>{{address.UserName}}</strong> <br>
							{{address.AddressLine1}}, <br> {{address.AddressLine2}},<br>
							{{address.City}} - {{address.Pincode}} <br> Phone :
							{{address.PhoneNumber}}
						</address>
					</div>
					<div class="col-xs-4 col-sm-4 col-md-4 text-right">
						<span style="display: block"> <img class="img-rounded"
							src="resources/img/organocartfont.PNG">
						</span>
					</div>
					<div class="col-xs-4 col-sm-4 col-md-4 text-right">
						<p>
							<em>Date:${sessionScope.Date}</em><br> <em>Order ID:
								34522677W</em><br> <em>Invoice Id: 34522677W</em>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="text-center">
						<h1 style="color: #9ccc65">
							<em>Invoice</em>
						</h1>
					</div>

					<table class="table table-striped">
						<thead>
							<tr>
								<th>Product</th>
								<th></th>

								<th>Quantity</th>
								<th class="text-center">Price</th>
								<th class="text-center">Total</th>
							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="c in citems">
								<td><img id="prodimage" alt="product image"
									src="resources/Pimage/{{c.pid}}.jpg" class="img-rounded">
									<h4>
										<em>{{c.pname}}</em>
									</h4></td>
								<td></td>

								<td class="col-md-1" style="text-align: center">{{c.qty}}</td>
								<td class="col-md-1 text-center">Rs.{{c.price}}</td>
								<td class="col-md-1 text-center">Rs.{{c.total}}</td>
							</tr>

							<tr>
								<td></td>
								<td></td>

								<td class="text-right"><h4>
										<strong>Grand</strong>
									</h4></td>
								<td class="text-right">
									<h4>
										<strong>Total:</strong>
									</h4>
								</td>
								<td class="text-center text-danger"><h4>
										<strong>Rs.${sessionScope.grandtotal}</strong>
									</h4></td>
							</tr>
						</tbody>
					</table>
				</div>
				<form action="emailingreceipt">
					<div class="col-sm-8">
						<input type="text" class="form-control" id="emailbox"
							placeholder="send receipt to this email id" name="email"
							required="true">
					</div>
					<div class="col-sm-4">
						<button id="emailinvoicebtn" type="submit" class="btn">
							Email Invoice<span class="glyphicon glyphicon-chevron-right"></span>
						</button>
					</div>
				</form>
			</div>
		</div>
	</c:if>
	<c:if test="${!bill}">

		<div class="jumbotron container h4" id="jumbotrondiv" align="center"
			style="min-height: 600px;">
			<c:if test="${success}">
			Thanks for shopping with us.<br>
				<br> The Invoice has been mailed to you since we are trying to be as eco-friendly as possible.<br>
				<br>
			Happy Shopping with Organocart<br>
				<br>
				<br>
				<div style="display: inline-block">
					<a target="_newtab" href="https://www.google.com/gmail/"
						type="button" id="continuebutton" class="btn"><span
						class="glyphicon glyphicon-envelope"></span> Check Mail </a> <a
						href="buyproductpage" type="button" id="continuebutton"
						class="btn"><span class="glyphicon glyphicon-shopping-cart"></span>
						Buy More Products</a>

					<h3 style="color: #689f38">
						Love Nature <span class="glyphicon glyphicon-tree-deciduous"></span>
						<br><br>&emsp;&emsp;&emsp;Save Earth&nbsp;<i
							class="fa fa-globe" aria-hidden="true"></i>
					</h3>

				</div>
			</c:if>
			<c:if test="${!success}"><h3>Sorry For the inconvenience.</h3> <br>
				Email sending failed due to server error...Please try again later !!! Continue shopping until then<br>
				<br>
				<br>
				<a href="buyproductpage" type="button" id="continuebutton"
					class="btn"><span class="glyphicon glyphicon-shopping-cart"></span>
					Continue Shopping</a>

			</c:if>
		</div>


	</c:if>
</body>
<jsp:include page="footer.jsp"></jsp:include>

</html>