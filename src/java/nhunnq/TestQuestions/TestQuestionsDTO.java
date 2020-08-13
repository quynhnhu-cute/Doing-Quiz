/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhunnq.TestQuestions;

import java.io.Serializable;

/**
 *
 * @author USER
 */
public class TestQuestionsDTO implements Serializable{
    
    private int testQuesId, testId, quesId;
    private String ansId;
    String quesContent;
    String correctAnsId;
    public TestQuestionsDTO() {
    }

    public TestQuestionsDTO(int testQuesId, int testId, int quesId, String ansId) {
        this.testQuesId = testQuesId;
        this.testId = testId;
        this.quesId = quesId;
        this.ansId = ansId;
    }

    public TestQuestionsDTO(int testId, int quesId, String ansId) {
        this.testId = testId;
        this.quesId = quesId;
        this.ansId = ansId;
    }

    public TestQuestionsDTO(String ansId, String quesContent, String correctAnsId) {
        this.ansId = ansId;
        this.quesContent = quesContent;
        this.correctAnsId = correctAnsId;
    }

    public String getQuesContent() {
        return quesContent;
    }

    public void setQuesContent(String quesContent) {
        this.quesContent = quesContent;
    }

    public String getCorrectAnsId() {
        return correctAnsId;
    }

    public void setCorrectAnsId(String correctAnsId) {
        this.correctAnsId = correctAnsId;
    }

    
    
    public int getTestQuesId() {
        return testQuesId;
    }

    public void setTestQuesId(int testQuesId) {
        this.testQuesId = testQuesId;
    }

    public int getTestId() {
        return testId;
    }

    public void setTestId(int testId) {
        this.testId = testId;
    }

    public int getQuesId() {
        return quesId;
    }

    public void setQuesId(int quesId) {
        this.quesId = quesId;
    }

    public String getAnsId() {
        return ansId;
    }

    public void setAnsId(String ansId) {
        this.ansId = ansId;
    }
    
    
    
}
