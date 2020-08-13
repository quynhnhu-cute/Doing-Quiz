/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhunnq.Tests;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import nhunnq.DBUtilities.DBUtilities;

/**
 *
 * @author USER
 */
public class TestsDAO implements Serializable{
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    private void closeConnection()
            throws SQLException, NamingException{
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
    
    public boolean insertTest(TestsDTO test)
            throws NamingException, SQLException{
        String sql = "Insert into Tests(CreateDate, Marks, SubjectName, Email) values(?,?,?,?)";
        try {
            conn = DBUtilities.makeConnection();
            if(conn != null){
                ps = conn.prepareStatement(sql);
                
                ps.setTimestamp(1, test.getCreateDate());
                ps.setDouble(2, test.getMark());
                ps.setString(3, test.getSubName());
                ps.setString(4, test.getEmail());
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
    
    public int getTestId(Timestamp createDate)
            throws SQLException, NamingException{
        int testId = -1;
        String sql = "Select TestId from Tests where Createdate = ?";
        try {
            conn = DBUtilities.makeConnection();
            ps = conn.prepareStatement(sql);
            ps.setTimestamp(1, createDate);
            rs = ps.executeQuery();
            if(rs.next()){
              testId = rs.getInt("TestId");
            }
        } finally {
            closeConnection();
        }
        return testId;
    }
    
    public List<TestsDTO> viewAllHistory(String username, int pageNum)
                throws NamingException, SQLException{
        List<TestsDTO> testList = new ArrayList<>();
        String sql = "Select TestId, CreateDate, Marks, SubjectName from Tests "
                    + "where Email = ?\n" +
                    "ORDER BY TestId\n" +
                    "OFFSET 5 * (?-1) ROWS\n" +
                    "FETCH NEXT 5 ROWS ONLY";
        try {
            conn = DBUtilities.makeConnection();
            if(conn != null){
                ps = conn.prepareStatement(sql);
                ps.setString(1, username);
                ps.setInt(2, pageNum);
                rs = ps.executeQuery();
                while(rs.next()){
                    int testId = rs.getInt("TestId");
                    Timestamp createDate = Timestamp.valueOf(LocalDateTime.now());
                    double mark = rs.getDouble("Marks");
                    String subName = rs.getString("SubjectName");
                    TestsDTO test = new TestsDTO(testId, createDate, mark, subName, username);
                    testList.add(test);
                    
                }
            }
        } finally {
            closeConnection();
        }
        return testList;
   }
    
    public List<TestsDTO> searchBySubject(String subject, String email, String subId, int pageNum)
            throws NamingException, SQLException{
        List<TestsDTO> searchList = new ArrayList<>();
        String sql = "Select TestId, CreateDate, Marks, SubjectName\n" +
                    "from Tests T, dbo.Subjects S\n" +
                    "WHERE Email = ? \n" +
                    "AND T.SubjectName = S.SubName\n" +
                    "AND S.SubName LIKE ?\n" +
                    "AND S.SubId like ?\n" +
                    "ORDER BY TestId\n" +
                    "OFFSET 5 * (?-1) ROWS\n" +
                    "FETCH NEXT 5 ROWS ONLY";
        try {
            conn = DBUtilities.makeConnection();
            if(conn != null){
                ps = conn.prepareStatement(sql);
                ps.setString(1, email);
                ps.setString(2, "%" + subject + "%");
                ps.setString(3, "%" + subId + "%");
                ps.setInt(4, pageNum);
                rs = ps.executeQuery();
                while(rs.next()){
                    int testId = rs.getInt("TestId");
                    Timestamp createDate = Timestamp.valueOf(LocalDateTime.now());
                    double mark = rs.getDouble("Marks");  
                    String subName = rs.getString("SubjectName");
                    TestsDTO test = new TestsDTO(testId, createDate, mark, subName, email);
                    searchList.add(test);
                }
            }
        } finally {
            closeConnection();
           
        }
        return searchList;
    }
    
    public int getNumberOfSearchList(String subject, String email, String subId)
            throws NamingException, SQLException{
        int number = 0;
        String sql = "Select Count(TestId) as NoOfQues  \n" +
                    "from Tests T, dbo.Subjects S\n" +
                    "WHERE Email = ?\n" +
                    "AND T.SubjectName = S.SubName\n" +
                    "AND S.SubName LIKE ?\n" +
                    "AND S.SubId like ?";
        try {
            conn = DBUtilities.makeConnection();
            if(conn != null){
                ps = conn.prepareStatement(sql);
                ps.setString(1, email);
                ps.setString(2, "%" + subject + "%");
                ps.setString(3, "%" + subId + "%");
                rs = ps.executeQuery();
                if(rs.next()){
                    number = rs.getInt("NoOfQues");
                }
            }
        } finally {
            closeConnection();
        }
        return number;
    }
    
    public int getNumberAllList(String email)
            throws NamingException, SQLException{
        int number = 0;
        String sql = "Select COUNT(TestId) AS NoOfQues from Tests where Email = ?";
        try {
            conn = DBUtilities.makeConnection();
            if(conn != null){
                ps = conn.prepareStatement(sql);
                ps.setString(1, email);
                rs = ps.executeQuery();
                if(rs.next()){
                    number = rs.getInt("NoOfQues");
                }
            }
        } finally {
            closeConnection();
        }
        return number;
    }
}
