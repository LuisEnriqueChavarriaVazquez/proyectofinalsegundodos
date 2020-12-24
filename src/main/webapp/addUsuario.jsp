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

    <body class="purple darken-2" style="margin-bottom: 200px;">

        <nav>
            <div class="nav-wrapper purple darken-4">
                <ul id="nav-mobile" class="right">

                </ul>
            </div>
        </nav>

        <section class="container">
            <br><br>
            <h3 class="white-text">Agregar usuario.</h3>
            <div class="mainBox z-depth-4" style="border-radius: 50px;">
                <div class="titleForm purple darken-4 robotoRegular white-text">Datos de registro (nuevo usuario)</div>
                <div class="formularioUsuario purple darken-3">
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
                                    <i class="material-icons prefix white-text">alternate_email</i>
                                    <input id="icon_prefix_email" type="email" class="white-text" name="email" required>
                                    <label for="icon_prefix_email">Email</label>
                                </div>
                                <br><br>
                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">perm_identity</i>
                                    <input id="icon_prefix_alias" type="text" class="white-text" name="nombreUsuario" required>
                                    <label for="icon_prefix_alias">Nombre de usuario</label>
                                </div
                                <br><br>
                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">photo</i>
                                    <input id="icon_prefix_foto" type="text" class="white-text" name="fotoUsuario" required>
                                    <label for="icon_prefix_foto">URL de la foto (online) o ruta del archivo (referencia a la carpeta Recursos/img/nombre.jpg, no uses "\")</label>
                                </div
                                <br><br>
                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">how_to_reg</i>
                                    <input id="icon_prefix_clave" type="password" class="white-text" name="claveUsuario" required>
                                    <label for="icon_prefix_clave">Clave usuario</label>
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
                String email = request.getParameter("email");
                String fotoUsuario = request.getParameter("fotoUsuario");
                String nombreUsuario = request.getParameter("nombreUsuario");
                String claveUsuario = request.getParameter("claveUsuario");

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    cnx = DriverManager.getConnection("jdbc:mysql://localhost/nuevaFotoBase?user=root&password=root");
                    sta = cnx.createStatement();
                    rs = sta.executeQuery("select max(idUsuario)+1 from usuario");

                    String idUsuario = "";
                    while (rs.next()) {
                        idUsuario = rs.getString(1);
                    }

                    sta.executeUpdate("insert into usuario values('" + idUsuario + "','" + nom + "', '" + paterno + "', '" + materno + "', '" + email + "', '" + fotoUsuario + "', '" + nombreUsuario + "', '" + claveUsuario + "')");

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
