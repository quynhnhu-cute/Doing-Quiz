/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhunnq.Questions;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author USER
 */
public class QuestionsDTO implements Serializable{
    
    private int quesId;
    private String quesContent;
    private String correctAnsId;
    private int subId;
    public String getCorrectAnsId() {
        return correctAnsId;
    }

    public void setCorrectAnsId(String correctAnsId) {
        this.correctAnsId = correctAnsId;
    }
    private int statusId;
    private Timestamp dateOfCreate;
    private String subject;
    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }
   

    public QuestionsDTO() {
    }

    public QuestionsDTO(int quesId, String quesContent, String correctAnsId, String subject, String status) {
        this.quesId = quesId;
        this.quesContent = quesContent;
        this.subId = subId;
        this.correctAnsId = correctAnsId;
        this.statusId = statusId;
        this.dateOfCreate = dateOfCreate;
        this.subject = subject;
        this.status = status;
    }

    public QuestionsDTO(String quesContent, String correctAnsId, int subId, int statusId, Timestamp dateOfCreate) {
        this.quesContent = quesContent;
        this.correctAnsId = correctAnsId;
        this.subId = subId;
        this.statusId = statusId;
        this.dateOfCreate = dateOfCreate;
    }

    public QuestionsDTO(int quesId, String quesContent, String correctAnsId, int subId, int statusId) {
        this.quesId = quesId;
        this.quesContent = quesContent;
        this.correctAnsId = correctAnsId;
        this.subId = subId;
        this.statusId = statusId;
    }

    public QuestionsDTO(int quesId, String quesContent, String correctAnsId) {
        this.quesId = quesId;
        this.quesContent = quesContent;
        this.correctAnsId = correctAnsId;
    }

   
    
    public int getSubId() {
        return subId;
    }

    public void setSubId(int subId) {
        this.subId = subId;
    }

    public QuestionsDTO(String quesContent, String correctAnsId, String subject, String status) {
        this.quesContent = quesContent;
        this.correctAnsId = correctAnsId;
        this.subject = subject;
        this.status = status;
    }

    

   
    
    

    

    public int getQuesId() {
        return quesId;
    }

    public void setQuesId(int quesId) {
        this.quesId = quesId;
    }

    public String getQuesContent() {
        return quesContent;
    }

    public void setQuesContent(String quesContent) {
        this.quesContent = quesContent;
    }

   

    

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public Timestamp getDateOfCreate() {
        return dateOfCreate;
    }

    public void setDateOfCreate(Timestamp dateOfCreate) {
        this.dateOfCreate = dateOfCreate;
    }
    
    
    
}
