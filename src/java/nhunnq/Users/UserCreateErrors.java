/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhunnq.Users;

/**
 *
 * @author USER
 */
public class UserCreateErrors {

    /**
     * @return the usernameNotValid
     */
    
    
    private String usernameLengthError;
    private String passwordLengthError;
    private String passwordNotMatchingError;
    private String fullnameLengthError;
    private String usernameDuplicatedError;
    private String usernameNotValid;

    public UserCreateErrors() {
    }

    public UserCreateErrors(String usernameLengthError, String passwordLengthError, String passwordNotMatchingError, String fullnameLengthError, String usernameDuplicatedError, String usernameNotValid) {
        this.usernameLengthError = usernameLengthError;
        this.passwordLengthError = passwordLengthError;
        this.passwordNotMatchingError = passwordNotMatchingError;
        this.fullnameLengthError = fullnameLengthError;
        this.usernameDuplicatedError = usernameDuplicatedError;
        this.usernameNotValid = usernameNotValid;
    }

   

    public String getUsernameLengthError() {
        return usernameLengthError;
    }

    public void setUsernameLengthError(String usernameLengthError) {
        this.usernameLengthError = usernameLengthError;
    }

    public String getPasswordLengthError() {
        return passwordLengthError;
    }

    public void setPasswordLengthError(String passwordLengthError) {
        this.passwordLengthError = passwordLengthError;
    }

    public String getPasswordNotMatchingError() {
        return passwordNotMatchingError;
    }

    public void setPasswordNotMatchingError(String passwordNotMatchingError) {
        this.passwordNotMatchingError = passwordNotMatchingError;
    }

    public String getFullnameLengthError() {
        return fullnameLengthError;
    }

    public void setFullnameLengthError(String fullnameLengthError) {
        this.fullnameLengthError = fullnameLengthError;
    }

    public String getUsernameDuplicatedError() {
        return usernameDuplicatedError;
    }

    public void setUsernameDuplicatedError(String usernameDuplicatedError) {
        this.usernameDuplicatedError = usernameDuplicatedError;
    }
    public String getUsernameNotValid() {
        return usernameNotValid;
    }

    /**
     * @param usernameNotValid the usernameNotValid to set
     */
    public void setUsernameNotValid(String usernameNotValid) {
        this.usernameNotValid = usernameNotValid;
    }
    
    
}
