<%-- 
    Document   : despliegueCategorias
    Created on : 3/12/2020, 01:31:18 AM
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
                <li><a href="badges.html">Página de inicio.</a></li>
            </ul>
        </div>
    </nav>

    <section class="container">
        <br><br>
        <h3 class="white-text">Despliegue de categorias.</h3>
        <br>
        <table class="striped centered responsive-table blue-grey lighten-3 z-depth-4" style="border-radius: 20px;">
            <thead>
                <tr>
                    <th class="centeredTextTitleTable">Id</th>
                    <th class="centeredTextTitleTable">Nombre.</th>
                    <th class="centeredTextTitleTable">Descripción.</th>
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
                            cnx = DriverManager.getConnection("jdbc:mysql://localhost/mydb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&user=root&password=root");
                            sta = cnx.createStatement();
                            rs = sta.executeQuery("select * from categoria");

                            while (rs.next()) {
                    %>
                
                <tr>
                    <td class="columnasDespliegue"><b><%out.print(rs.getString(1));%></b></td>
                    <td class="columnasDespliegue"><%out.print(rs.getString(2));%></td>
                    <td class="columnasDespliegue"><%out.print(rs.getString(3));%></td>
                    <td class="centeredOptions">
                        <a class="waves-effect waves-light btn btnOptions blue-grey darken-3 topButton"><i class="material-icons left">edit</i></a>
                        <a class="waves-effect waves-light btn btnOptions red darken-3 waves-effect waves-red bottomButton"><i class="material-icons left">delete</i></a>
                    </td>
                </tr>
                
                <%
                            }
                            sta.close();
                            rs.close();
                            cnx.close();

                        } catch (Exception e) {
                            out.print("Fallo" + e);
                        }
                    %>
                
            </tbody>
        </table>

    </section>



</body>
<script src="js/jquery.js"></script>
<script src="js/materialize.min.js"></script>
<script src="js/implementations.js"></script>

</html>
