<%-- 
    Document   : signUp
    Created on : 3/12/2020, 01:27:31 AM
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
                </ul>
            </div>
        </nav>

        <section class="container">
            <br><br>
            <h3 class="white-text">Log in.</h3>
            <div class="mainBox z-depth-4" style="border-radius: 50px;">
                <div class="titleForm blue-grey darken-4 robotoRegular white-text">Datos de ingreso al sistema</div>
                <div class="formularioUsuario blue-grey darken-3">
                    <div class="row">
                        <form class="col s12" method="POST">
                            <div class="row">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">alternate_email</i>
                                    <input id="icon_prefix_email" type="email" class="white-text" name="emailUsuario" required>
                                    <label for="icon_prefix_email">Email</label>
                                </div>
                                <br><br>
                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">security</i>
                                    <input id="icon_prefix" type="password" class="white-text" name="passUsuario" required>
                                    <label for="icon_prefix">Password</label>
                                </div>
                                <div class="containerEnvioSign">
                                    <button
                                        name="logUsuarios"
                                        class="z-depth-4 btn-large waves-effect waves-teal white btnEnvio text-darken-4 blue-grey-text robotoGrueso"
                                        type="submit" value="Grabar">
                                        Ingresar.
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <%
                if (request.getParameter("logUsuarios") != null) {
                    try {
                        String email = request.getParameter("emailUsuario");
                        String pass = request.getParameter("passUsuario");
                        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                        Connection conn = DriverManager.getConnection("jdbc:mysql://us-cdbr-east-02.cleardb.com/heroku_ccea1cf4896460c?user=b5a529b56bb57f&password=f2643e0f");
                        PreparedStatement pst = conn.prepareStatement("Select email,claveUsuario from usuario where email=? and claveUsuario=?");
                        pst.setString(1, email);
                        pst.setString(2, pass);
                        ResultSet rs = pst.executeQuery();
                        if (rs.next()) {
                            out.println("Valid login credentials");
                            request.getRequestDispatcher("home.jsp").forward(request, response);
                        } else {
            %>

            <br><br>
            <div class="row">
                <div class="col s12 m12">
                    <div class="card red darken-3">
                        <div class="card-content white-text">
                            <span class="card-title">Error!!</span>
                            <p><%out.println("El email o el password están incorrectos.");%></p>
                        </div>
                    </div>
                </div>
            </div>


            <%
                        }
                    } catch (Exception e) {
                        out.println("Something went wrong !! Please try again");
                    }
                }
            %>
            <div class="more">
                <a href="index.jsp" class="robotoDelgado white-text" style="font-size: 20px; border-bottom: .5px solid #fff;">Registrarse</a>
            </div>
        </section>



    </body>
    <script src="Recursos/js/jquery.js"></script>
    <script src="Recursos/js/materialize.min.js"></script>
    <script src="Recursos/js/implementations.js"></script>

</html>
