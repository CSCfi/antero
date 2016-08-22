package fi.csc.antero.odata.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.math.BigDecimal;

/**
 * F_AMK_Opintopiste entity
 *
 * @author aki.heikkinen@arcusys.fi
 */
@Entity(name = "F_AMK_OPINTOPISTE")
public class F_AMK_Opintopiste {

    private Long id;
    private Short vuosi;
    private D_DB db;
    private D_Koulutustyyppi koulutustyyppi;
    private D_Koulutusala2002 koulutusala;
    private BigDecimal perustutkinto;
    private BigDecimal tkitoiminnanlaajuus;
    private BigDecimal tkimuutlaajuus;
    private BigDecimal tkiharjoittelunlaajuus;
    private BigDecimal vieraskielinen;
    private BigDecimal avoinkk;
    private BigDecimal erillinenoo;
    private BigDecimal joo;
    private BigDecimal kvvaihto;
    private BigDecimal mvalko;
    private BigDecimal erikoistumisopinnot;
    private BigDecimal hyvaksiluetut;

    public F_AMK_Opintopiste() {

    }

    @Id
    @Column
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(nullable = true)
    public Short getVuosi() {
        return vuosi;
    }

    public void setVuosi(Short vuosi) {
        this.vuosi = vuosi;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "db_db", nullable = true)
    public D_DB getDb() {
        return db;
    }

    public void setDb(D_DB db) {
        this.db = db;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "koulutustyyppi_koodi", nullable = true)
    public D_Koulutustyyppi getKoulutustyyppi() {
        return koulutustyyppi;
    }

    public void setKoulutustyyppi(D_Koulutustyyppi koulutustyyppi) {
        this.koulutustyyppi = koulutustyyppi;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "koulutusala2002_koodi", nullable = true)
    public D_Koulutusala2002 getKoulutusala() {
        return koulutusala;
    }

    public void setKoulutusala(D_Koulutusala2002 koulutusala) {
        this.koulutusala = koulutusala;
    }

    @Column(nullable = true)
    public BigDecimal getErillinenoo() {
        return erillinenoo;
    }

    public void setErillinenoo(BigDecimal erillinenoo) {
        this.erillinenoo = erillinenoo;
    }

    @Column(nullable = true)
    public BigDecimal getPerustutkinto() {
        return perustutkinto;
    }

    public void setPerustutkinto(BigDecimal perustutkinto) {
        this.perustutkinto = perustutkinto;
    }

    @Column(nullable = true)
    public BigDecimal getTkitoiminnanlaajuus() {
        return tkitoiminnanlaajuus;
    }

    public void setTkitoiminnanlaajuus(BigDecimal tkitoiminnanlaajuus) {
        this.tkitoiminnanlaajuus = tkitoiminnanlaajuus;
    }

    @Column(nullable = true)
    public BigDecimal getTkimuutlaajuus() {
        return tkimuutlaajuus;
    }

    public void setTkimuutlaajuus(BigDecimal tkimuutlaajuus) {
        this.tkimuutlaajuus = tkimuutlaajuus;
    }

    @Column(nullable = true)
    public BigDecimal getTkiharjoittelunlaajuus() {
        return tkiharjoittelunlaajuus;
    }

    public void setTkiharjoittelunlaajuus(BigDecimal tkiharjoittelunlaajuus) {
        this.tkiharjoittelunlaajuus = tkiharjoittelunlaajuus;
    }

    @Column(nullable = true)
    public BigDecimal getVieraskielinen() {
        return vieraskielinen;
    }

    public void setVieraskielinen(BigDecimal vieraskielinen) {
        this.vieraskielinen = vieraskielinen;
    }

    @Column(nullable = true)
    public BigDecimal getAvoinkk() {
        return avoinkk;
    }

    public void setAvoinkk(BigDecimal avoinkk) {
        this.avoinkk = avoinkk;
    }

    @Column(nullable = true)
    public BigDecimal getJoo() {
        return joo;
    }

    public void setJoo(BigDecimal joo) {
        this.joo = joo;
    }

    @Column(nullable = true)
    public BigDecimal getKvvaihto() {
        return kvvaihto;
    }

    public void setKvvaihto(BigDecimal kvvaihto) {
        this.kvvaihto = kvvaihto;
    }

    @Column(nullable = true)
    public BigDecimal getMvalko() {
        return mvalko;
    }

    public void setMvalko(BigDecimal mvalko) {
        this.mvalko = mvalko;
    }

    @Column(nullable = true)
    public BigDecimal getErikoistumisopinnot() {
        return erikoistumisopinnot;
    }

    public void setErikoistumisopinnot(BigDecimal erikoistumisopinnot) {
        this.erikoistumisopinnot = erikoistumisopinnot;
    }

    @Column(nullable = true)
    public BigDecimal getHyvaksiluetut() {
        return hyvaksiluetut;
    }

    public void setHyvaksiluetut(BigDecimal hyvaksiluetut) {
        this.hyvaksiluetut = hyvaksiluetut;
    }
}
