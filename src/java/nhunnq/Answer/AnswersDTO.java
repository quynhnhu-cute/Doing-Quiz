/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhunnq.Answer;

import java.io.Serializable;

/**
 *
 * @author USER
 */
public class AnswersDTO implements Serializable {

    private String ansId;
    private String ansContent;
    private int quesId;

    public AnswersDTO() {
    }

    public AnswersDTO(String ansId, String ansContent, int quesId) {
        this.ansId = ansId;
        this.ansContent = ansContent;
        this.quesId = quesId;
    }

    public String getAnsId() {
        return ansId;
    }

    public void setAnsId(String ansId) {
        this.ansId = ansId;
    }

    public String getAnsContent() {
        return ansContent;
    }

    public void setAnsContent(String ansContent) {
        this.ansContent = ansContent;
    }

    public int getQuesId() {
        return quesId;
    }

    public void setQuesId(int quesId) {
        this.quesId = quesId;
    }

}
