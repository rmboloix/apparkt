package util;

//import com.google.common.base.Charsets;
//import com.google.common.hash.Hashing;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Rafael Mateo Boloix
 */
public class Util {
    /**
     * @author Rafael Mateo Boloix
     * @param password
     * @return string con el password encriptado
     */
    public static String generateSHA256SecurePassword(String password){
        StringBuilder st = new StringBuilder();
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes("UTF-8"));
            for (int i = 0; i < hash.length; i++) {
                String hex = Integer.toHexString(0xff & hash[i]);
                if(hex.length() == 1) st.append('0');
                st.append(hex);
            }
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Util.class.getName()).log(Level.SEVERE, null, ex);
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(Util.class.getName()).log(Level.SEVERE, null, ex);
        }
        return st.toString();
    }
    
    public static String generateHash(String password){
//        return Hashing.sha256().hashString(password, Charsets.UTF_8).toString();
        return null;
    }
    
    public static void main (String[]args){
        System.out.println(generateHash("12341234"));
    }
}