<%@page errorPage="errorPage.jsp" %>
<%@  taglib  prefix="c"   uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<title>Profile</title>
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
				background-size: 100%,100%;
				background-color: #b3d9ff;
			}
			a{
				text-decoration: none;
			}
			h1{
				text-align: center;
			}
			input {
				width: 100%;
				background: none;
				outline: none;
				border: none;
				color: black;
			}
		</style>
	</head>
	<body>
		<c:forEach var="list" items="${list }">
			<div class="container">
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
				<h1 class="h1"><i class='fas fa-handshake'></i> Welcome, ${list.name }..!!</h1><br>
				<div class="row">
					<div class="col-xl col-lg col-md"></div>
					<div class="col-xl-6 col-lg-7 col-md-9">
						<table align="center" class="table table-hover table-responsive table-bordered table-striped">
							<tr>
								<th><h3 class="h3 text-center"><i class='fas fa-user'></i> Name: </h3></th>
								<td><h3 class="h3"><input readonly="readonly" type="text" name="name" value="${list.name }"></h3></td>
							</tr>
							<tr>
								<th><h3 class="h3 text-center"><i class='fas fa-graduation-cap'></i> College: </h3></th>
								<td><h3 class="h3"><input readonly="readonly" type="text" name="college" value="${list.college }"></h3></td>
							</tr>
							<tr>
								<th><h3 class="h3 text-center"><i class='fas fa-at'></i> E-mail: </h3></th>
								<td><h3 class="h3"><input readonly="readonly" type="email" name="email" value="${list.email }"></h3></td>
							</tr>
							<tr>
								<th><h3 class="h3 text-center"><i class='fas fa-child'></i> Age: </h3></th>
								<td><h3 class="h3"><input readonly="readonly" type="text" name="age" value="${list.age }"></h3></td>
							</tr>
							<tr>
								<th><h3 class="h3 text-center"><i class='fas fa-wallet'></i> Credit: </h3></th>
								<td><h3 class="h3"><input readonly="readonly" type="text" name="credit" value="${list.credit }"></h3></td>
							</tr>
							<tr>
								<th><h3 class="h3 text-center"><i class='fas fa-edit'></i></h3></th>
								<td><h3 class="h3"><a href="OperateServlet?operate=editProfile&name=${list.name }">Edit Personal Information</a></h3></td>
							</tr>
							<tr>
								<th><h3 class="h3 text-center"><i class='fas fa-trash'></i></h3></th>
								<td><h3 class="h3"><a href="OperateServlet?operate=deleteUser&name=${list.name }">Delete My Account</a></h3></td>
							</tr>
							<tr>
								<th><h3 class="h3 text-center"><i class='fas fa-donate'></i></h3></th>
								<td><h3 class="h3"><a href="OperateServlet?operate=transferCredit&name=${list.name }">Transfer Credit</a></h3></td>
							</tr>
						</table>
					</div>
					<div class="col-xl col-lg col-md"></div>
				</div>
			</div>
		</c:forEach>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script>
			$('#alert').fadeOut(5000);
		</script>
	</body>
</html>