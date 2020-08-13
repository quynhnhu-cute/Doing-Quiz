/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhunnq.Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import nhunnq.DBUtilities.DBUtilities;

/**
 *
 * @author USER
 */
public class UsersDAO {
    
    private Connection conn;
    private ResultSet rs;
    private PreparedStatement ps;

    public UsersDAO() {
    }

    private void closeConnection()
            throws SQLException, NamingException{
        if(rs != null){
            rs.close();
        }
        if(ps != null){
            ps.close();
        }
        
        if (conn != null){
            conn.close();
        }
        
        
    }
    public UsersDAO(Connection conn, ResultSet rs, PreparedStatement ps) {
        this.conn = conn;
        this.rs = rs;
        this.ps = ps;
    }
    
    public String checkLogin(String username, String password)
            throws SQLException, NamingException {
        String role = null;
        String sql = "SELECT RoleName  FROM dbo.Roles R, dbo.Users U "
                + "WHERE r.RoleId = u.RoleId "
                + "AND U.Email = ? "
                + "AND U.Password = ? "
                + "AND U.StatusId = 1";
        try {
            conn = DBUtilities.makeConnection();
            if (conn != null) {
               
                ps = conn.prepareStatement(sql);
                ps.setString(1, username);
                ps.setString(2, password);
                rs = ps.executeQuery();
                if (rs.next()) {
                    role = rs.getString("RoleName");
                }
            }

        } finally {
            closeConnection();
        }
        return role;
    }
    
    public String getFullName(String username)
            throws SQLException, NamingException {
        String name = null;
        String sql = "SELECT Fullname from Users where Email = ?";
        try {
            conn = DBUtilities.makeConnection();
            if (conn != null) {
                ps = conn.prepareStatement(sql);
                ps.setString(1, username);
                rs = ps.executeQuery();
                if (rs.next()) {
                    name = rs.getString("Fullname");
                }
            }

        } finally {
            closeConnection();
        }
        return name;
    }
    
    public boolean insertAccount(UsersDTO user)
            throws NamingException, SQLException{
        String sql = "INSERT INTO Users(Email, Fullname, Password, RoleId, StatusId) VALUES (?,?,?,?,?)";
        try {
            conn = DBUtilities.makeConnection();
            if(conn != null){
                ps = conn.prepareStatement(sql);
                ps.setString(1, user.getEmail());
                ps.setString(2, user.getFullName());
                ps.setString(3, user.getPassword());
                ps.setBoolean(4, user.isRoleId());
                ps.setInt(5, user.getStatusId());
                int rowAffect = ps.executeUpdate();
                if(rowAffect > 0){
                    return true;
                }
            }
        } finally {
            closeConnection();
        }
        return false;
    }
}
