/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhunnq.Questions;

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
public class QuestionsDAO implements Serializable {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    private List<QuestionsDTO> searchList = new ArrayList<QuestionsDTO>();

    private void closeConnection() throws SQLException, NamingException {
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

    public List<QuestionsDTO> getSearchList() {
        return searchList;
    }

    public int countQuestionForPaging(String quesName, String status, String subName)
            throws NamingException, SQLException {
        int row = -1;
        String sql = "SELECT DISTINCT COUNT(Q.QContent) AS NoOfQuestion \n"
                + "FROM dbo.Questions Q, dbo.Status S, Subjects Su \n"
                + "WHERE s.StatusId = Q.StatusId \n"
                + "AND Su.SubId = Q.SubId \n"
                + "AND S.StatusName LIKE ?\n"
                + "AND Q.QContent LIKE ?\n"
                + "AND Su.SubName LIKE ?";
        try {
            conn = DBUtilities.makeConnection();
            if (conn != null) {
                ps = conn.prepareStatement(sql);
                ps.setString(1, "%" + status + "%");
                ps.setString(2, "%" + quesName + "%");
                ps.setString(3, "%" + subName + "%");
                rs = ps.executeQuery();
                if (rs.next()) {
                    row = rs.getInt("NoOfQuestion");
                }

            }
        } finally {
            closeConnection();
        }
        return row;
    }

    public void showSearchQuestion(String quesName, String status, String subName, int pageNumber)
            throws SQLException, NamingException {
        String sql = "SELECT Distinct Q.QuestionId, Q.QContent, Q.CorrectAnswerId, S.StatusName, Su.SubName\n"
                + "FROM dbo.Questions Q, dbo.Status S, dbo.Answer A, Subjects Su \n"
                + "WHERE A.QuesId = Q.QuestionId \n"
                + "AND s.StatusId = Q.StatusId \n"
                + "AND Su.SubId = Q.SubId \n"
                + "AND S.StatusName LIKE  ?\n"
                + "AND Q.QContent LIKE  ?\n"
                + "AND Su.SubName LIKE  ?\n"
                + "ORDER BY Q.QContent "
                + "OFFSET 20 * (?-1) ROWS\n"
                + "FETCH NEXT 20 ROWS ONLY";

        try {
            conn = DBUtilities.makeConnection();
            if (conn != null) {
                ps = conn.prepareStatement(sql);
                ps.setString(1, "%" + status + "%");
                ps.setString(2, "%" + quesName + "%");
                ps.setString(3, "%" + subName + "%");
                ps.setInt(4, pageNumber);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int quesId = rs.getInt("QuestionId");
                    String quesContent = rs.getString("QContent");
                    String correctAnsId = rs.getString("CorrectAnswerId");
                    String subject = rs.getString("SubName");
                    String statuss = rs.getString("StatusName");
                    QuestionsDTO question = new QuestionsDTO(quesId, quesContent, correctAnsId, subject, statuss);
                    searchList.add(question);

                }
            }
        } finally {
            closeConnection();
        }
    }

    public boolean insertQuestion(QuestionsDTO ques)
            throws SQLException, NamingException {
        String sql = "INSERT INTO Questions(QContent,CorrectAnswerId,DateOfCreate,SubId,StatusId) VALUES (?,?,?,?,?)";
        try {
            conn = DBUtilities.makeConnection();
            if (conn != null) {
                ps = conn.prepareStatement(sql);
                ps.setString(1, ques.getQuesContent());
                ps.setString(2, ques.getCorrectAnsId());
                ps.setTimestamp(3, ques.getDateOfCreate());
                ps.setInt(4, ques.getSubId());
                ps.setInt(5, ques.getStatusId());
                int rowAffect = ps.executeUpdate();
                if (rowAffect > 0) {
                    return true;
                }
            }
        } finally {
            closeConnection();
        }
        return false;
    }

    public int getQuesIdByName(String quesName)
            throws NamingException, SQLException {
        int quesId = 0;
        String sql = "Select QuestionId from Questions where QContent = ? and StatusId = 1";
        try {
            conn = DBUtilities.makeConnection();
            if (conn != null) {
                ps = conn.prepareStatement(sql);
                ps.setString(1, quesName);
                rs = ps.executeQuery();
                if (rs.next()) {
                    quesId = rs.getInt("QuestionId");
                }
            }
        } finally {
            closeConnection();
        }
        return quesId;
    }

