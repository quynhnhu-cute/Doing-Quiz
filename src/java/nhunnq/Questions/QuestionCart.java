/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhunnq.Questions;

import java.io.Serializable;

/**
 *
 * @author USER
 */
public class QuestionCart implements Serializable {

    private int quesId;
    private String quesContent;
    private String quesCorrectAnswer;
    private String answer1, answer2, answer3, answer4;
    private String answerId1, answerId2, answerId3, answerId4;
    private String ansTicked;

    public String getAnsTicked() {
        return ansTicked;
    }

    public void setAnsTicked(String ansTicked) {
        this.ansTicked = ansTicked;
    }
    
    public QuestionCart() {
    }

    public QuestionCart(int quesId, String quesContent, String quesCorrectAnswer, String answer1, String answer2, String answer3, String answer4, String answerId1, String answerId2, String answerId3, String answerId4) {
        this.quesId = quesId;
        this.quesContent = quesContent;
        this.quesCorrectAnswer = quesCorrectAnswer;
        this.answer1 = answer1;
        this.answer2 = answer2;
        this.answer3 = answer3;
        this.answer4 = answer4;
        this.answerId1 = answerId1;
        this.answerId2 = answerId2;
        this.answerId3 = answerId3;
        this.answerId4 = answerId4;
    }

    public QuestionCart(int quesId, String quesContent, String quesCorrectAnswer, String answer1, String answer2, String answer3, String answer4, String answerId1, String answerId2, String answerId3, String answerId4, String ansTicked) {
        this.quesId = quesId;
        this.quesContent = quesContent;
        this.quesCorrectAnswer = quesCorrectAnswer;
        this.answer1 = answer1;
        this.answer2 = answer2;
        this.answer3 = answer3;
        this.answer4 = answer4;
        this.answerId1 = answerId1;
        this.answerId2 = answerId2;
        this.answerId3 = answerId3;
        this.answerId4 = answerId4;
        this.ansTicked = ansTicked;
    }
    
    public QuestionCart(int quesId, String answer1, String answer2, String answer3, String answer4) {
        this.quesId = quesId;
        this.answer1 = answer1;
        this.answer2 = answer2;
        this.answer3 = answer3;
        this.answer4 = answer4;
    }
    
    

    public String getQuesContent() {
        return quesContent;
    }

    public void setQuesContent(String quesContent) {
        this.quesContent = quesContent;
    }

    public String getQuesCorrectAnswer() {
        return quesCorrectAnswer;
    }

    public void setQuesCorrectAnswer(String quesCorrectAnswer) {
        this.quesCorrectAnswer = quesCorrectAnswer;
    }

    public String getAnswer1() {
        return answer1;
    }

    public void setAnswer1(String answer1) {
        this.answer1 = answer1;
    }

    public String getAnswer2() {
        return answer2;
    }

    public void setAnswer2(String answer2) {
        this.answer2 = answer2;
    }

    public String getAnswer3() {
        return answer3;
    }

    public void setAnswer3(String answer3) {
        this.answer3 = answer3;
    }

    public String getAnswer4() {
        return answer4;
    }

    public void setAnswer4(String answer4) {
        this.answer4 = answer4;
    }

    public String getAnswerId1() {
        return answerId1;
    }

    public void setAnswerId1(String answerId1) {
        this.answerId1 = answerId1;
    }

    public String getAnswerId2() {
        return answerId2;
    }

    public void setAnswerId2(String answerId2) {
        this.answerId2 = answerId2;
    }

    public String getAnswerId3() {
        return answerId3;
    }

    public void setAnswerId3(String answerId3) {
        this.answerId3 = answerId3;
    }

    public String getAnswerId4() {
        return answerId4;
    }

    public void setAnswerId4(String answerId4) {
        this.answerId4 = answerId4;
    }

    public int getQuesId() {
        return quesId;
    }

    public void setQuesId(int quesId) {
        this.quesId = quesId;
    }

}
