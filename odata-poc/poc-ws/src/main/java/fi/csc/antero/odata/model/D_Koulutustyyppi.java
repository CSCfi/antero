package fi.csc.antero.odata.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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

    private String koodi;
    private String selite;
    private String selite_sv;
    private String selite_en;
    private List<F_AMK_Opintopiste> f_AMK_Opintopiste;

    public D_Koulutustyyppi() {

    }

    @Id
    @Size(max = 5)
    public String getKoodi() {
        return koodi;
    }

    public void setKoodi(String koodi) {
        this.koodi = koodi;
    }

    @Column
    @Size(max = 200)
    public String getSelite() {
        return selite;
    }

    public void setSelite(String selite) {
        this.selite = selite;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getSelite_sv() {
        return selite_sv;
    }

    public void setSelite_sv(String selite_sv) {
        this.selite_sv = selite_sv;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getSelite_en() {
        return selite_en;
    }

    public void setSelite_en(String selite_en) {
        this.selite_en = selite_en;
    }

    @OneToMany(mappedBy = "koulutustyyppi")
    public List<F_AMK_Opintopiste> getF_AMK_Opintopiste() {
        return f_AMK_Opintopiste;
    }

    public void setF_AMK_Opintopiste(List<F_AMK_Opintopiste> f_AMK_Opintopiste) {
        this.f_AMK_Opintopiste = f_AMK_Opintopiste;
    }
}
