<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="datatypes.DtUsuario"%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<title>Seguir Usuarios</title>
	</head>
	
	<style>
		body{
			background: url("img/webb-dark.png");
			background-repeat: repeat;
		}
		
		.navbar{
			background: rgba(0, 0, 0, 0.6);
		}
		
		.card-img{
			max-width: 130px;
			max-height: 110px;
			min-width: 100px;
			min-height: 100px;
		}
		
		.card{
			background: rgba(0, 0, 0, 0.6);
		}
		
		.card-title{
			color: #F7F0F5;
		}
		
		.card-text{
			color: #F7F0F5;
		}
		
	</style>
	
	<body>
		<nav class="navbar navbar-expand-sm navbar-dark fixed-top">
		  <div class="container-fluid p-1">
		    <a class="navbar-brand me-5" href="#">CoronaTickets.uy</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		      <!-- BARRA BUSCADORA DE USUARIOS(CASO NO MINIMO)
		      <form class="d-flex w-50 me-2">
		        <input id="inputEspectaculo" class="form-control me-2" type="search" placeholder="Usuario..." aria-label="Search">
		        <button class="btn btn-outline-success" type="submit">Buscar</button>
		      </form>
		      -->
		      <form class="d-flex" action="SeguirUsuarios" method="post">
		      	<button class="btn btn-outline-success" type="submit">Mostrar todo</button>
		      </form>
		      <ul class="navbar-nav" style = "margin: 0 auto; margin-right: 0">
		        <li class="nav-item">
		          <form action="CerrarSesion" method="post">
		            <a class="nav-link btn" onclick="this.parentNode.submit();">Cerrar Sesion</a>
		          </form>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
	
		<div class="container" style="right: 0; left: 0; margin-top: 110px;">
			<input type="hidden" name="listaUsuarios">
			<% 
			ArrayList<DtUsuario> usuarios = (ArrayList<DtUsuario>) request.getAttribute("listaUsuarios");
			ArrayList<String> usuariosSeguidos = (ArrayList<String>) request.getAttribute("listaUsuariosSeguidos");
			%>
			<%if(usuarios != null){ %>
				<%for (DtUsuario dtu : usuarios) { %>
					<div class="card mb-4 p-2" style="flex-direction: row">
					  <img class="card-img" src="<%=dtu.getUrlImg()%>" alt="Card image">
					  <div class="card-body w-75">
					  
					    <h4 class="card-title"><%=dtu.getNickname()%></h4>
					    <p class="card-text"><%=dtu.getCorreo()%></p>
					    
					    <form action="SeguirUsuarios" method="post">
						    <%if(usuariosSeguidos.contains(dtu.getNickname())){ %>
						    	<button type="submit" name="dejarDeSeguirUsuario" value="<%=dtu.getNickname()%>" class="btn btn-success">Dejar de seguir</button>
						    <%}else{ %>
						    	<button type="submit" name="seguirUsuario" value="<%=dtu.getNickname()%>" class="btn btn-outline-success">Seguir</button>
						    <%} %>
					    </form>
					  </div>
					</div>
				<%} %>
			<%} %>
		</div>
		
	    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
	</body>
</html>