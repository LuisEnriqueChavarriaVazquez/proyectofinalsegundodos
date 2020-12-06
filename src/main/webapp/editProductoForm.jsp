<%-- 
    Document   : editProductoForm
    Created on : 3/12/2020, 01:29:19 AM
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
                <li><a href="badges.html">Volver al inicio.</a></li>
            </ul>
        </div>
    </nav>

    <section class="container">
        <br><br>
        <h3 class="white-text">Editar producto.</h3>
        <div class="mainBox z-depth-4" style="border-radius: 50px;">
            <div class="titleForm blue-grey darken-4 robotoRegular white-text">Datos de producto.</div>
            <div class="formularioUsuario blue-grey darken-3">
                <div class="row">
                    <form class="col s12">
                        <div class="row">
                            <div class="input-field col s12">
                                <i class="material-icons prefix white-text">looks_one</i>
                                <input id="icon_prefix_nombre_producto" type="text" class="white-text"
                                    name="nombreProducto">
                                <label for="icon_prefix_nombre_producto">Nombre</label>
                            </div>
                            <br><br>
                            <div class="input-field col s12">
                                <i class="material-icons prefix white-text">looks_two</i>
                                <input id="icon_prefix_descripcion_producto" type="password" class="white-text"
                                    name="productoDescripcion">
                                <label for="icon_prefix_descripcion_producto">Descripción</label>
                            </div>
                            <br><br>
                            <div class="input-field col s6">
                                <i class="material-icons prefix white-text">attach_money</i>
                                <input id="icon_prefix_precio" type="number" class="white-text" name="productoPrecio">
                                <label for="icon_prefix_precio">Precio</label>
                            </div>
                            <br><br>
                            <div class="input-field col s6">
                                <i class="material-icons prefix white-text">scatter_plot</i>
                                <input id="icon_prefix_existencia" type="number" class="white-text"
                                    name="productoExistencia">
                                <label for="icon_prefix_existencia">Existencia</label>
                            </div>
                            <div class="containerEnvio">
                                <button
                                    class="z-depth-4 btn-large waves-effect waves-teal white btnEnvio text-darken-4 blue-grey-text robotoGrueso"
                                    type="submit">
                                    Actualizar.
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

</body>
<script src="js/jquery.js"></script>
<script src="js/materialize.min.js"></script>
<script src="js/implementations.js"></script>

</html>