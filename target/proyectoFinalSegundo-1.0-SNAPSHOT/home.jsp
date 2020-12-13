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
                    <li><a href="generarPdf.jsp" class="waves-effect waves-light btn"><i class="material-icons left">library_books</i>Reporte PDF</a></li>
                    <li><a href="verGraficoCategoria.jsp" class="waves-effect waves-light btn"><i class="material-icons left">data_usage</i>Gráfico de existencias.</a></li>
                    <li><a href="verGraficoProducto.jsp" class="waves-effect waves-light btn"><i class="material-icons left">insert_chart</i>Gráfico de precios.</a></li>
                    <li><a href="#modal1" class="btn modal-trigger red darken-4" data-target="modal1" class="waves-effect red darken-4 waves-light btn"><i class="material-icons left">directions_run</i>Log out.</a></li>
                </ul>
            </div>
        </nav>

        <section class="container">
            <br><br>
            <div>
                <h3 class="white-text">Menu de gestión.</h3>
                <div class="chip">Miembros autorizados.</div>
            </div>
            <br><br><br>
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
                <div class="card-content blue-grey darken-2 radius-generator alturaMenuGestion">

                    <div id="test4" class="justificador">
                        <a  href="addCategoria.jsp"
                            class="waves-effect buttonsMine waves-light btn-lateral-left btn-flat btn-large waves-effect waves-teal white blue-grey-text text-darken-4"><i
                                class="material-icons left">add</i><b>Agregar categoria.</b></a>
                        <a  href="despliegueCategorias.jsp"
                            class="waves-effect buttonsMine waves-light btn-flat btn-large waves-effect waves-teal white blue-grey-text text-darken-4"><i
                                class="material-icons left">edit</i><b>Editar categorias.</b></a>
                        <a  href="despliegueCategorias.jsp"
                            class="waves-effect buttonsMine waves-light btn-flat btn-large btn-lateral-right  waves-effect waves-teal white blue-grey-text text-darken-4"><i
                                class="material-icons left">delete</i><b>Eliminar categorias.</b></a>


                    </div>
                    <div id="test5" class="justificador">

                        <a  href="addProducto.jsp"
                            class="waves-effect buttonsMine waves-light btn-lateral-left btn-large btn-large waves-effect waves-teal white blue-grey-text text-darken-4"><i
                                class="material-icons left">add</i><b>Agregar productos</b></a>
                        <a  href="despliegueProductos.jsp"
                            class="waves-effect buttonsMine waves-light btn-large btn-large waves-effect waves-teal white blue-grey-text text-darken-4"><i
                                class="material-icons left">edit</i><b>Editar productos</b></a>
                        <a  href="despliegueProductos.jsp"
                            class="waves-effect buttonsMine waves-light btn-large btn-large btn-lateral-right waves-effect waves-teal white blue-grey-text text-darken-4"><i
                                class="material-icons left">delete</i><b>Eliminar productos</b></a>

                    </div>
                    <div id="test6" class="justificador">

                        <a  href="addUsuario.jsp"
                            class="waves-effect buttonsMine waves-light btn-lateral-left btn-large waves-effect waves-teal white blue-grey-text text-darken-4"><i
                                class="material-icons left">add</i><b>Agregar usuarios</b></a>
                        <a  href="despliegueUsuarios.jsp"
                            class="waves-effect buttonsMine waves-light btn-large waves-effect waves-teal white blue-grey-text text-darken-4"><i
                                class="material-icons left">edit</i><b>Editar usuarios</b></a>
                        <a  href="despliegueUsuarios.jsp"
                            class="waves-effect buttonsMine waves-light btn-large btn-lateral-right waves-effect waves-teal white blue-grey-text text-darken-4"><i
                                class="material-icons left">delete</i><b>Eliminar usuarios</b></a>

                    </div>
                </div>
            </div>

            <br><br>
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
                        String contCategorias = "SELECT COUNT(*) FROM categoria";
                        String contProductos = "SELECT COUNT(*) FROM producto";
                        String contUsuarios = "SELECT COUNT(*) FROM usuario";
                        rs = sta.executeQuery(contCategorias);

                        String categoria = "";
                        String producto = "";
                        String usuario = "";
                        while (rs.next()) {
                            categoria = rs.getString(1);
                %>

                <div class="col s4">
                    Número de categorias registradas: &nbsp;&nbsp;&nbsp;&nbsp;
                    <div class="chip">
                        <span class="robotoGrueso" style="font-size: 20px;"><%out.print(categoria);%></span>
                    </div>
                </div>

                <%
                    }

                    rs1 = sta.executeQuery(contProductos);
                    while (rs1.next()) {
                        producto = rs1.getString(1);
                %>

                <div class="col s4">
                    Número de productos registrados: &nbsp;&nbsp;&nbsp;&nbsp;
                    <div class="chip">
                        <span class="robotoGrueso" style="font-size: 20px;"><%out.print(producto);%></span>
                    </div>
                </div>

                <%
                    }
                    rs2 = sta.executeQuery(contUsuarios);
                    while (rs2.next()) {
                        usuario = rs2.getString(1);
                %>

                <div class="col s4">
                    Número de usuarios registrados: &nbsp;&nbsp;&nbsp;&nbsp;
                    <div class="chip">
                        <span class="robotoGrueso" style="font-size: 20px;"><%out.print(usuario);%></span>
                    </div>
                </div>

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
            </section>
        </section>

        <!-- Modal Structure -->
        <div id="modal1" class="modal">
            <div class="modal-content">
                <h4>Confirmación de cierre de sesión.</h4>
                <p>¿En verdad desea cerrar su sesión?</p>
            </div>
            <div class="modal-footer">
                <a href="logIn.jsp" class="modal-close waves-effect waves-red btn-flat">Cierre de la sesión.</a>
            </div>
        </div>



    </body>
    <script src="Recursos/js/jquery.js"></script>
    <script src="Recursos/js/materialize.min.js"></script>
    <script src="Recursos/js/implementations.js"></script>

</html>

