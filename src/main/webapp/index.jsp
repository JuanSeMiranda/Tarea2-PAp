<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Pagina Principal</title>
  </head>
  
  <style>
	body{
		background: url("img/webb-dark.png");
		background-repeat: repeat;
	}
	
	.navbar{
		background: rgba(0, 0, 0, 0.6);
	}
	
	.d-block{
		width: auto;
		height: auto;
		max-height: 550px;
	}
	
	.contenedor-imagen{
		width: 100%;
		height: 550px;
		overflow: hidden;
		text-align: center;
	}
	
	.contenedor-imagen img{
		width: 100%;
	}
  </style>
  <!-- PALETA DE COLORES
  botones -- #5DC68A
  navbar -- rgba(0, 0, 0, 0.6)
  fondo general -- background: url("img/webb-dark.png"); background-repeat: repeat;
  letras -- #F7F0F5
   -->
  
  <body>
	<%@include file="/nav.jsp" %>
	
	<div class="container" style="right: 0; left: 0; margin-top: 70px">
		<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <div class="contenedor-imagen">
		      	<img src="img/sars-cov.png" class="d-block w-100" alt="fallo imagen">
		      </div>
		      <div class="carousel-caption d-none d-md-block">
		        <h5>First slide label</h5>
		        <p>Some representative placeholder content for the first slide.</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <div class="contenedor-imagen">
		      	<img src="img/ganso.jpg" class="d-block w-100" alt="fallo imagen">
		      </div>
		      <div class="carousel-caption d-none d-md-block">
		        <h5>Second slide label</h5>
		        <p>Some representative placeholder content for the second slide.</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <div class="contenedor-imagen">
		      	<img src="img/mkBand.jpg" class="d-block w-100" alt="fallo imagen">
		      </div>
		      <div class="carousel-caption d-none d-md-block">
		        <h5>Third slide label</h5>
		        <p>Some representative placeholder content for the third slide.</p>
		      </div>
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
	</div>
	
<!--  CODIGO PARA LISTAR LOS ESPECTACULOS
	<div class="container" style="right: 0; left: 0; margin-top: 70px">
		<div class="card mt-2 p-2" style="flex-direction: row">
		  <img class="card-img w-25" src="https://s3.amazonaws.com/creativetim_bucket/products/19/original/opt_rcc_thumbnail.jpg?1459863435" alt="Card image">
		  <div class="card-body w-75">
		    <h4 class="card-title">Espectaculo1</h4>
		    <p class="card-text">Some example text. aposjdapdaps laksndlasdlkas asldj asdasfdapofpa adofnadfjfasda asojasodoaspodkp  askd saoda lisajdoaisjdaposjdiasdjiajd  asidjaod</p>
		    <a href="#" class="btn btn-primary">Ver mas informacion</a>
		  </div>
		</div>
		<div class="card mt-2 p-2" style="flex-direction: row">
		  <img class="card-img w-25" src="https://cdn.dribbble.com/users/218084/screenshots/8929498/bookmarks.png?compress=1&resize=400x300" alt="Card image">
		  <div class="card-body w-75">
		    <h4 class="card-title">Espectaculo2</h4>
		    <p class="card-text">Some example text. aposjdapdaps laksndlasdlkas asldj asdasfdapofpa adofnadfjfasda asojasodoaspodkp  askd saoda lisajdoaisjdaposjdiasdjiajd  asidjaod</p>
		    <a href="#" class="btn btn-primary">Ver mas informacion</a>
		  </div>
		</div>
		<div class="card mt-2 p-2" style="flex-direction: row">
		  <img class="card-img w-25" src="img/fairly-colorful.jpg" alt="Card image">
		  <div class="card-body w-75">
		    <h4 class="card-title">Espectaculo3</h4>
		    <p class="card-text">Some example text. aposjdapdaps laksndlasdlkas asldj asdasfdapofpa adofnadfjfasda asojasodoaspodkp  askd saoda lisajdoaisjdaposjdiasdjiajd  asidjaod</p>
		    <a href="#" class="btn btn-primary">Ver mas informacion</a>
		  </div>
		</div>
		<div class="card mt-2 p-2" style="flex-direction: row">
		  <img class="card-img w-25" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0S4NHMpzqH4PHqhpM_mkHySVZxvkzeWIT0w&usqp=CAU" alt="Card image">
		  <div class="card-body w-75">
		    <h4 class="card-title">Espectaculo4</h4>
		    <p class="card-text">Some example text. aposjdapdaps laksndlasdlkas asldj asdasfdapofpa adofnadfjfasda asojasodoaspodkp  askd saoda lisajdoaisjdaposjdiasdjiajd  asidjaod</p>
		    <a href="#" class="btn btn-primary">Ver mas informacion</a>
		  </div>
		</div>
	</div>
-->

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
  </body>
</html>
