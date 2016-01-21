import java.util.Arrays;

import org.junit.*;
import static org.junit.Assert.*;

public class SpecialtyTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void all_emptyAtFirst() {
    assertEquals(Specialty.all().size(), 0);
  }

  @Test
  public void equals_returnsTrueIfSpecialtiesAreTheSame() {
    Specialty firstSpecialty = new Specialty("OB/GYN");
    Specialty secondSpecialty = new Specialty("OB/GYN");
    assertTrue(firstSpecialty.equals(secondSpecialty));
  }

  // @Test
  // public void save_savesSpecialtyIntoDatabase_true() {
  //   Specialty mySpecialty = new Specialty("Oncology");
  //   mySpecialty.save();
  //   assertTrue(Specialty.all().get(0).equals(mySpecialty));
  // }
  //
  // @Test
  // public void find_findCategoryInDatabase_true() {
  //   Specialty mySpecialty = new Specialty("Pediatrics");
  //   mySpecialty.save();
  //   Specialty savedSpecialty = Specialty.find(mySpecialty.getId());
  //   assertTrue(mySpecialty.equals(savedSpecialty));
  // }



}
