<%-- 
    Document   : despliegueProductos
    Created on : 3/12/2020, 01:30:47 AM
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
                    <li><a href="addProducto.jsp" class="waves-effect waves-light btn"><i class="material-icons left">add</i>Agregar productos.</a></li>
                </ul>
            </div>
        </nav>

        <section class="container">
            <br><br>
            <h3 class="white-text">Despliegue de productos (para edición).</h3>
            <br>
            <table class="striped responsive-table centered blue-grey lighten-3 z-depth-4" style="border-radius: 20px;">
                <thead>
                    <tr>
                        <th class="centeredTextTitleTable">Id</th>
                        <th class="centeredTextTitleTable">Nombre.</th>
                        <th class="centeredTextTitleTable">Descripción.</th>
                        <th class="centeredTextTitleTable">Precio</th>
                        <th class="centeredTextTitleTable">Existencia</th>
                        <th class="centeredTextTitleTable">Opciones</th>
                    </tr>
                </thead>

                <tbody>

                    <%
                        Connection cnx = null;
                        Statement sta = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            cnx = DriverManager.getConnection("jdbc:mysql://us-cdbr-east-02.cleardb.com/heroku_ccea1cf4896460c?user=b5a529b56bb57f&password=f2643e0f");
                            sta = cnx.createStatement();
                            rs = sta.executeQuery("select * from producto");

                            while (rs.next()) {
                    %>

                    <tr>
                        <td class="columnasDespliegue"><b>
                                <a  href="verProducto.jsp?cod=<%out.print(rs.getString(1));%>"
                                    class=" blue-grey darken-4 waves-light btn z-depth-2"
                                    style="border-radius: 20px;"><i class="material-icons right">remove_red_eye</i>ID: <%out.print(rs.getString(1));%></a>
                            </b></td>
                        <td class="columnasDespliegue"><%out.print(rs.getString(2));%></td>
                        <td class="columnasDespliegue"><%out.print(rs.getString(3));%></td>
                        <td class="columnasDespliegue"><b>$</b><%out.print(rs.getString(4));%></td>
                        <td class="columnasDespliegue"><%out.print(rs.getString(5));%></td>
                        <td class="centeredOptions">
                            <a 
                                href="editProductoForm.jsp?cod=<%out.print(rs.getString(1));%>"
                                class="waves-effect waves-light btn btnOptions blue-grey darken-3 topButton"><i
                                    class="material-icons left">edit</i></a>
                            <a data-target="modal<%out.print(rs.getString(1));%>" class="modal-trigger waves-effect waves-light btn btnOptions red darken-3 waves-effect waves-red bottomButton"><i class="material-icons left">delete</i></a>
                        </td>
                    </tr>

                    <!-- Modal Structure -->
                <div id="modal<%out.print(rs.getString(1));%>" class="modal">
                    <div class="modal-content">
                        <h4>Confirmación de borrado.</h4>
                        <p>¿En verdad desea eliminar el producto llamado <b><%out.print(rs.getString(2));%></b>?</p>
                    </div>
                    <div class="modal-footer">
                        <a href="eliminarProductos.jsp?cod=<%out.print(rs.getString(1));%>" class="modal-close waves-effect waves-green btn green darken-3"><i class="material-icons left">done</i>Agree</a>
                    </div>
                </div>

                <%
                        }
                        sta.close();
                        rs.close();
                        cnx.close();

                    } catch (Exception e) {
                        out.print("Fallo" + e);
                    }
                %>
            </table>
        </section>



    </body>
    <script src="Recursos/js/jquery.js"></script>
    <script src="Recursos/js/materialize.min.js"></script>
    <script src="Recursos/js/implementations.js"></script>

</html>
