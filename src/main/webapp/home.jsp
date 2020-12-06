<%-- 
    Document   : index
    Created on : 3/12/2020, 01:10:38 AM
    Author     : Luis Enrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

<body class="blue-grey darken-2">

    <nav>
        <div class="nav-wrapper blue-grey darken-4">
            <ul id="nav-mobile" class="right">
                <li><a href="badges.html">Reporte PDF</a></li>
                <li><a href="collapsible.html">Generar Gráfico.</a></li>
                <li><a href="sass.html">Cerrar sesión.</a></li>
            </ul>
        </div>
    </nav>

    <section class="container">
        <br><br>
        <h3 class="white-text">Menu de gestión.</h3>
        <br>
        <div class="card z-depth-4 blue-grey darken-4 radius-generator">
            <div class="card-content">
                <p class="white-text">Seleccione el apartado que desea gestionar.</p>
            </div>
            <div class="card-tabs">
                <ul class="tabs tabs-fixed-width  blue-grey darken-3">
                    <li class="tab"><a class="white-text" href="#test4">Categorias.</a></li>
                    <li class="tab"><a class="white-text" href="#test5">Producto</a></li>
                    <li class="tab"><a class="white-text" href="#test6">Usuario</a></li>
                </ul>
            </div>
            <div class="card-content blue-grey darken-2 radius-generator">
                <div id="test4" class="justificador">

                    <a
                        class="waves-effect buttonsMine waves-light btn-lateral-left btn-large waves-effect waves-teal white blue-grey-text text-darken-4"><i
                            class="material-icons left">add</i><b>Agregar categoria</b></a>
                    <a
                        class="waves-effect buttonsMine waves-light btn-large waves-effect waves-teal white blue-grey-text text-darken-4"><i
                            class="material-icons left">edit</i><b>Editar categorias</b></a>
                    <a
                        class="waves-effect buttonsMine waves-light btn-lateral-right btn-large waves-effect waves-teal white blue-grey-text text-darken-4"><i
                            class="material-icons left">delete</i><b>Eliminar categorias</b></a>

                </div>
                <div id="test5" class="justificador">

                    <a
                        class="waves-effect buttonsMine waves-light btn-lateral-left btn-large waves-effect waves-teal white blue-grey-text text-darken-4"><i
                            class="material-icons left">add</i><b>Agregar productos</b></a>
                    <a
                        class="waves-effect buttonsMine waves-light btn-large waves-effect waves-teal white blue-grey-text text-darken-4"><i
                            class="material-icons left">edit</i><b>Editar productos</b></a>
                    <a
                        class="waves-effect buttonsMine waves-light btn-lateral-right btn-large waves-effect waves-teal white blue-grey-text text-darken-4"><i
                            class="material-icons left">delete</i><b>Eliminar productos</b></a>

                </div>
                <div id="test6" class="justificador">

                    <a
                        class="waves-effect buttonsMine waves-light btn-lateral-left btn-large waves-effect waves-teal white blue-grey-text text-darken-4"><i
                            class="material-icons left">add</i><b>Agregar usuarios</b></a>
                    <a
                        class="waves-effect buttonsMine waves-light btn-large waves-effect waves-teal white blue-grey-text text-darken-4"><i
                            class="material-icons left">edit</i><b>Editar usuarios</b></a>
                    <a
                        class="waves-effect buttonsMine waves-light btn-lateral-right btn-large waves-effect waves-teal white blue-grey-text text-darken-4"><i
                            class="material-icons left">delete</i><b>Eliminar usuarios</b></a>

                </div>
            </div>
        </div>
    </section>



</body>
<script src="Recursos/js/jquery.js"></script>
<script src="Recursos/js/materialize.min.js"></script>
<script src="Recursos/js/implementations.js"></script>

</html>

