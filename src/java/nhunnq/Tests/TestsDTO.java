/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhunnq.Tests;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author USER
 */
public class TestsDTO implements Serializable{
    
    private int testId;
    private Timestamp createDate;
    private double mark;
    private String subName, email;

    public TestsDTO() {
    }

    public TestsDTO(int testId, Timestamp createDate, double mark, String subName, String email) {
        this.testId = testId;
        this.createDate = createDate;
        this.mark = mark;
        this.subName = subName;
        this.email = email;
    }

    public TestsDTO(Timestamp createDate, double mark, String subName, String email) {
        this.createDate = createDate;
        this.mark = mark;
        this.subName = subName;
        this.email = email;
    }

    

    public int getTestId() {
        return testId;
    }

    public void setTestId(int testId) {
        this.testId = testId;
    }

    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    public double getMark() {
        return mark;
    }

    public void setMark(double mark) {
        this.mark = mark;
    }

    public String getSubName() {
        return subName;
    }

    public void setSubName(String subName) {
        this.subName = subName;
    }

    

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
    
}
