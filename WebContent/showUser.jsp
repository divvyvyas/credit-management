<%@page errorPage="errorPage.jsp" %>
<%@  taglib  prefix="c"   uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<title>User List</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		
		<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.6.3/css/all.css'>
		<style>
			a{
				text-decoration: none;
			}
			body{
				background-image: url("");
				background-color: #b3d9ff;
			}
			.table-align{
				margin: auto;
				width: 100%;
			}
		</style>
	</head>
	<body>
		<div  class="container border">
			<div class="row">
				<div class="col-sm col-lg"></div>
				<div class="col-sm-6 col-lg-4">
					<c:if test="${not empty param.msg }">
						<div style="z-index: 10;position: fixed" id="alert" class="alert alert-success text-center alert-dismissible">
							<strong>Information: </strong> ${param.msg }
						</div>
					</c:if>
				</div>
				<div class="col-sm col-lg"></div>
			</div>
			<h1 class="h1 text-center">Select User To Perform Operation's</h1><br>
			<div class="row">
				<div class="col-xl-2 col-lg"></div>
				<div class="col-xl-8 col-lg-9">
					<table class="table table-striped table-hover table-bordered table-responsive table-align">
						<thead class="thead-dark">
							<tr>
								<th><h3 class="h3 text-center">#</h3></th>
								<th><h3 class="h3">NAME: </h3></th>
								<th><h3 class="h3">COLLEGE: </h3></th>
								<th><h3 class="h3">E-MAIL ID: </h3></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${list }">
								<tr>
									<th><span style="color: black;width: 100%" class='fas fa-user text-center h3'></span></th>
									<td><h3 class="h3"><a href="OperateServlet?operate=uProfile&name=${list.name }">${list.name }</h3></td>
									<td><h3 class="h3">${list.college }</h3></td>
									<td><h3 class="h3">${list.email }</h3></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-xl-2 col-lg"></div>
			</div>
		</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script>
			$('#alert').fadeOut(5000);
		</script>
	</body>
</html>