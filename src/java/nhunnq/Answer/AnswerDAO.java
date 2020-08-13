/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhunnq.Answer;

import java.io.Serializable;
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
public class AnswerDAO implements Serializable{
    
    private Connection conn;
    private ResultSet rs;
    private PreparedStatement ps;
    
    private void closeConnection()
            throws SQLException, NamingException{
        if (rs != null){
            rs.close();
        }
        if(ps != null){
            ps.close();
        }
        if (conn != null){
            conn.close();
        }
    }
    
   private List<AnswersDTO> answerList = new ArrayList<>();

    public List<AnswersDTO> getAnswerList() {
        return answerList;
    }
   
   public void getAnswerByQuesId(int quesId)
           throws SQLException, NamingException{
       String sql = "Select distinct AnsId, AnsContent from Answer where QuesId = ?";
       try {
           conn = DBUtilities.makeConnection();
           if(conn != null){
               ps = conn.prepareStatement(sql);
               ps.setInt(1, quesId);
               rs = ps.executeQuery();
               answerList.clear();
               while(rs.next()){
                   String ansId = rs.getString("AnsId");
                   String ansContent = rs.getString("AnsContent");
                   AnswersDTO answer = new AnswersDTO(ansId, ansContent, quesId);
                   answerList.add(answer);
               }
           }
       } finally {
           closeConnection();
           
       }
   }
   
   public boolean insertAnswer(AnswersDTO answer)
            throws SQLException, NamingException{
       String sql = "INSERT INTO Answer(AnsId,AnsContent,QuesId) VALUES(?,?,?)";
       try {
           conn = DBUtilities.makeConnection();
           if(conn != null){
               ps = conn.prepareStatement(sql);
               ps.setString(1, answer.getAnsId());
               ps.setString(2, answer.getAnsContent());
               ps.setInt(3, answer.getQuesId());
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
   
   public boolean updateAnswer(AnswersDTO answer)
           throws SQLException, NamingException{
       String sql = "UPDATE Answer SET AnsContent = ? where AnsId = ? and QuesId = ?";
       try {
           conn = DBUtilities.makeConnection();
           if(conn != null){
               ps = conn.prepareStatement(sql);
               ps.setString(1, answer.getAnsContent());
               ps.setString(2, answer.getAnsId());
               ps.setInt(3, answer.getQuesId());
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
