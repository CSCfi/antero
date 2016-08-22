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

    private String koulutusala2002_koodi;
    private String koulutusala2002;
    private String koulutusala2002_sv;
    private String koulutusala2002_en;
    private List<F_AMK_Opintopiste> opintopisteet;

    public D_Koulutusala2002() {

    }

    @Id
    @Size(max = 5)
    public String getKoulutusala2002_koodi() {
        return koulutusala2002_koodi;
    }

    public void setKoulutusala2002_koodi(String koulutusala2002_koodi) {
        this.koulutusala2002_koodi = koulutusala2002_koodi;
    }

    @Size(max = 100)
    public String getKoulutusala2002() {
        return koulutusala2002;
    }

    public void setKoulutusala2002(String koulutusala2002) {
        this.koulutusala2002 = koulutusala2002;
    }

    @Column
    @Size(max = 100)
    public String getKoulutusala2002_sv() {
        return koulutusala2002_sv;
    }

    public void setKoulutusala2002_sv(String koulutusala2002_sv) {
        this.koulutusala2002_sv = koulutusala2002_sv;
    }

    @Column
    @Size(max = 100)
    public String getKoulutusala2002_en() {
        return koulutusala2002_en;
    }

    public void setKoulutusala2002_en(String koulutusala2002_en) {
        this.koulutusala2002_en = koulutusala2002_en;
    }

    @OneToMany(mappedBy = "koulutusala_koodi")
    public List<F_AMK_Opintopiste> getOpintopisteet() {
        return opintopisteet;
    }

    public void setOpintopisteet(List<F_AMK_Opintopiste> opintopisteet) {
        this.opintopisteet = opintopisteet;
    }
}
