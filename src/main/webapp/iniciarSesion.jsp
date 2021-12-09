<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Bootstrap CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<title>Iniciar Sesion</title>
	</head>
	<style>
		body{
			background: url("img/webb-dark.png");
			background-repeat: repeat;
		}
		
		.navbar{
			background: rgba(0, 0, 0, 0.6);
		}
		
		.textoLabel{
			color: #F7F0F5;
		}
		
		.container{
			margin: 0 auto;
			margin-top: 120px;
			background: rgba(0, 0, 0, 0.6);
			border-radius: 15px;
		}
	</style>
	<body>
		<nav class="navbar navbar-dark fixed-top">
		  <div class="container-fluid p-1">
		    <a class="navbar-brand me-5" href="#">CoronaTickets.uy</a>
		    <ul class="navbar-nav" style = "margin: 0 auto; margin-right: 0">
		      <li class="nav-item">
		        <a class="nav-link" href="#">Crear Usuario</a>
		      </li>
		    </ul>
		  </div>
		</nav>
		
		<div class="container w-75 p-3">
			<h1 class="mb-4 textoLabel">Iniciar Sesion</h1>
			<form action="IniciarSesion" method="post">
				<div class="mb-3">
				  <label for="formGroupExampleInput" class="form-label textoLabel">Email o nickname</label>
				  <input type="text" class="form-control" name="inputUser">
				</div>
				<div class="mb-5">
				  <label for="formGroupExampleInput2" class="form-label textoLabel">Password</label>
				  <input type="password" class="form-control" name="inputPassword">
				</div>
				<div class="mb-3 text-center">
				  <button type="submit" class="btn btn-success w-50">Ingresar</button>
				</div>	
			</form>
		</div>
	    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
	</body>
</html>