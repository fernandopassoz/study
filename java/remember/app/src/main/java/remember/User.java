package remember;

public class User {
  private String id;
  private String username;
  private String password;
  private String email;

  private PasswordHasherInterface hasher;
  private IdGeneratorInterface generator;

  public User() {

  }

  public User(IdGeneratorInterface generator, PasswordHasherInterface hasher) {
    this.hasher = hasher;
    this.generator = generator;
  }

  public void setHasher(PasswordHasherInterface hasher) {
    this.hasher = hasher;
  }

  public void setGenerator(IdGeneratorInterface generator) {
    this.generator = generator;
  }

  public String getId() {
    return id;
  }

  public String getUsername() {
    return username;
  }

  public String getEmail() {
    return email;
  }

  public String getPassword() {
    return password;
  }

  public void setId(String id) {

    this.id = this.generator.generateId();
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public void setPassword(String password) {
    this.password = this.hasher.hashPassword(password);
  }

  public void setEmail(String email) {
    this.email = email;
  }
}
