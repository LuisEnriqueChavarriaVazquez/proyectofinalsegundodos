<%-- 
    Document   : index
    Created on : 3/12/2020, 01:10:38 AM
    Author     : Luis Enrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bienvenida</title>

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="Recursos/css/materialize.css">
        <link rel="stylesheet" href="Recursos/css/estilos.css">

    </head>

    <body class="teal darken-3" >
        <br><br><br><br>
        <div class="row" style="width: 100%; height: 500px; padding: 20px 25% 20px 25%; display: flex; flex-direction: column; align-items: center; justify-content: center;">
            <div class="col s12 m12">
                <div class="card white  z-depth-5 radius-generator">
                    <div class="card-content teal-text">
                        <span class="card-title"><b>Proceso exitoso!!!</b> <i class="material-icons left">done_all</i></span>
                        <p>Puede ir a cualquiera de las secciones de despliegue que prefiera.</p>
                    </div>
                    <div class="card-action blue-grey lighten-2">
                        <a href="despliegueCategorias.jsp" class="white teal-text waves-effect waves-light btn"><i class="material-icons left">filter_1</i>Categorias.</a>
                        <a href="despliegueProductos.jsp" class="white teal-text waves-effect waves-light btn"><i class="material-icons left">filter_2</i>Productos.</a>
                        <a href="despliegueUsuarios.jsp" class="white teal-text waves-effect waves-light btn"><i class="material-icons left">filter_3</i>Usuarios.</a>
                    </div>
                </div>
                <div class="col s12 m12" style="display: flex; align-items: center; justify-content: center;">
                    <img src="Recursos/img/ready_1.png" width="60%">
                </div>
            </div></div>


    </body>
    <script src="Recursos/js/jquery.js"></script>
    <script src="Recursos/js/materialize.min.js"></script>
    <script src="Recursos/js/implementations.js"></script>

</html>

