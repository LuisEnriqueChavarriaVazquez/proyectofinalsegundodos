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

    <body class="blue-grey darken-2">

        <nav>
            <div class="nav-wrapper blue-grey darken-4">
                <ul id="nav-mobile" class="right">
                    <li><a href="verGraficoCategoria.jsp" class="waves-effect waves-light btn"><i class="material-icons left">data_usage</i>Gráfico de existencias.</a></li>
                    <li><a href="verGraficoProducto.jsp" class="waves-effect waves-light btn"><i class="material-icons left">insert_chart</i>Gráfico de precios.</a></li>
                </ul>
            </div>
        </nav>

        <section class="container">
            <br><br>
            <h3 class="white-text">Formato en pdf de reporte.</h3>
            <br>
            <section class="white-text robotoNormal row" style="font-size: 20px;">
                <%
                    Connection cnx = null;
                    Statement sta = null;
                    ResultSet rs = null;
                    ResultSet rs1 = null;
                    ResultSet rs2 = null;

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        cnx = DriverManager.getConnection("jdbc:mysql://us-cdbr-east-02.cleardb.com/heroku_ccea1cf4896460c?user=b5a529b56bb57f&password=f2643e0f");
                        sta = cnx.createStatement();
                        String contCategorias = "SELECT * from categoria";
                        String contProductos = "SELECT * from producto";
                        String contUsuarios = "SELECT * from usuario";
                        rs = sta.executeQuery(contCategorias);

                        String categoria = "";
                        String producto = "";
                        String usuario = "";

                %>
                <a class="waves-effect waves-light btn-large white teal-text darken-3" style="width: 100%; height: 100px; display: flex; justify-content: center; align-items: center;" onclick="gen()"><i class="material-icons left">download</i>
                    <b>Descargar el reporte completo.</b></a>
                <script>
                    function gen() {
                        var doc = new jsPDF()
                        var y = 30;
                        //var img = new Image()
                        //img.src = 'Recursos/img/ipn.jpeg'
                        //doc.addImage(img, 'jpeg', 10, 78, 12, 15)

                        doc.setFontSize(22)
                        doc.setTextColor(0, 0, 255)
                        doc.text(20, 20, 'Reporte de general.')
                        doc.setFontSize(18)
                        doc.setTextColor(0, 0, 255)
                        doc.text(20, 20 + 10, 'Listado de categorias.')

                        doc.setFontSize(13);
                        doc.setTextColor(0, 0, 0);
                    <%                        while (rs.next()) {
                    %>

                        doc.text(20, y + 10, 'Id: <%out.print(rs.getString(1));%>');
                        doc.text(20, y + 20, '  *Categoria: <%out.print(rs.getString(2));%>');
                        doc.text(20, y + 30, '  *Descripción: <%out.print(rs.getString(3));%>');
                        y = y + 30;

                    <%
                        }
                        rs1 = sta.executeQuery(contProductos);
                    %>

                        doc.addPage();
                        y = 30;
                        doc.setFontSize(18)
                        doc.setTextColor(0, 0, 255)
                        doc.text(20, 20, 'Listado de productos.')
                        doc.setFontSize(13);
                        doc.setTextColor(0, 0, 0);
                    <%
                        while (rs1.next()) {
                    %>
                        doc.text(20, y + 10, 'Id producto: <%out.print(rs1.getString(1));%>');
                        doc.text(20, y + 20, '  *Producto: <%out.print(rs1.getString(2));%>');
                        doc.text(20, y + 30, '  *Descripción: <%out.print(rs1.getString(3));%>');
                        doc.text(20, y + 40, '  *Precio: <%out.print(rs1.getString(4));%>  *Existencia: <%out.print(rs1.getString(5));%>');
                        y = y + 40;
                    <%
                        }
                        rs2 = sta.executeQuery(contUsuarios);
                    %>
                        doc.addPage();
                        y = 30;
                        doc.setFontSize(18)
                        doc.setTextColor(0, 0, 255)
                        doc.text(20, 20, 'Listado de usuarios.')
                        doc.setFontSize(13);
                        doc.setTextColor(0, 0, 0);
                    <%
                        while (rs2.next()) {
                    %>
                        doc.text(20, y + 10, 'Id usuario: <%out.print(rs2.getString(1));%>');
                        doc.text(20, y + 20, '  *Nombre: <%out.print(rs2.getString(2));%> <%out.print(rs2.getString(3));%> <%out.print(rs2.getString(4));%>');
                        doc.text(20, y + 30, '  *Email: <%out.print(rs2.getString(5));%>');
                        doc.text(20, y + 40, '  *Alias: <%out.print(rs2.getString(6));%>');
                        y = y + 40;

                    <%
                            }
                            sta.close();
                            rs.close();
                            rs1.close();
                            rs2.close();
                            cnx.close();
                        } catch (Exception e) {
                            out.print("Fallo" + e);
                        }
                    %>
                        doc.save("reporteGeneral_Practica2_Luis_Enrique_Chavarría_Vázquez.pdf");
                    }
                </script>
            </section>
        </section>





    </body>
    <script src="Recursos/js/jquery.js"></script>
    <script src="Recursos/js/materialize.min.js"></script>
    <script src="Recursos/js/implementations.js"></script>
    <script src="Recursos/js/jspdf.min.js"></script>

</html>

