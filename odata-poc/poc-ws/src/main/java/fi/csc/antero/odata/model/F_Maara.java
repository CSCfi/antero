package fi.csc.antero.odata.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * F_Maara entity
 *
 * @author aki.heikkinen@arcusys.fi
 */
@Entity(name = "F_MAARA")
public class F_Maara {
    private long id;
    private String ytunnus;
//    private Date paatospvm;
    private String diaarinro;
//    private Date alkupvm;
//    private Date loppupvm;
    private Integer kokonaisopiskelijamaara;
    private Integer kokonaisopiskelijamaara_1;
    private Integer kokonaisopiskelijamaara_2;
    private Integer erityisopiskelijamaara;
    private Integer erityisopiskelijamaara_1;
    private Integer erityisopiskelijamaara_2;
    private Integer sisaoppilaitosopiskelijamaara;
    private Integer sisaoppilaitosopiskelijamaara_1;
    private Integer sisaoppilaitosopiskelijamaara_2;
    private String opetuskieli;
    private Boolean valma;
    private Boolean tutkintoonvalmistava_erityinen;
    private Boolean valma_erityinen;
    private Boolean telma_erityinen;
    private Boolean kehittamis_erityinen;
    private Boolean urheilija;
    private Boolean sisaoppilaitos;

    public F_Maara(long id, String ytunnus) {
        this.id = id;
        this.ytunnus = ytunnus;
    }

    public F_Maara() {
    }

    @Id
    @Column
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Column
    public String getYtunnus() {
        return ytunnus;
    }

    public void setYtunnus(String ytunnus) {
        this.ytunnus = ytunnus;
    }

//    @Basic(optional = true)
//    @Temporal(TemporalType.DATE)
//    public Date getPaatospvm() {
//        return paatospvm;
//    }
//
//    public void setPaatospvm(Date paatospvm) {
//        this.paatospvm = paatospvm;
//    }

    @Column
    public String getDiaarinro() {
        return diaarinro;
    }

    public void setDiaarinro(String diaarinro) {
        this.diaarinro = diaarinro;
    }
//
//    @Column
//    public Date getAlkupvm() {
//        return alkupvm;
//    }
//
//    public void setAlkupvm(Date alkupvm) {
//        this.alkupvm = alkupvm;
//    }
//
//    @Column
//    public Date getLoppupvm() {
//        return loppupvm;
//    }
//
//    public void setLoppupvm(Date loppupvm) {
//        this.loppupvm = loppupvm;
//    }
//
    @Column(nullable = true)
    public Integer getKokonaisopiskelijamaara() {
        return kokonaisopiskelijamaara;
    }

    public void setKokonaisopiskelijamaara (Integer kokonaisopiskelijamaara) {
        this.kokonaisopiskelijamaara = kokonaisopiskelijamaara;
    }

    @Column(nullable = true)
    public Integer getKokonaisopiskelijamaara_1() {
        return kokonaisopiskelijamaara_1;
    }

    public void setKokonaisopiskelijamaara_1 (Integer kokonaisopiskelijamaara_1) {
        this.kokonaisopiskelijamaara_1 = kokonaisopiskelijamaara_1;
    }

    @Column(nullable = true)
    public Integer getKokonaisopiskelijamaara_2() {
        return kokonaisopiskelijamaara_2;
    }

    public void setKokonaisopiskelijamaara_2 (Integer kokonaisopiskelijamaara_2) {
        this.kokonaisopiskelijamaara_2 = kokonaisopiskelijamaara_2;
    }

    @Column(nullable = true)
    public Integer getErityisopiskelijamaara() {
        return erityisopiskelijamaara;
    }

    public void setErityisopiskelijamaara (Integer erityisopiskelijamaara) {
        this.erityisopiskelijamaara = erityisopiskelijamaara;
    }

    @Column(nullable = true)
    public Integer getErityisopiskelijamaara_1() {
        return erityisopiskelijamaara_1;
    }

    public void setErityisopiskelijamaara_1 (Integer erityisopiskelijamaara_1) {
        this.erityisopiskelijamaara_1 = erityisopiskelijamaara_1;
    }

    @Column(nullable = true)
    public Integer getErityisopiskelijamaara_2() {
        return erityisopiskelijamaara_2;
    }

    public void setErityisopiskelijamaara_2 (Integer erityisopiskelijamaara_2) {
        this.erityisopiskelijamaara_2 = erityisopiskelijamaara_2;
    }

    @Column(nullable = true)
    public Integer getSisaoppilaitosopiskelijamaara() {
        return sisaoppilaitosopiskelijamaara;
    }

    public void setSisaoppilaitosopiskelijamaara (Integer sisaoppilaitosopiskelijamaara) {
        this.sisaoppilaitosopiskelijamaara = sisaoppilaitosopiskelijamaara;
    }

    @Column(nullable = true)
    public Integer getSisaoppilaitosopiskelijamaara_1() {
        return sisaoppilaitosopiskelijamaara_1;
    }

    public void setSisaoppilaitosopiskelijamaara_1 (Integer sisaoppilaitosopiskelijamaara_1) {
        this.sisaoppilaitosopiskelijamaara_1 = sisaoppilaitosopiskelijamaara_1;
    }

    @Column(nullable = true)
    public Integer getSisaoppilaitosopiskelijamaara_2() {
        return sisaoppilaitosopiskelijamaara_2;
    }

    public void setSisaoppilaitosopiskelijamaara_2 (Integer sisaoppilaitosopiskelijamaara_2) {
        this.sisaoppilaitosopiskelijamaara_2 = sisaoppilaitosopiskelijamaara_2;
    }

    @Column(nullable = true)
    public String getOpetuskieli() {
        return opetuskieli;
    }

    public void setOpetuskieli(String opetuskieli) {
        this.opetuskieli = opetuskieli;
    }

    @Column(nullable = true)
    public Boolean getValma() {
        return valma;
    }

    public void setValma(Boolean valma) {
        this.valma = valma;
    }

    @Column(nullable = true)
    public Boolean getTutkintoonvalmistava_erityinen() {
        return tutkintoonvalmistava_erityinen;
    }

    public void setTutkintoonvalmistava_erityinen(Boolean tutkintoonvalmistava_erityinen) {
        this.tutkintoonvalmistava_erityinen = tutkintoonvalmistava_erityinen;
    }

    @Column(nullable = true)
    public Boolean getValma_erityinen() {
        return valma_erityinen;
    }

    public void setValma_erityinen(Boolean valma_erityinen) {
        this.valma_erityinen = valma_erityinen;
    }

    @Column(nullable = true)
    public Boolean getTelma_erityinen() {
        return telma_erityinen;
    }

    public void setTelma_erityinen(Boolean telma_erityinen) {
        this.telma_erityinen = telma_erityinen;
    }

    @Column(nullable = true)
    public Boolean getKehittamis_erityinen() {
        return kehittamis_erityinen;
    }

    public void setKehittamis_erityinen(Boolean kehittamis_erityinen) {
        this.kehittamis_erityinen = kehittamis_erityinen;
    }

    @Column(nullable = true)
    public Boolean getUrheilija() {
        return urheilija;
    }

    public void setUrheilija(Boolean urheilija) {
        this.urheilija = urheilija;
    }

    @Column(nullable = true)
    public Boolean getSisaoppilaitos() {
        return sisaoppilaitos;
    }

    public void setSisaoppilaitos(Boolean sisaoppilaitos) {
        this.sisaoppilaitos = sisaoppilaitos;
    }
}
