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
public class QuestionCreateErrors implements Serializable {

    private String quesContentLengthError;
    private String answerALengthError;
    private String answerBLengthError;
    private String answerCLengthError;
    private String answerDLengthError;
    private String correctAnsValid;
    private String subjectLengthError;
    private String questionAlreadyExisted;

    public QuestionCreateErrors() {
    }

    public QuestionCreateErrors(String quesContentLengthError, String answerALengthError, String answerBLengthError, String answerCLengthError, String answerDLengthError, String correctAnsValid, String subjectLengthError, String questionAlreadyExisted) {
        this.quesContentLengthError = quesContentLengthError;
        this.answerALengthError = answerALengthError;
        this.answerBLengthError = answerBLengthError;
        this.answerCLengthError = answerCLengthError;
        this.answerDLengthError = answerDLengthError;
        this.correctAnsValid = correctAnsValid;
        this.subjectLengthError = subjectLengthError;
        this.questionAlreadyExisted = questionAlreadyExisted;
    }

    public String getQuestionAlreadyExisted() {
        return questionAlreadyExisted;
    }

    public void setQuestionAlreadyExisted(String questionAlreadyExisted) {
        this.questionAlreadyExisted = questionAlreadyExisted;
    }

    public String getCorrectAnsValid() {
        return correctAnsValid;
    }

    public void setCorrectAnsValid(String correctAnsValid) {
        this.correctAnsValid = correctAnsValid;
    }

    public String getQuesContentLengthError() {
        return quesContentLengthError;
    }

    public void setQuesContentLengthError(String quesContentLengthError) {
        this.quesContentLengthError = quesContentLengthError;
    }

    public String getAnswerALengthError() {
        return answerALengthError;
    }

    public void setAnswerALengthError(String answerALengthError) {
        this.answerALengthError = answerALengthError;
    }

    public String getAnswerBLengthError() {
        return answerBLengthError;
    }

    public void setAnswerBLengthError(String answerBLengthError) {
        this.answerBLengthError = answerBLengthError;
    }

    public String getAnswerCLengthError() {
        return answerCLengthError;
    }

    public void setAnswerCLengthError(String answerCLengthError) {
        this.answerCLengthError = answerCLengthError;
    }

    public String getAnswerDLengthError() {
        return answerDLengthError;
    }

    public void setAnswerDLengthError(String answerDLengthError) {
        this.answerDLengthError = answerDLengthError;
    }

    public String getSubjectLengthError() {
        return subjectLengthError;
    }

    public void setSubjectLengthError(String subjectLengthError) {
        this.subjectLengthError = subjectLengthError;
    }

}
