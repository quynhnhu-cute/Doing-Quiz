/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhunnq.Subject;

import java.io.Serializable;

/**
 *
 * @author USER
 */
public class SubjectDTO implements Serializable{
    private int subjectId;
    private String subjectName;
    private int NumOfQuestion;
    private int time;

    public SubjectDTO() {
    }

    public SubjectDTO(int subjectId, String subjectName, int NumOfQuestion, int time) {
        this.subjectId = subjectId;
        this.subjectName = subjectName;
        this.NumOfQuestion = NumOfQuestion;
        this.time = time;
    }

    public SubjectDTO(String subjectName, int NumOfQuestion, int time) {
        this.subjectName = subjectName;
        this.NumOfQuestion = NumOfQuestion;
        this.time = time;
    }
    
    

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

   

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public int getNumOfQuestion() {
        return NumOfQuestion;
    }

    public void setNumOfQuestion(int NumOfQuestion) {
        this.NumOfQuestion = NumOfQuestion;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }
    
    
           
}
