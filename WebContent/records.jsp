<%@page errorPage="errorPage.jsp" %>
<%@  taglib  prefix="c"   uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Transfer Records</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		
		<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.6.3/css/all.css'>
		<style>
			body{
				background-color: #b3d9ff;
				padding: 3%;
			}
			a{
				text-decoration: none;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<h1 class="h1 text-center">Transfer Records</h1><br>
			<div class="row">
				<div class="col-xl col-lg"></div>
				<div class="col-xl-9 col-lg-11">
					<table class="table table-hover table-striped table-bordered table-responsive">
						<thead class="thead-dark">
							<tr>
								<th><h3 class="h3">From</h3></th>
								<th><h3 class="h3 text-center"><i class='fas fa-long-arrow-alt-right'></i></h3></th>
								<th><h3 class="h3">to</h3></th>
								<th><h3 class="h3">Amount</h3></th>
								<th><h3 class="h3">Date-Time</h3></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${list }">
								<tr>
									<td><h3 class="h3">${list.fname }</h3></td>
									<td><h3 class="h3 text-center"><i class='fas fa-long-arrow-alt-right'></i></h3></td>
									<td><h3 class="h3">${list.tname }</h3></td>
									<td><h3 class="h3">${list.amount }</h3></td>
									<td><h3 class="h3">${list.dt }</h3></td>
								</tr>
							</c:forEach>
							<tr>
								<td><h3 class="h3 text-center"><a class="text-dark" href="index.jsp"><i class='fas fa-arrow-circle-left text-dark'></i> BACK</a></h3></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-xl col-lg"></div>
			</div>
		</div>
	</body>
</html>