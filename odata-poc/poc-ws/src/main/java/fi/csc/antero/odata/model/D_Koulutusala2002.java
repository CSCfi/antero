package fi.csc.antero.odata.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * D_Koulutusala2002 entity
 *
 * @author aki.heikkinen@arcusys.fi
 */
@Entity(name = "D_KOULUTUSALA2002")
public class D_Koulutusala2002 {

    private String koodi;
    private String selite;
    private String selite_sv;
    private String selite_en;
    private List<F_AMK_Opintopiste> opintopisteet;

    public D_Koulutusala2002() {

    }

    @Id
    @Size(max = 5)
    public String getKoodi() {
        return koodi;
    }

    public void setKoodi(String koodi) {
        this.koodi = koodi;
    }

    @Size(max = 100)
    public String getSelite() {
        return selite;
    }

    public void setSelite(String selite) {
        this.selite = selite;
    }

    @Column
    @Size(max = 100)
    public String getSelite_sv() {
        return selite_sv;
    }

    public void setSelite_sv(String selite_sv) {
        this.selite_sv = selite_sv;
    }

    @Column
    @Size(max = 100)
    public String getSelite_en() {
        return selite_en;
    }

    public void setSelite_en(String selite_en) {
        this.selite_en = selite_en;
    }

    @OneToMany(mappedBy = "koulutusala")
    public List<F_AMK_Opintopiste> getOpintopisteet() {
        return opintopisteet;
    }

    public void setOpintopisteet(List<F_AMK_Opintopiste> opintopisteet) {
        this.opintopisteet = opintopisteet;
    }
}
