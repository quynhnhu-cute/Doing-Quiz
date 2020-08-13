/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhunnq.DBUtilities;

import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author USER
 */
public class DBUtilities {
    
    
    public static Connection makeConnection()
        throws SQLException, NamingException{
        Context context = new InitialContext();
        Context tomContext = (Context) context.lookup("java:comp/env");
        DataSource ds = (DataSource) tomContext.lookup("NNQNDB");
        Connection conn = ds.getConnection();
        return conn;
        
    }
}
