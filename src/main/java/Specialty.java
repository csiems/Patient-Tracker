import java.util.Arrays;
import java.util.List;

import org.sql2o.*;

public class Specialty {
  private int mId;
  private String mSpecialty;

  public Specialty(String specialty) {
    mSpecialty = specialty;
  }

  public int getId() {
    return mId;
  }

  public String getSpecialty() {
    return mSpecialty;
  }

  public static List<Specialty> all() {
    String sql = "SELECT id AS mId, specialty AS mSpecialty FROM specialties;";
    try (Connection con = DB.sql2o.open()){
      return con.createQuery(sql).executeAndFetch(Specialty.class);
    }
  }

  @Override
  public boolean equals(Object otherSpecialty) {
    if (!(otherSpecialty instanceof Specialty)) {
      return false;
    } else {
      Specialty newSpecialty = (Specialty) otherSpecialty;
      return this.getSpecialty().equals(newSpecialty.getSpecialty());
    }
  }


}
