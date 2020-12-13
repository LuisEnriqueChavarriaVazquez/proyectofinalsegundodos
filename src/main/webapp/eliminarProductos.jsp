<%-- 
    Document   : eliminarProductos
    Created on : 6/12/2020, 08:58:55 AM
    Author     : Luis Enrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>


<%
    Connection cnx = null;
    Statement sta = null;
    ResultSet rs = null;

    String cod = request.getParameter("cod");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        cnx = DriverManager.getConnection("jdbc:mysql://us-cdbr-east-02.cleardb.com/heroku_ccea1cf4896460c?user=b5a529b56bb57f&password=f2643e0f");
        sta = cnx.createStatement();
        sta.executeUpdate("delete from producto where idProducto = '" + cod + "'");
        request.getRequestDispatcher("despliegueProductos.jsp").forward(request, response);
        sta.close();
        rs.close();
        cnx.close();

    } catch (Exception e) {
        out.print("Fallo" + e);
    }

    sta.close();
    rs.close();
    cnx.close();
%>