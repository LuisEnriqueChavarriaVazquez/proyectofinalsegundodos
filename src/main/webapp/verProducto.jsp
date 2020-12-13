<%-- 
    Document   : verCategoria.jsp
    Created on : 7/12/2020, 04:59:27 AM
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

        <nav>
            <div class="nav-wrapper blue-grey darken-4">
                <ul id="nav-mobile" class="right">
                    <li><a href="home.jsp" class="waves-effect waves-light btn"><i class="material-icons left">home</i>Menu de gestión.</a></li>
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
        <br><br>
        <section class="container containerCardVer">
            <div class="row cardVer">
                <div class="col s12">
                    <div class="card blue-grey z-depth-4 darken-1 ">
                        <div class="card-content white blue-grey-text robotoGrueso">
                            <span class="card-title">Nombre: <%out.print(rs.getString(2));%> <br> ID: <%out.print(rs.getString(1));%></span>
                            <br>
                            <section class="row">

                                <div class="col s12 m4 ">
                                    <div class="card blue-grey lighten-4">
                                        <div class="card-content blue-grey-text">
                                            <span class="card-title">Descripción</span>
                                            <p> <%out.print(rs.getString(3));%></p>
                                        </div>
                                    </div>
                                </div>

                                <div class="col s12 m4">
                                    <div class="card blue-grey lighten-4">
                                        <div class="card-content blue-grey-text">
                                            <span class="card-title">Precio</span>
                                            <p> <%out.print(rs.getString(4));%></p>
                                        </div>
                                    </div>
                                </div>

                                <div class="col s12 m4">
                                    <div class="card blue-grey lighten-4">
                                        <div class="card-content blue-grey-text">
                                            <span class="card-title">Existencia</span>
                                            <p> <%out.print(rs.getString(5));%></p>
                                        </div>
                                    </div>
                                </div>

                            </section>
                        </div>
                        <div class="card-action blue-grey lighten-3">
                            <a href="despliegueProductos.jsp" class="waves-effect teal btn-large darken-2 waves-light btn-small"><i class="material-icons left">playlist_add_check</i>Listado de productos.</a>
                            <a href="home.jsp" class="waves-effect teal btn-large darken-2 waves-light btn-small"><i class="material-icons left">home</i>Menu de selección.</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%
                }
                sta.close();
                rs.close();
                cnx.close();

            } catch (Exception e) {
                out.print("Fallo" + e);
            }
        %>


    </body>
    <script src="Recursos/js/jquery.js"></script>
    <script src="Recursos/js/materialize.min.js"></script>
    <script src="Recursos/js/implementations.js"></script>

</html>