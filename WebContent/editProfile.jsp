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
				background-size: 100%,100%;
				background-color: #b3d9ff;
				padding: 3%;
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
			button {
				background: none;
			}
		</style>
	</head>
	<body>
		<c:forEach var="list" items="${list }">
		<div class="container">
			<form action="OperateServlet">
				<input type="hidden" name="operate" value="updateUser">
				<h1 class="h1"><i class='fas fa-edit'></i> Edit Your Profile</h1><br>
				<div class="row">
					<div class="col-lg-2"></div>
					<div class="col-lg-8">
						<table class="table table-bordered table-hover table-striped">
							<tr>
								<td><h3 class="h3 text-center"><i class='fas fa-user'></i> Name: </h3></td>
								<td><h3 class="h3"><input required="required" type="text" name="name" value="${list.name }"></h3></td>
							</tr>
							<tr>
								<td><h3 class="h3 text-center"><i class='fas fa-graduation-cap'></i> College: </h3></td>
								<td><h3 class="h3"><input required="required" type="text" name="college" value="${list.college }"></h3></td>
							</tr>
							<tr>
								<td><h3 class="h3 text-center"><i class='fas fa-at'></i> E-mail: </h3></td>
								<td><h3 class="h3"><input required="required" type="email" name="email" value="${list.email }"></h3></td>
							</tr>
							<tr>
								<td><h3 class="h3 text-center"><i class='fas fa-child'></i> Age: </h3></td>
								<td><h3 class="h3"><input required="required" type="text" name="age" value="${list.age }"></h3></td>
							</tr>
							<tr>
								<td><a class="text-dark" href="OperateServlet?operate=uProfile&name=${list.name }"><h3 class="h3 text-center"><i class='fas fa-arrow-circle-left text-dark'></i> BACK</h3></a></td>
								<td><h3 class="h3"><button><input type="submit" value="Update"></button></h3></td>
							</tr>
						</table>
					</div>
					<div class="col-lg-2"></div>
				</div>
			</form>
		</div>
		</c:forEach>
	</body>
</html>