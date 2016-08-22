package fi.csc.antero.odata.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.Size;

/**
 * D_DB entity
 *
 * @author aki.heikkinen@arcusys.fi
 */
@Entity(name = "D_DB")
public class D_DB {

    private String db;
    private String selite;
    private String koodi;

    public D_DB() {

    }

    @Id
    @Size(max = 8)
    public String getDb() {
        return db;
    }

    public void setDb(String db) {
        this.db = db;
    }

    @Column
    @Size(max = 100)
    public String getSelite() {
        return selite;
    }

    public void setSelite(String selite) {
        this.selite = selite;
    }

    @Column
    @Size(max = 5)
    public String getKoodi() {
        return koodi;
    }

    public void setKoodi(String koodi) {
        this.koodi = koodi;
    }

}
