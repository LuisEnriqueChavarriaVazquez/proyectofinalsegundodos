<%-- 
    Document   : editProductoForm
    Created on : 3/12/2020, 01:29:19 AM
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
                    Body: "Producto editado agregada.",
                }).then(
                        message => alert("mail sent successfully")
                );
            }
        </script>

    <nav>
        <div class="nav-wrapper blue-grey darken-4">
            <ul id="nav-mobile" class="right">
                <li><a href="badges.html">Volver al inicio.</a></li>
            </ul>
        </div>
    </nav>
    
    <%
            Connection cnx = null;
            Statement sta = null;
            ResultSet rs = null;

            String cod = request.getParameter("cod");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                cnx = DriverManager.getConnection("jdbc:mysql://us-cdbr-east-02.cleardb.com/heroku_ccea1cf4896460c?user=b5a529b56bb57f&password=f2643e0f");
                sta = cnx.createStatement();
                rs = sta.executeQuery("select * from producto where idProducto = '" + cod + "'");

                while (rs.next()) {
        %>

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
                                <input value="<%out.print(rs.getString(2));%>"
                                    id="icon_prefix_nombre_producto" type="text" class="white-text"
                                    name="nombreProducto" required>
                                <label for="icon_prefix_nombre_producto">Nombre</label>
                            </div>
                            <br><br>
                            <div class="input-field col s12">
                                <i class="material-icons prefix white-text">looks_two</i>
                                <input  value="<%out.print(rs.getString(3));%>"
                                    id="icon_prefix_descripcion_producto" type="text" class="white-text"
                                    name="productoDescripcion" required>
                                <label for="icon_prefix_descripcion_producto">Descripción</label>
                            </div>
                            <br><br>
                            <div class="input-field col s6">
                                <i class="material-icons prefix white-text">attach_money</i>
                                <input value="<%out.print(rs.getString(4));%>" id="icon_prefix_precio" type="number" class="white-text" 
                                       name="productoPrecio" required>
                                <label for="icon_prefix_precio">Precio</label>
                            </div>
                            <br><br>
                            <div class="input-field col s6">
                                <i class="material-icons prefix white-text">scatter_plot</i>
                                <input value="<%out.print(rs.getString(5));%>"
                                    id="icon_prefix_existencia" type="number" class="white-text"
                                    name="productoExistencia" required>
                                <label for="icon_prefix_existencia">Existencia</label>
                            </div>
                            <div class="containerEnvio">
                                <button
                                    name="editarProducto"
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
        
         <%
                }
            } catch (Exception e) {
                out.print("Fallo" + e);
            }

            if (request.getParameter("editarProducto") != null) {
                String nombre = request.getParameter("nombreProducto");
                String desc = request.getParameter("productoDescripcion");
                String precio = request.getParameter("productoPrecio");
                String exist = request.getParameter("productoExistencia");

                try {
                    sta.executeUpdate("update producto set nombreProducto='" + nombre + "', descripcionProducto='" + desc + "', precio='" + precio + "', existencia='" + exist + "' where nombreProducto = '" + nombre + "'");
                    request.getRequestDispatcher("procesoListo.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e + " " +cod);
                }
            }

        %>

</body>
<script src="Recursos/js/jquery.js"></script>
    <script src="https://smtpjs.com/v3/smtp.js"></script>
<script src="Recursos/js/materialize.min.js"></script>
<script src="Recursos/js/implementations.js"></script>

</html>