package fi.csc.antero.odata.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * D_DB entity
 *
 * @author aki.heikkinen@arcusys.fi
 */
@Entity(name = "D_DB")
public class D_DB {

    private String db_db;
    private String korkeakoulu;
    private String oppilaitos_koodi;
    private List<F_AMK_Opintopiste> opintopisteet;

    public D_DB() {

    }

    @Id
    @Size(max = 8)
    public String getDb_db() {
        return db_db;
    }

    public void setDb_db(String db_db) {
        this.db_db = db_db;
    }

    @Column
    @Size(max = 100)
    public String getKorkeakoulu() {
        return korkeakoulu;
    }

    public void setKorkeakoulu(String korkeakoulu) {
        this.korkeakoulu = korkeakoulu;
    }

    @Column
    @Size(max = 5)
    public String getOppilaitos_koodi() {
        return oppilaitos_koodi;
    }

    public void setOppilaitos_koodi(String oppilaitos_koodi) {
        this.oppilaitos_koodi = oppilaitos_koodi;
    }

    @OneToMany(mappedBy = "db_db")
    public List<F_AMK_Opintopiste> getOpintopisteet() {
        return opintopisteet;
    }

    public void setOpintopisteet(List<F_AMK_Opintopiste> opintopisteet) {
        this.opintopisteet = opintopisteet;
    }

}
