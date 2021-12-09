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
<title>Alta de Usuario</title>
</head>
<body>

	<h1 class="mb-4 textoLabel">Alta Usuario | Final</h1>

	<%String tipoUsuario=request.getParameter("tipoUsuario");%>
	
	<%if(tipoUsuario.equals("espectador") || tipoUsuario.equals("artista")){%>
	
		Continuemos con el alta de usuario de tipo "<%=tipoUsuario%>"
		
		<form action="AltaUsuario" method="post">
		  <input type="hidden" name="tipoUsuario" value="<%=tipoUsuario%>">
		  <div class="form-group">
		    <label for="Nickname">Nickname</label>
		    <input type="text" class="form-control" name="nickname" placeholder="Ingrese Nickname" required>
		  </div>
		  <div class="form-group">
		    <label for="Nombre">Nombre</label>
		    <input type="text" class="form-control" name="nombre" placeholder="Ingrese Nombre" required>
		  </div>
		  <div class="form-group">
		    <label for="Apellido">Apellido</label>
		    <input type="text" class="form-control" name="apellido" placeholder="Ingrese Apellido" required>
		  </div>
		  <div class="form-group">
		    <label for="Password">Password</label>
		    <input type="password" id="password-field" class="form-control" name="password" placeholder="Ingrese Password" required>
		    <i id="pass-status" class="fa fa-eye" aria-hidden="true" onClick="viewPassword()"></i>
		  </div>
		  <div class="form-group">
		    <label for="confPassword">Confirmacion Password</label>
		    <input type="password" class="form-control" name="confpassword" placeholder="Reingrese Password" required>
		  </div>
		  <div class="form-group">
		    <label for="Email">Email</label>
		    <input type="email" class="form-control" name="email" placeholder="Ingrese Email" required>
		  </div>
		  <div class="form-group">
		    <label for="imagen">Imagen (Opcional)</label>
		    <input type="file" class="form-control" name="imagen" placeholder="Seleccione una imagen">
		  </div>
		  
		  <div class="form-group">
		    <label for="Dia">Dia</label>

		    <input type="number" class="form-control" name="dia" placeholder="Ingrese un dia del mes" min = 1 max = 31 value=1>
		  </div>
		  
		  <div class="form-group">
		    <label for="Mes">Mes</label>

		    <input type="number" class="form-control" name="mes" placeholder="Ingrese un mes" min = 1 max = 12 value=1>
		  </div>
		  
		  <div class="form-group">
		    <label for="Anio">Anio</label>

		    <input type="number" class="form-control" name="anio" placeholder="Ingrese un año" min = 1900 value=1900>
		  </div>
		  
		  <%if (tipoUsuario.equals("artista")){%>
			<div class="form-group">
		    	<label for="Descripcion">Descripcion</label>
		    	<input type="text" class="form-control" name="descripcion" placeholder="Ingrese Descripcion" required>
		  	</div>
		  	<div class="form-group">
		    	<label for="Biografia">Biografia (Opcional)</label>
		    	<input type="text" class="form-control" name="biografia" placeholder="Ingrese Biografia">
		  	</div>
		  	<div class="form-group">
		    	<label for="Url">Link URL (Opcional)</label>
		    	<input type="text" class="form-control" name="url" placeholder="Ingrese una URL para su pagina">
		  	</div>
		<%}%>
		
			<button type="submit" class="btn btn-primary">Confirmar Alta</button>
		</form>
	<%} else{%>
		No ha ingresado ningun tipo de usuario, vuelva para atras.
		<form action="altaUsuarioTipo.jsp" method="post">
			<button type="submit" class="btn btn-primary">Volver atras</button>
		</form>
	<%}%>
	
	<script>
		function viewPassword()
		{
		  var passwordInput = document.getElementById('password-field');
		  var passStatus = document.getElementById('pass-status');
		 
		  if (passwordInput.type == 'password'){
		    passwordInput.type='text';
		    passStatus.className='fa fa-eye-slash';
		    
		  }
		  else{
		    passwordInput.type='password';
		    passStatus.className='fa fa-eye';
		  }
		}
	</script>
		
	
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
		
	<script src="https://kit.fontawesome.com/56195d71f9.js" crossorigin="anonymous"></script>

</body>
</html>