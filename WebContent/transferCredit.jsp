<%@page errorPage="errorPage.jsp" %>
<%@  taglib  prefix="c"   uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<title>Edit Profile</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.6.3/css/all.css'>
		<style>
			body{
				background-image: url(".jpg");
				background-repeat: no repeat;
				background-size: 100%,auto;
				background-color: #b3d9ff;
			}
			a{
				text-decoration: none;
			}
			h1{
				text-align: center;
			}
			input {
				background: none;
				width: 100%;
				outline: none;
				border: none;
				border-bottom: 1px solid black;
			}
			.input{
				border: 1px solid;
				width: auto;
			}
		</style>
	</head>
	<body>
		<c:forEach var="list" items="${list }">
			<div class="container">
				<form action="OperateServlet" method="post">
					<input type="hidden" name=operate value="pay">
					<h1 class="h1"><i class='fas fa-exchange-alt'></i> Transfer Your Credit</h1><br>
					<div class="row">
						<div class="col-xl col-md col-lg"></div>
						<div class="col-xl-5 col-md-8 col-lg-6">
							<table class="table table-hover table-bordered table-striped table-responsive">
								<tr><td><h3 class="h3">From:</h3></td><td><h3 class="h3"><input readonly="readonly" type="text" name="fname" value="${list.name }"></h3></td></tr>
								<tr><td><h3 class="h3">To:</h3></td><td><h3 class="h3"><input required="required" placeholder="Enter Full Name" type="text" name="tname"></h3></td></tr>
								<tr><td><h3 class="h3">Amount:</h3></td><td><h3 class="h3"><input required="required" placeholder="Enter Amount" type="number" name="amount"></h3></td></tr>
								<tr><td><a href="OperateServlet?operate=uProfile&name=${list.name }"><h3 class="h3 text-center"><i class='fas fa-arrow-circle-left text-dark'></i></h3></a></td><td><h3 class="h3 text-left"><input type="submit" class="input" value="Send"></h3></td></tr>
							</table>
						</div>
						<div class="col-xl col-md col-lg"></div>
					</div>
				</form>
			</div>
		</c:forEach>
	</body>
</html>