<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <title>Consulta Espectaculos</title>
    <style><%@include file="css/style_ce.css"%></style>
</head>
<body>
    <jsp:include page="nav.jsp" /> 
    <div class="container" id="container">
        <div class="row seleccion-plataforma" id="seleccion-plataforma">
                <div class="col-4 content-plataforma">
                    <p class="text-white text mr-2">Plataformas:</p>

                    <div class="dropdown">
                        <button class="btn btn-success dropdown-toggle shadow" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Cargando
                        </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" id="dropPlataformas">
                        </div>
                    </div>
                </div>
        </div>
           
        <div class="row container-espectaculos" id="container-espectaculos">
            
        </div>
        
    </div>
    
    <div class="modal-espectaculo shadow">
        <button class="close-btn" id="close">x</button>
        <div class="img-container" id="img-container">
            <img src="" alt="" id="modal-img">
        </div>

        <div class="text-container">
            <h2 class="text-title" id="modal-title"></h2>
            <p class="text" id="description"></p>

            <div class="container-info-espectaculo">
                <div class="titles-info" id="titles-info">
                    <p class="title-info">Duracion en minutos</p>
                    <p class="title-info">Cantidad minima de espectadores</p>
                    <p class="title-info">Cantidad maxima de espectadores</p>
                    <p class="title-info">Sitio Web</p>
                    <p class="title-info">Costo</p>
                    <p class="title-info">Fecha de registro</p>
                </div>
                <div class="info" id="info">
                    <p class="info-item text-success" id="duracionMin"></p>
                    <p class="info-item text-success" id="cantMinEspectadores"></p>
                    <p class="info-item text-success" id="cantMaxEspectadores"></p>
                    <p class="info-item text-success" id="url"></p>
                    <p class="info-item text-success" id="costo"></p>
                    <p class="info-item text-success" id="fechaRegistro"></p>
                </div>
            </div>
        </div>
    </div>

    <div class="img-display" id="img-display">
        <img src="" alt="" id="show-img">
        <button class="close-btn" id="close-img-display">CERRAR</button>
    </div>
    
    <div class="overlay"></div>
        
        <jsp:include page="footer.jsp" /> 
        <script type="module" src="js/views/plataforma.js"></script>
        <script type="module" src="js/modal.js"></script>

</body>
</html>