    public QuestionsDTO getQuesForUpdating(int quesId)
            throws NamingException, SQLException {
        QuestionsDTO question = null;
        String sql = "SELECT DISTINCT Q.QContent, Q.CorrectAnswerId, Su.SubName, S.StatusName\n"
                + "FROM dbo.Questions Q, dbo.Answer A, dbo.Status S, dbo.Subjects Su\n"
                + "WHERE Q.StatusId = S.StatusId \n"
                + "AND Su.SubId = Q.SubId\n"
                + "AND Q.QuestionId = ?";
        try {
            conn = DBUtilities.makeConnection();

            if (conn != null) {
                ps = conn.prepareStatement(sql);
                ps.setInt(1, quesId);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String quesContent = rs.getString("QContent");
                    String correctAnsId = rs.getString("CorrectAnswerId");
                    String subName = rs.getString("SubName");
                    String statusName = rs.getString("StatusName");
                    question = new QuestionsDTO(quesContent, correctAnsId, subName, statusName);
                }
            }
        } finally {
            closeConnection();
        }
        return question;
    }

    public boolean updateQuestion(QuestionsDTO question)
            throws SQLException, NamingException {
        String sql = "UPDATE dbo.Questions SET QContent = ? , SubId = ?, StatusId = ?, CorrectAnswerId = ? where QuestionId = ?";
        try {
            conn = DBUtilities.makeConnection();
            if (conn != null) {
                ps = conn.prepareStatement(sql);
                ps.setString(1, question.getQuesContent());
                ps.setInt(2, question.getSubId());
                ps.setInt(3, question.getStatusId());
                ps.setString(4, question.getCorrectAnsId());
                ps.setInt(5, question.getQuesId());
                int rowAffect = ps.executeUpdate();
                if (rowAffect > 0) {
                    return true;
                }
            }
        } finally {
            closeConnection();
        }
        return false;
    }

    public boolean deleteQuesByStatus(int quesId)
            throws NamingException, SQLException {
        String sql = "Update Questions SET StatusId = 2 where QuestionId = ?";
        try {
            conn = DBUtilities.makeConnection();
            if (conn != null) {
                ps = conn.prepareStatement(sql);
                ps.setInt(1, quesId);
                int rowAffect = ps.executeUpdate();
                if (rowAffect > 0) {
                    return true;
                }
            }
        } finally {
            closeConnection();
        }
        return false;
    }

//    public QuestionsDTO getQuesForDoingQuiz(int number, String subName, int page)
//            throws NamingException, SQLException {
//        QuestionsDTO question = null;
//        String sql = "Select TOP ? QuestionId, QContent, Q.CorrectAnswerId "
//                + "from Questions Q, Subjects Su "
//                + "where Q.SubId = Su.SubId and Su.SubName = ? "
//                + "and Q.StatusId = 1 "
//                + "offset 1 * (?-1) rows "
//                + "fetch next 1 rows only";
//
//        try {
//            conn = DBUtilities.makeConnection();
//            if (conn != null) {
//                ps = conn.prepareStatement(sql);
//                ps.setInt(1, number);
//                ps.setString(2, subName);
//                ps.setInt(3, page);
//                rs = ps.executeQuery();
//                while (rs.next()) {
//                    int quesId = rs.getInt("QuestionId");
//                    String content = rs.getString("QContent");
//                    String correctAns = rs.getString("CorrectAnswerId");
//                    question = new QuestionsDTO(quesId, content, correctAns);
////                    quizList.add(question);
//                }
//
//            }
//        } finally {
//            closeConnection();
//        }
////        return quizList;
//        return question;
//    }
//    
    public int countQuesInSubject(String subName)
            throws NamingException, SQLException {
        int numberOfQuiz = 0;
        String sql = "SELECT COUNT(Q.QContent) AS NoOfQuiz\n"
                + " FROM dbo.Questions Q, dbo.Subjects S\n"
                + " WHERE Q.SubId = S.SubId\n"
                + " AND S.SubName = ? and Q.StatusId = 1";
        try {
            conn = DBUtilities.makeConnection();
            if (conn != null) {
                ps = conn.prepareStatement(sql);
                ps.setString(1, subName);
                rs = ps.executeQuery();
                if (rs.next()) {
                    numberOfQuiz = rs.getInt("NoOfQuiz");
                }
            }

        } finally {
            closeConnection();
        }
        return numberOfQuiz;
    }

//     public List<QuestionsDTO> getQuesListForQuiz(int number, String subName)
//            throws NamingException, SQLException {
//        List<QuestionsDTO> questionList = new ArrayList<>();
//        String sql = "Select TOP " + number +  " QuestionId, QContent, Q.CorrectAnswerId "
//                + "from Questions Q, Subjects Su "
//                + "where Q.SubId = Su.SubId and Su.SubName = ? "
//                + "and Q.StatusId = 1";
//                
//
//        try {
//            conn = DBUtilities.makeConnection();
//            if (conn != null) {
//                ps = conn.prepareStatement(sql);
//                ps.setString(1, subName);
//                rs = ps.executeQuery();
//                while (rs.next()) {
//                    int quesId = rs.getInt("QuestionId");
//                    String content = rs.getString("QContent");
//                    String correctAns = rs.getString("CorrectAnswerId");
//                    QuestionsDTO question = new QuestionsDTO(quesId, content, correctAns);
//                    questionList.add(question);
//                }
//
//            }
//        } finally {
//            closeConnection();
//        }
////        return quizList;
//        return questionList;
//    }
    public List<QuestionsDTO> getQuesListForQuiz(String subName)
            throws NamingException, SQLException {
        List<QuestionsDTO> questionList = new ArrayList<>();
        String sql = "SELECT TOP 10 QuestionId ,QContent, CorrectAnswerId\n"
                + " FROM dbo.Questions Q, dbo.Subjects S\n"
                + " WHERE Q.SubId = S.SubId\n"
                + " AND s.SubName = ? and Q.StatusId = 1\n"
                + " ORDER BY NEWID()";
        try {
            conn = DBUtilities.makeConnection();
            if (conn != null) {
                ps = conn.prepareStatement(sql);
                ps.setString(1, subName);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int quesId = rs.getInt("QuestionId");
                    String content = rs.getString("QContent");
                    String correctAnsId = rs.getString("CorrectAnswerId");
                    QuestionsDTO question = new QuestionsDTO(quesId, content, correctAnsId);
                    questionList.add(question);
                }
            }
        } finally {
            closeConnection();
        }
        return questionList;
    }

}
