<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
<title>Alta de Usuario | Tipo</title>
</head>

<body>

	<h1 class="mb-4 textoLabel">Alta Usuario | Elegir tipo</h1>
	
	<form action="altaUsuarioFinal.jsp" method="post">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<label class="input-group-text" for="tipoUsuario">Tipo de Usuario</label>
			</div>
			<select class="custom-select" id="tipoUsuario" name="tipoUsuario">
				<option selected>Indique el tipo de usuario</option>
				<option value="espectador">Espectador</option>
				<option value="artista">Artista</option>
			</select>
		</div>
		
		<button type="submit" class="btn btn-primary">Continuar Alta</button>
	</form>
	
	<%String tipoUsuario=request.getParameter("tipoUsuario");%>


	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

</body>
</html>