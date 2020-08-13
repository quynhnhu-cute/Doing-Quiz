/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhunnq.TestQuestions;

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
public class TestQuestionsDAO implements Serializable {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    private void closeConnection()
            throws NamingException, SQLException {
        if (rs != null) {
            rs.close();
        }
        if (ps != null) {
            ps.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public boolean insertTestQuestion(TestQuestionsDTO testQues)
            throws NamingException, SQLException {
        String sql = "Insert into TestQuestions(TestId, QuesId, AnsId) values (?,?,?)";
        try {
            conn = DBUtilities.makeConnection();
            if (conn != null) {
                ps = conn.prepareStatement(sql);
                ps.setInt(1, testQues.getTestId());
                ps.setInt(2, testQues.getQuesId());
                ps.setString(3, testQues.getAnsId());
                int row = ps.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            closeConnection();
        }
        return false;
    }
    
    public List<TestQuestionsDTO> getListQues(int testId)
            throws NamingException, SQLException{
        List<TestQuestionsDTO> listDetail = new ArrayList<>();
        String sql = "SELECT Q.CorrectAnswerId, T.AnsId, Q.QContent\n" +
                     "FROM dbo.TestQuestions T, dbo.Questions Q\n" +
                    "WHERE Q.QuestionId = T.QuesId\n" +
                    "AND T.TestId = ?";
        try {
            try {
                conn = DBUtilities.makeConnection();
                if(conn != null){
                    ps = conn.prepareStatement(sql);
                    ps.setInt(1, testId);
                    rs = ps.executeQuery();
                    while(rs.next()){
                        String correctAnsId = rs.getString("CorrectAnswerId");
                        String ansId = rs.getString("AnsId");
                        String quesContent = rs.getString("QContent");
                        TestQuestionsDTO dto = new TestQuestionsDTO(ansId, quesContent, correctAnsId);
                        listDetail.add(dto);
                    }
                }
            } finally {
                closeConnection();
            }
        } finally {
            closeConnection();
        }
        return listDetail;
    }
}
