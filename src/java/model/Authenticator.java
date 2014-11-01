/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;
import util.Util;
/**
 *
 * @author Rafael Mateo Boloix  
 */
public class Authenticator {
    public static final int AUTHENTICATION_ERROR = 1;
    public static final int AUTHENTICATION_SUCCESS = 2;
    
    private String storedPassword = "2a81f41df663d1b97a5286273f1c7dfde2a056fbf019620cd6b7595a3b7715cd";
    private String storedUser = "rafamateo";
    public int authenticate(String username, String password){
        String sha = Util.generateSHA256SecurePassword(password);
        System.out.println(sha);
        System.out.println(password);
        if(username.equals(storedUser) && sha.equals(storedPassword)){
            return AUTHENTICATION_SUCCESS;
        }else{
            return AUTHENTICATION_ERROR;
        }
    }
}
