/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import modelo.dto.Evento;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author darkdestiny
 */
public class EventoDAO {

    private static final String SQL_INSERT = "insert into Evento(nombreEvento, sede, duracion,fechaInicio,fechaTermino) values(?, ?, ?, ?, ?)";
    private static final String SQL_UPDATE = "update Evento set nombreEvento = ?, sede = ?, duracion =?, fechaInicio =?, fechaTermino = ? where idEvento = ? ";
    private static final String SQL_DELETE = "delete from Evento where idEvento = ?";
    private static final String SQL_SELECT_ALL = "select * from Evento";
    private static final String SQL_SELECT = "select * from Evento where idEvento = ?";

    private Connection conexion = null;

    private void obtenerConexion() {
        String usr = "root";
        String pwd = "root";
        String driver = "com.mysql.cj.jdbc.Driver";
        //String driver = "com.mysql.jdbc.Driver";
        //String url = "jdbc:mysql://localhost:3306/3CM4";
        String url = "jdbc:mysql://localhost:3306/3CM4?"
                + "serverTimezone=America/Mexico_City"
                + "&useUnicode=true"
                + "&useJDBCCompliantTimezoneShift=true"
                + "&useLegacyDatetimeCode=false"
                + "&useSSL=false";
        try {
            Class.forName(driver);
            conexion = DriverManager.getConnection(url, usr, pwd);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(EventoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void create(Evento e) throws SQLException {
        obtenerConexion();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement(SQL_INSERT);
            ps.executeUpdate();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }

    }

    public void update(Evento e) throws SQLException {
        obtenerConexion();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement(SQL_UPDATE);
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }

        }
    }

    public void delete(Evento e) throws SQLException {
        obtenerConexion();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement(SQL_DELETE);
            ps.executeUpdate();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }
    }

    public List readAll() throws SQLException {
        obtenerConexion();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conexion.prepareStatement(SQL_SELECT_ALL);
            rs = ps.executeQuery();
            List resultados = obtenerResultados(rs);
            if (resultados.size() > 0) {
                return resultados;
            } else {
                return null;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }
    }

    public Evento read(Evento e) throws SQLException {
        obtenerConexion();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conexion.prepareStatement(SQL_SELECT);
            rs = ps.executeQuery();
            List resultados = obtenerResultados(rs);
            if (resultados.size() > 0) {
                return (Evento) resultados.get(0);
            } else {
                return null;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }
    }

//    public static void main(String[] args) {
//        Evento e = new Evento();
//        e.setNombreEvento("Jornada ISC");
//        e.setSede("Audtorio y Labs ESCOM");
//        e.setDuracion(3);
//        e.setFechaInicio(Date.valueOf("2020-10-12"));
//        e.setFechaTermino(Date.valueOf("2020-10-15"));
//        //Evento ya esta completamente lleno 
//        System.out.println(e);
//        
//        EventoDAO dao = new EventoDAO();
//        dao.create(e);
//        //dao.update(e);
//        //dao.delete(e);
//        //System.out.println(dao.readAll());
//        //System.out.println(dao.read(e));
//    }
    private List obtenerResultados(ResultSet rs) throws SQLException {
        List resultados = new ArrayList();
        while (rs.next()) {
            Evento e = new Evento();
            resultados.add(e);
        }
        return resultados;
    }
    
    
    public static void main(String[] args) {
        Evento e = new Evento();
        
        EventoDAO dao = new EventoDAO();
        
    }
}


