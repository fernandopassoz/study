package remember;

import java.util.UUID;

public class UUIDGenerator implements IdGeneratorInterface {
  @Override
  public String generateId() {
    return UUID.randomUUID().toString();
  }
}
