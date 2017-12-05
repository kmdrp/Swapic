package db;

import javax.activation.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PoolManager {
    private static PoolManager instance =null;
    public static PoolManager getInstance(){
        if(instance==null){
            instance = new PoolManager();
        }
        return instance;
    }
    public Connection getConnection(){
        javax.sql.DataSource ds = null;
        Connection con = null;

        try {
            Context ctxt1 = new InitialContext();
            Context ctxt2 = (Context) ctxt1.lookup("java:comp/env");
            ds = (javax.sql.DataSource) ctxt2.lookup("jdbc/mariadb");
            con = ds.getConnection();
        } catch (NamingException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }

    public void freeConnection(Connection con){
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public void freeConnection(Connection con, PreparedStatement pstmt){
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public void freeConnection(Connection con, PreparedStatement pstmt, ResultSet rs){
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
