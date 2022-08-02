package remember;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.SecureRandom;

public class SimpleHasher implements PasswordHasherInterface {
  @Override
  public String hashPassword(String value) {
    SecureRandom random = new SecureRandom();
    byte[] salt = new byte[16];
    random.nextBytes(salt);
    MessageDigest md;
    byte[] hashedPassword = null;
    StringBuilder sb = new StringBuilder();
    try {
      md = MessageDigest.getInstance("SHA-512");
      md.update(salt);
      hashedPassword = md.digest(value.getBytes(StandardCharsets.UTF_8));
      for (int i = 0; i < hashedPassword.length; i++) {
        sb.append(Integer.toString((hashedPassword[i] & 0xff) + 0x100, 16).substring(1));
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return sb.toString();
  }
}
