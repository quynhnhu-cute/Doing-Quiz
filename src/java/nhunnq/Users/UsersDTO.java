/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhunnq.Users;

import java.io.Serializable;

/**
 *
 * @author USER
 */
public class UsersDTO implements Serializable{
    private String email;
    private String fullName;
    private String password;
    private boolean roleId;
    private int statusId;

    public UsersDTO() {
    }

    public UsersDTO(String email, String fullName, String password, boolean roleId, int statusId) {
        this.email = email;
        this.fullName = fullName;
        this.password = password;
        this.roleId = roleId;
        this.statusId = statusId;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the fullName
     */
    public String getFullName() {
        return fullName;
    }

    /**
     * @param fullName the fullName to set
     */
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the roleId
     */
    public boolean isRoleId() {
        return roleId;
    }

    /**
     * @param roleId the roleId to set
     */
    public void setRoleId(boolean roleId) {
        this.roleId = roleId;
    }

    /**
     * @return the statusId
     */
    public int getStatusId() {
        return statusId;
    }

    /**
     * @param statusId the statusId to set
     */
    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    

    /**
     * @param statusId the statusId to set
     */
    
    
}
