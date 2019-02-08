<%@ taglib  prefix="c"   uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
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
			input{
				border: none;
				outline: none;
				background: none;
				border-bottom: 2px solid;
				width: 100%;
			}
			.input{
				border: 1px solid;
				width: auto;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<form action="OperateServlet">
				<h1 class="h1 text-center">Add User</h1><br>
				<input type="hidden" name="operate" value="AddUser">
				<div class="row">
					<div class="col-xl col-md col-lg"></div>
					<div class="col-xl-5 col-md-8 col-lg-6">
						<table class="table table-bordered table-striped table-hover table-responsive">
							<tr>
								<td><h3 class="h3">Name: </h3></td>
								<td><h3 class="h3"><input required="required" type="text" placeholder="Name" name="name"></h3></td>
							</tr>
							<tr>
								<td><h3 class="h3">College: </h3></td>
								<td><h3 class="h3"><input required="required" type="text" placeholder="College" name="college"></h3></td>
							</tr>
							<tr>
								<td><h3 class="h3">E-mail: </h3></td>
								<td><h3 class="h3"><input required="required" type="email" placeholder="E-mail" name="email"></h3></td>
							</tr>
							<tr>
								<td><h3 class="h3">Age: </h3></td>
								<td><h3 class="h3"><input required="required" type="text" placeholder="Age" name="age"></h3></td>
							</tr>
							<tr>
								<td><h3 class="h3">Credit: </h3></td>
								<td><h3 class="h3"><input required="required" type="text" placeholder="Credit" name="credit"></h3></td>
							</tr>
							<tr>
								<td><h3 class="h3 text-center"><a class="text-dark" href="index.jsp"><i class='fas fa-arrow-circle-left text-dark'></i>BACK</a></h3></td>
								<td><h3 class="h3"><input class="input" type="submit"></h3></td>
							</tr>
						</table>
					</div>
					<div class="col-xl col-md col-lg"></div>
				</div>
			</form>
		</div>
	</body>
	<c:if test="${not empty param.msg }">
		<script>
			alert('${param.msg }');
		</script>
	</c:if>
</html>