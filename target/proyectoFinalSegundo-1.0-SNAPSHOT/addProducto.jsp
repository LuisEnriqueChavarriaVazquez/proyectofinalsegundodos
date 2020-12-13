<%-- 
    Document   : addProducto
    Created on : 3/12/2020, 01:31:58 AM
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

    <body class="blue-grey darken-2">

        <script>
            //index.js  
            function sendEmail() {
                Email.send({
                    Host: "smtp.yourisp.com",
                    Username: "pruebaescomwad",
                    Password: "luisenrique",
                    To: 'luisechvz@gmail.com',
                    From: "pruebaescomwad@gmail.com",
                    Subject: "prueba",
                    Body: "Nuevo producto agregado.",
                }).then(
                        message => alert("mail sent successfully")
                );
            }
        </script>
        
        <nav>
            <div class="nav-wrapper blue-grey darken-4">
                <ul id="nav-mobile" class="right">
                    <li><a href="home.jsp" class="waves-effect waves-light btn"><i class="material-icons left">home</i>Menu de gestión.</a></li>
                    <li><a href="despliegueProductos.jsp" class="waves-effect waves-light btn"><i class="material-icons left">list</i>Despliegue de productos.</a></li>
                </ul>
            </div>
        </nav>

        <section class="container">
            <br><br>
            <h3 class="white-text">Agrega productos.</h3>
            <div class="mainBox z-depth-4" style="border-radius: 50px;">
                <div class="titleForm blue-grey darken-4 robotoRegular white-text">Datos de producto.</div>
                <div class="formularioUsuario blue-grey darken-3">
                    <div class="row">
                        <form class="col s12">
                            <div class="row">


                                <label class="robotoNormal white-text"><b><h5>Categoria</h5></b<br>
                                    <select name="categoriaSelect" 
                                            id="item"
                                            class="browser-default">

                                        <%
                                            Connection cnx = null;
                                            Statement sta = null;
                                            ResultSet rs = null;
                                            ResultSet key = null;

                                            try {
                                                Class.forName("com.mysql.jdbc.Driver");
                                                cnx = DriverManager.getConnection("jdbc:mysql://us-cdbr-east-02.cleardb.com/heroku_ccea1cf4896460c?user=b5a529b56bb57f&password=f2643e0f");
                                                sta = cnx.createStatement();
                                                key = sta.executeQuery("select * from categoria");

                                                while (key.next()) {
                                        %>

                                        <option value="<%out.print(key.getString(1));%>" class="robotoDelgado"><%out.print(key.getString(2));%></option>


                                        <%
                                                }

                                            } catch (Exception e) {
                                                out.print("Fallo" + e);
                                            }
                                        %>
                                        
                                    </select>
                                </label>
                                <br>

                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">looks_one</i>
                                    <input id="icon_prefix_nombre_producto" type="text" class="white-text"
                                           name="nombreProducto" required>
                                    <label for="icon_prefix_nombre_producto">Nombre</label>
                                </div>
                                <br><br>
                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">looks_two</i>
                                    <input id="icon_prefix_descripcion_producto" type="text" class="white-text"
                                           name="productoDescripcion" required>
                                    <label for="icon_prefix_descripcion_producto">Descripción</label>
                                </div>
                                <br><br>
                                <div class="input-field col s6">
                                    <i class="material-icons prefix white-text">attach_money</i>
                                    <input id="icon_prefix_precio" type="number" class="white-text" name="productoPrecio" required>
                                    <label for="icon_prefix_precio">Precio</label>
                                </div>
                                <br><br>
                                <div class="input-field col s6">
                                    <i class="material-icons prefix white-text">scatter_plot</i>
                                    <input id="icon_prefix_existencia" type="number" class="white-text"
                                           name="productoExistencia" required>
                                    <label for="icon_prefix_existencia">Existencia</label>
                                </div>
                                <div class="containerEnvio">
                                    <button
                                        name="envioProducto"
                                        class="z-depth-4 btn-large waves-effect waves-teal white btnEnvio text-darken-4 blue-grey-text robotoGrueso"
                                        type="submit">
                                        Agregar.
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <%
            if (request.getParameter("envioProducto") != null) {

                String nom = request.getParameter("nombreProducto");
                String desc = request.getParameter("productoDescripcion");
                String precio = request.getParameter("productoPrecio");
                String existencia = request.getParameter("productoExistencia");
                 String categoria = request.getParameter("categoriaSelect");

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    cnx = DriverManager.getConnection("jdbc:mysql://us-cdbr-east-02.cleardb.com/heroku_ccea1cf4896460c?user=b5a529b56bb57f&password=f2643e0f");
                    sta = cnx.createStatement();
                    rs = sta.executeQuery("select max(idProducto)+1 from producto");

                    String productoId = "";
                    while (rs.next()) {
                        productoId = rs.getString(1);
                    }

                    sta.executeUpdate("insert into producto values('" + productoId + "','" + nom + "', '" + desc + "', '" + precio + "', '" + existencia + "', '" + categoria +"')");
                    request.getRequestDispatcher("procesoListo.jsp").forward(request, response);
                    sta.close();
                    rs.close();
                    key.close();
                    cnx.close();

                } catch (Exception e) {
                    out.print("Fallo" + e);
                }
            }
        %>



    </body>
    <script src="Recursos/js/jquery.js"></script>
        <script src="https://smtpjs.com/v3/smtp.js"></script>
    <script src="Recursos/js/materialize.min.js"></script>
    <script src="Recursos/js/implementations.js"></script>

</html>
