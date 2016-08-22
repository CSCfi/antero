package fi.csc.antero.odata.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * D_Koulutustyyppi entity
 *
 * @author aki.heikkinen@arcusys.fi
 */
@Entity(name = "D_KOULUTUSTYYPPI")
public class D_Koulutustyyppi {

    private String koulutustyyppi_koodi;
    private String koulutustyyppi;
    private String koulutustyyppi_sv;
    private String koulutustyyppi_en;
    private List<F_AMK_Opintopiste> opintopisteet;

    public D_Koulutustyyppi() {}

    @Id
    @Size(max = 5)
    public String getKoulutustyyppi_koodi() {
        return koulutustyyppi_koodi;
    }

    public void setKoulutustyyppi_koodi(String koulutustyyppi_koodi) {
        this.koulutustyyppi_koodi = koulutustyyppi_koodi;
    }

    @Column
    @Size(max = 200)
    public String getKoulutustyyppi() {
        return koulutustyyppi;
    }

    public void setKoulutustyyppi(String koulutustyyppi) {
        this.koulutustyyppi = koulutustyyppi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getKoulutustyyppi_sv() {
        return koulutustyyppi_sv;
    }

    public void setKoulutustyyppi_sv(String koulutustyyppi_sv) {
        this.koulutustyyppi_sv = koulutustyyppi_sv;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getKoulutustyyppi_en() {
        return koulutustyyppi_en;
    }

    public void setKoulutustyyppi_en(String koulutustyyppi_en) {
        this.koulutustyyppi_en = koulutustyyppi_en;
    }

    @OneToMany(mappedBy = "koulutustyyppi_koodi")
    public List<F_AMK_Opintopiste> getOpintopisteet() {
        return opintopisteet;
    }

    public void setOpintopisteet(List<F_AMK_Opintopiste> opintopisteet) {
        this.opintopisteet = opintopisteet;
    }
}
