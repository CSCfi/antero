package fi.csc.antero.odata.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
//import java.util.Date;

/**
 * F_Maara entitymk_opintopiste
 *
 * @author lauri.jokipii@csc.fi
 */
@Entity(name = "F_AMK_OPINTOPISTE")
public class F_Amk_opintopiste {
    private Long id;
    private String db;
    private Integer vuosi;
    private String koulutustyyppi;
    private String koodi;
    private Integer perustutkinto;
    private Integer tkitoiminnanlaajuus;
    private Integer tkimuutlaajuus;
    private Integer tkiharjoittelunlaajuus;
    private Integer vieraskielinen;
    private Integer avoinkk;
    private Integer erillinenoo;
    private Integer joo;
    private Integer kvvaihto;
    private Integer mvalko;
    private Integer erikoistumisopinnot;
    private Integer hyvaksiluetut;

    public F_Amk_opintopiste(long id, String db) {
        this.id = id;
        this.db = db;
    }

    public F_Amk_opintopiste() {}

    @Id
    @Column
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column
    @Size(max = 10)
    public String getDb() {
        return db;
    }

    public void setDb(String db) {
        this.db = db;
    }

    @Column
    public Integer getVuosi() {
        return vuosi;
    }

    public void setVuosi(Integer vuosi) {
        this.vuosi = vuosi;
    }

    @Column(nullable = true)
    @Size(max = 2)
    public String getKoulutustyyppi() {
        return koulutustyyppi;
    }

    public void setKoulutustyyppi(String koulutustyyppi) {
        this.koulutustyyppi = koulutustyyppi;
    }

    @Column(nullable = true)
    @Size(max = 2)
    public String getKoodi() {
        return koodi;
    }

    public void setKoodi(String koodi) {
        this.koodi = koodi;
    }

    @Column(nullable = true)
    public Integer getPerustutkinto() {
        return perustutkinto;
    }

    public void setPerustutkinto(Integer perustutkinto) {
        this.perustutkinto = perustutkinto;
    }

    @Column(nullable = true)
    public Integer getTkitoiminnanlaajuus() {
        return tkitoiminnanlaajuus;
    }

    public void setTkitoiminnanlaajuus(Integer tkitoiminnanlaajuus) {
        this.tkitoiminnanlaajuus = tkitoiminnanlaajuus;
    }

    @Column(nullable = true)
    public Integer getTkimuutlaajuus() {
        return tkimuutlaajuus;
    }

    public void setTkimuutlaajuus(Integer tkimuutlaajuus) {
        this.tkimuutlaajuus = tkimuutlaajuus;
    }

    @Column(nullable = true)
    public Integer getTkiharjoittelunlaajuus() {
        return tkiharjoittelunlaajuus;
    }

    public void setTkiharjoittelunlaajuus(Integer tkiharjoittelunlaajuus) {
        this.tkiharjoittelunlaajuus = tkiharjoittelunlaajuus;
    }

    @Column(nullable = true)
    public Integer getVieraskielinen() {
        return vieraskielinen;
    }

    public void setVieraskielinen(Integer vieraskielinen) {
        this.vieraskielinen = vieraskielinen;
    }

    @Column(nullable = true)
    public Integer getAvoinkk() {
        return avoinkk;
    }

    public void setAvoinkk(Integer avoinkk) {
        this.avoinkk = avoinkk;
    }

    @Column(nullable = true)
    public Integer getErillinenoo() {
        return erillinenoo;
    }

    public void setErillinenoo(Integer erillinenoo) {
        this.erillinenoo = erillinenoo;
    }

    @Column(nullable = true)
    public Integer getJoo() {
        return joo;
    }

    public void setJoo(Integer joo) {
        this.joo = joo;
    }

    @Column(nullable = true)
    public Integer getKvvaihto() {
        return kvvaihto;
    }

    public void setKvvaihto(Integer kvvaihto) {
        this.kvvaihto = kvvaihto;
    }

    @Column(nullable = true)
    public Integer getMvalko() {
        return mvalko;
    }

    public void setMvalko(Integer mvalko) {
        this.mvalko = mvalko;
    }

    @Column(nullable = true)
    public Integer getErikoistumisopinnot() {
        return erikoistumisopinnot;
    }

    public void setErikoistumisopinnot(Integer erikoistumisopinnot) {
        this.erikoistumisopinnot = erikoistumisopinnot;
    }

    @Column(nullable = true)
    public Integer getHyvaksiluetut() {
        return hyvaksiluetut;
    }

    public void setHyvaksiluetut(Integer hyvaksiluetut) {
        this.hyvaksiluetut = hyvaksiluetut;
    }
}
