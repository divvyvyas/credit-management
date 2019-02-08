<%@page errorPage="errorPage.jsp" %>
<%@  taglib  prefix="c"   uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<title>CREDIT MANAGEMENT</title>
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
				padding: 3%;
			}
			#div{
				padding: 20px;
				border-radius: 20px;
				position: absolute;
				color: white;
				background: rgba(0,0,0,0.8);
				top: 50%;
				left: 50%;
				transform: translate(-50%,-50%);
			}
			button {
				width: 100%;
			}
		</style>
	</head>
	<body>
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
			<div id="div">
				<h1 class="h3 text-center">Welcome To Home Page</h1>
				<h2 class="h4 text-center">Choose Task To Perform</h2>
				<div class="row">
					<div class="col-lg-4"><a href="addUser.jsp"><button class="btn btn-light text-primary"><b>Add User</b></button></a></div>
					<div class="col-lg-4"><a href="OperateServlet?operate=showUser"><button class="btn btn-light text-primary"><b>Show All User</b></button></a></div>
					<div class="col-lg-4"><a href="OperateServlet?operate=records"><button class="btn btn-light text-primary"><b>Transfer Records</b></button></a></div>
				</div>
			</div>
		</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script>
		$('#alert').fadeOut(5000);
		</script>
	</body>
</html>