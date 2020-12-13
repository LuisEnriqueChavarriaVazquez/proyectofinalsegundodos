<%-- 
    Document   : addUsuario
    Created on : 3/12/2020, 01:31:39 AM
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

    <body class="blue-grey darken-2" style="margin-bottom: 200px;">
        
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
                    Body: "Nuevo usuario agregado.",
                }).then(
                        message => alert("mail sent successfully")
                );
            }
        </script>

        <nav>
            <div class="nav-wrapper blue-grey darken-4">
                <ul id="nav-mobile" class="right">
                    <li><a href="home.jsp" class="waves-effect waves-light btn"><i class="material-icons left">home</i>Menu de gestión.</a></li>
                    <li><a href="despliegueUsuarios.jsp" class="waves-effect waves-light btn"><i class="material-icons left">list</i>Despliegue de usuarios.</a></li>
                </ul>
            </div>
        </nav>

        <section class="container">
            <br><br>
            <h3 class="white-text">Agregar usuario.</h3>
            <div class="mainBox z-depth-4" style="border-radius: 50px;">
                <div class="titleForm blue-grey darken-4 robotoRegular white-text">Datos de registro (nuevo usuario)</div>
                <div class="formularioUsuario blue-grey darken-3">
                    <div class="row">
                        <form class="col s12">
                            <div class="row">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">account_circle</i>
                                    <input id="icon_prefix_nombre" type="text" class="white-text" name="nombre" required>
                                    <label for="icon_prefix_nombre">Nombre(s)</label>
                                </div>
                                <br><br>
                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">looks_one</i>
                                    <input id="icon_prefix_paterno" type="text" class="white-text" name="paterno" required>
                                    <label for="icon_prefix_paterno">Apellido paterno</label>
                                </div>
                                <br><br>
                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">looks_two</i>
                                    <input id="icon_prefix_materno" type="text" class="white-text" name="materno" required>
                                    <label for="icon_prefix_materno">Apellido materno</label>
                                </div>
                                <br><br>
                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">how_to_reg</i>
                                    <input id="icon_prefix_alias" type="text" class="white-text" name="alias" required>
                                    <label for="icon_prefix_alias">Nombre de usuario (alias)</label>
                                </div>
                                <br><br>
                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">alternate_email</i>
                                    <input id="icon_prefix_email" type="email" class="white-text" name="email" required>
                                    <label for="icon_prefix_email">Email</label>
                                </div>
                                <br><br>
                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">security</i>
                                    <input id="icon_prefix" type="password" class="white-text" name="pass" required>
                                    <label for="icon_prefix">Password</label>
                                </div>
                                <div class="containerEnvioSign">
                                    <button
                                        name="btnAgregarUsuarios"
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
            if (request.getParameter("btnAgregarUsuarios") != null) {
                Connection cnx = null;
                Statement sta = null;
                ResultSet rs = null;

                String nom = request.getParameter("nombre");
                String paterno = request.getParameter("materno");
                String materno = request.getParameter("paterno");
                String alias = request.getParameter("alias");
                String email = request.getParameter("email");
                String pass = request.getParameter("pass");

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    cnx = DriverManager.getConnection("jdbc:mysql://us-cdbr-east-02.cleardb.com/heroku_ccea1cf4896460c?user=b5a529b56bb57f&password=f2643e0f");
                    sta = cnx.createStatement();
                    rs = sta.executeQuery("select max(idUsuario)+1 from usuario");

                    String idUsuario = "";
                    while (rs.next()) {
                        idUsuario = rs.getString(1);
                    }

                    sta.executeUpdate("insert into usuario values('" + idUsuario + "','" + nom + "', '" + paterno + "', '" + materno + "', '" + email + "', '" + alias + "', '" + pass + "')");
                    request.getRequestDispatcher("procesoListo.jsp").forward(request, response);
                    sta.close();
                    rs.close();
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
