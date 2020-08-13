/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhunnq.Subject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import nhunnq.DBUtilities.DBUtilities;

/**
 *
 * @author USER
 */
public class SubjectDAO {
    
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public SubjectDAO() {
    }

    private void closeConnection() throws SQLException, NamingException{
        if(rs != null){
            rs.close();
        }
        if(ps != null){
            ps.close();
        }
        if(conn != null){
            conn.close();
        }
    }

    public int getSubIdByName(String subName)
            throws SQLException, NamingException{
        int subId = 0;
        String sql = "Select SubId from Subjects where SubName = ?";
        try {
            conn = DBUtilities.makeConnection();
            if(conn != null){
                ps = conn.prepareStatement(sql);
                ps.setString(1, subName);
                rs = ps.executeQuery();
                if(rs.next()){
                    subId = rs.getInt("SubId");
                }
            }
        } finally {
            closeConnection();
        }
         return subId;
    }
    
//    public boolean insertSubject(SubjectDTO subject)
//            throws NamingException, SQLException{
//        String sql = "Insert into Subjects(SubName,NumOfQuestions,Time) values(?,?,?,?)";
//        try {
//            conn = DBUtilities.makeConnection();
//            if(conn != null){
//                ps = conn.prepareStatement(sql);
//              
//                ps.setString(1, subject.getSubjectName());
//                ps.setInt(2, subject.getNumOfQuestion());
//                ps.setInt(3, subject.getTime());
//                int rowAffect = ps.executeUpdate();
//                if(rowAffect > 0){
//                    return true;
//                }
//            }
//        }finally {
//            closeConnection();
//        }
//        return false;
//    }

    public List<String> getSubjectList()
            throws NamingException, SQLException{
        List<String> subList = new ArrayList<String>();
        String sql = "Select SubName from Subjects";
        try {
            conn = DBUtilities.makeConnection();
            if(conn != null){
                ps = conn.prepareStatement(sql);
                rs= ps.executeQuery();
                while(rs.next()){
                    String subName = rs.getString("SubName");
                    subList.add(subName);
                }
            }
        } finally {
            closeConnection();
        }
        return subList;
    }
    
    public int getTimeForDoingQuiz(String subName)
            throws SQLException, NamingException{
        int time = 0;
        String sql = "SELECT Time FROM dbo.Subjects WHERE SubName = ?";
        try {
            conn = DBUtilities.makeConnection();
            if(conn != null){
                ps = conn.prepareStatement(sql);
                ps.setString(1, subName);
                rs = ps.executeQuery();
                if(rs.next()){
                    time = rs.getInt("Time");
                }
            }
        } finally {
            closeConnection();
        }
        return time;
    }
            
   
}
        
    
   

