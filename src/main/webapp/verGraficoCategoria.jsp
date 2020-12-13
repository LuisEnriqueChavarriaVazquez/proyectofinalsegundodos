<%-- 
    Document   : verGrafico
    Created on : 7/12/2020, 05:59:58 AM
    Author     : Luis Enrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gráficos.</title>

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

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                cnx = DriverManager.getConnection("jdbc:mysql://us-cdbr-east-02.cleardb.com/heroku_ccea1cf4896460c?user=b5a529b56bb57f&password=f2643e0f");
                sta = cnx.createStatement();
                String sql = "select * from producto";
                rs = sta.executeQuery(sql);

        %>


        <section class="container">
            <br><br>
            <h3 class="white-text">Existencias.</h3>
            <br>

            <div class="row">
                <div class="col s12 m12">
                    <div class="card blue-grey darken-3">
                        <div class="card-content white-text">
                            <span class="card-title">Explicación.</span>
                            <p>Aqui podemos encontrar gráficos de interes sobre las multiples categorias disponibles.</p>
                        </div>
                    </div>
                </div>
                <div class="col s12 m12">
                    <div class="card blue-grey darken-1">
                        <div class="card-content white-text">
                            <span class="card-title">Existencia de productos.</span>
                            <p>Existencias de productos registrados en el sistema.</p><br>
                            <div id="chartContainer" style="height: 400px; width: 100%;"></div>

                        </div>
                    </div>
                </div>
            </div>

        </section>


        <script>
            window.onload = function () {

                var chart = new CanvasJS.Chart("chartContainer", {
                    theme: "dark2",
                    exportFileName: "Doughnut Chart",
                    exportEnabled: true,
                    animationEnabled: true,
                    title: {
                        text: "Existencia de productos."
                    },
                    legend: {
                        cursor: "pointer",
                        itemclick: explodePie
                    },
                    data: [{
                            type: "doughnut",
                            innerRadius: 90,
                            showInLegend: true,
                            toolTipContent: "<b>{name}</b>: ${y} (#percent%)",
                            indexLabel: "{name} - #percent%",
                            dataPoints: [

            <%while (rs.next()) {%>
                                {y: <%out.print(rs.getString(5));%>, name: "<%out.print(rs.getString(2));%>"},
            <%
                }
            %>
                            ]
                        }]
                });

                chart.render();

                function explodePie(e) {
                    if (typeof (e.dataSeries.dataPoints[e.dataPointIndex].exploded) === "undefined" || !e.dataSeries.dataPoints[e.dataPointIndex].exploded) {
                        e.dataSeries.dataPoints[e.dataPointIndex].exploded = true;
                    } else {
                        e.dataSeries.dataPoints[e.dataPointIndex].exploded = false;
                    }
                    e.chart.render();
                }

            }
        </script>

        <%
                sta.close();
                rs.close();
                cnx.close();

            } catch (Exception e) {
                out.print("Fallo" + e);
            }
        %>
    </body>

    <script src="Recursos/js/canva.js"></script>
    <script src="Recursos/js/jquery.js"></script>
    <script src="Recursos/js/materialize.min.js"></script>
    <script src="Recursos/js/implementations.js"></script>

</html>
