package apparkt;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Mixi
 */
public class ConsultesSQL {
//    Connection con = null;
//    
//    public void iniciar() throws SQLException {
//        try {
//            Class.forName("org.postgresql.Driver");
//
//            String url = "jdbc:postgresql://localhost:5432/parquings";
//            con = DriverManager.getConnection(url, "ioc", "ioc");
//        } catch (SQLException ex) {
//            throw new SQLException(ex);
//        } catch (ClassNotFoundException ex) {
//            throw new SQLException(ex);
//        }
//    }
//
//    public void finalitzar() throws SQLException {
//        try {
//            if (con != null && !con.isClosed()) {
//                con.close();
//            }
//        } catch (SQLException ex) {
//            throw new SQLException(ex);
//        }
//    }
//    
//    /**
//     * Consulta l'existència d'un usuari amb el nom d'usuari passat per paràmetre.
//     * @param nomUsuari nom d'usuari a verificar
//     * @throws java.sql.SQLException si l'usuari no existeix
//     * @return true en cas de que l'usuari si existeixi.
//     */
//    public boolean verificaUsuari(String nomUsuari) throws SQLException {
//        boolean ret = false;
//        String sentenciaSql;
//        PreparedStatement stm = null;
//        ResultSet rs = null;
//
//        sentenciaSql = "SELECT * FROM usuari WHERE nomusuari=?";
//        try {
//            stm = con.prepareStatement(sentenciaSql);
//
//            stm.setString(1, nomUsuari);
//
//            rs = stm.executeQuery();
//            if (rs.next()) {
//                ret = true;
//            }
//
//        } catch (SQLException ex) {
//            /*Excepció quan no existeix */
//            throw new SQLException(ex);
//        } finally {
//            tancarResultSet(rs);
//            tancarStatement(stm);
//        }
//        return ret;
//    }
//    
//    /**
//     * Consulta la correcció del password de l'usuari passats per paràmetre.
//     * @param nomUsuari nom d'usuari a verificar
//     * @param password password de l'usuari a verificar
//     * @throws java.sql.SQLException si l'usuari no existeix
//     * @return true en cas de que el password sigui correcte.
//     */
//    public boolean verificaPassword (String nomUsuari, String password) throws SQLException {
//        boolean ret = false;
//        String sentenciaSql;
//        PreparedStatement stm = null;
//        ResultSet rs = null;
//
//        sentenciaSql = "SELECT * FROM usuari WHERE nomusuari=? AND WHERE password=?";
//        try {
//            stm = con.prepareStatement(sentenciaSql);
//
//            stm.setString(1, nomUsuari);
//            stm.setString(2, password);
//
//            rs = stm.executeQuery();
//            if (rs.next()) {
//                ret = true;
//            }
//
//        } catch (SQLException ex) {
//            /*Excepció quan el password no sigui correcte */
//            throw new SQLException(ex);
//        } finally {
//            tancarResultSet(rs);
//            tancarStatement(stm);
//        }
//        return ret;
//    }
//    
//    /**
//     * Insereix la persona registrada a la base de dades
//     * @param pers usuari a introduïr a la base de dades.
//     * @throws java.sql.SQLException si l'usuari no existeix
//     */
//    public void inserirPersona (Persona_ol pers, int tipusPers) throws SQLException {
//        String sentenciaSql;
//        PreparedStatement stm = null;
//
//        sentenciaSql = "INSERT INTO usuari VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//        try {
//            stm = con.prepareStatement(sentenciaSql);
//
//            stm.setString(1, pers.getDni());        //DNI
//            stm.setString(2, pers.getNom());        //Nom
//            stm.setString(3, pers.getCognom1());    //Cognom1
//            stm.setString(4, pers.getCognom2());    //Cognom2
//            stm.setString(5, pers.getDireccio());   //Direcció
//            stm.setInt(6, pers.getPoblacio().getIdPoblacio());      //Població
//            stm.setString(7, pers.getCodiPostal());    //Codi Postal
//            stm.setInt(8, pers.getTelefon());       //Telèfon
//            stm.setString(9, pers.geteMail());      //E-mail
//            stm.setString(10, pers.getNomUsuari());  //Nom Usuari
//            stm.setString(11, pers.getPassword());  //Password
//            switch (tipusPers) {
//                case 2:
//                    stm.setInt(12, 2);                      //TipusUsuari
//                    break;
//                case 3:
//                    stm.setInt(12, 3);                      //TipusUsuari
//                    stm.setString(13, pers.getDadesFacturacio());   //Dades Facturació
//                    stm.setString(14, pers.getMatricula()); //Matrícula
//                    break;
//            }
//            
//            stm.executeUpdate();
//        } catch (SQLException ex) {
//            throw new SQLException(ex);
//        } finally {
//            tancarStatement(stm);
//        }
//    }
//    
//    /**
//     * Retorna una llista amb els pàrquings dins la zona sel·leccionada.
//     * @param zona
//     * @return List<Aparcament> llista de pàrquings.
//     * @throws java.sql.SQLException si l'usuari no existeix
//     */
//    public List<Aparcament> parquingsPerZona(int zona) throws SQLException {
//        List<Aparcament> ret = new ArrayList<Aparcament>();
//        String sentenciaSql;
//        PreparedStatement stm = null;
//        ResultSet rs = null;
//
//        sentenciaSql = "SELECT nom, direccio, poblacio, codipostal FROM parquing WHERE zona=?";
//        try {
//            stm = con.prepareStatement(sentenciaSql);
//
//            stm.setInt(1, zona);
//
//            rs = stm.executeQuery();
//            while (rs.next()) {
//                ret.add(new Aparcament(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
//            }
//
//        } catch (SQLException ex) {
//            throw new SQLException(ex);
//        } finally {
//            tancarResultSet(rs);
//            tancarStatement(stm);
//        }
//        return ret;
//    }
//    
//    /**
//     * Insereix una reserva a la base de dades
//     * @param res reserva a introduïr a la base de dades.
//     * @throws java.sql.SQLException si l'usuari no existeix
//     */
//    public void inserirReserva (Reserva res) throws SQLException {
//        String sentenciaSql;
//        PreparedStatement stm = null;
//
//        sentenciaSql = "INSERT INTO reserva (idplaca, dni, matricula, hora_inici, hora_fi)"
//                + " values(?,?,?,?,?)";
//        try {
//            stm = con.prepareStatement(sentenciaSql);
//
//            stm.setInt(1, res.getIdPlaca());            //IdPlaça
//            stm.setString(2, res.getDNI());             //DNI Client
//            stm.setString(3, res.getMatricula());       //DNI Client
//            stm.setTimestamp(4, res.getHoraInici());    //Hora inici reserva
//            stm.setTimestamp(5, res.getHoraFi());       //Hora fi reserva
//            
//            stm.executeUpdate();
//        } catch (SQLException ex) {
//            throw new SQLException(ex);
//        } finally {
//            tancarStatement(stm);
//        }
//    }
//    
//    /**
//     * Anul·la la reserva amb un idReserva donat.
//     * @param idReserva id de la reserva a anul·lar a la base de dades.
//     * @throws java.sql.SQLException si l'usuari no existeix
//     */
//    public void anularReserva (int idReserva) throws SQLException {
//        String sentenciaSql;
//        PreparedStatement stm = null;
//
//        sentenciaSql = "UPDATE reserva SET anulada='1' WHERE idreserva=?";
//        try {
//            stm = con.prepareStatement(sentenciaSql);
//            
//            stm.setInt(1, idReserva);            //IdReserva
//            stm.executeUpdate();
//        } catch (SQLException ex) {
//            throw new SQLException(ex);
//        } finally {
//            tancarStatement(stm);
//        }
//    }
//    
//    
//    public void tancarStatement(Statement statement) {
//        try {
//            if (statement != null && !statement.isClosed()) {
//                statement.close();
//            }
//        } catch (SQLException ex) {
//            System.err.println("Error intentant tancar una sentència");
//        }
//    }
//
//    public void tancarResultSet(ResultSet resultSet) {
//        try {
//            if (resultSet != null && !resultSet.isClosed()) {
//                resultSet.close();
//            }
//        } catch (SQLException ex) {
//            System.err.println("Error intentant tancar els resultats");
//        }
//    }
}