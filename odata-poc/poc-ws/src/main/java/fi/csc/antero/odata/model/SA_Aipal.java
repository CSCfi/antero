package fi.csc.antero.odata.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import java.util.Date;

/**
 * SA_Aipal entity
 *
 * @author aki.heikkinen@arcusys.fi
 */
@Entity(name = "SA_AIPAL")
public class SA_Aipal {

    private Long vastausid;
    private Date vastausaika;
    private Short numerovalinta;
    private Short vaihtoehto;
    private String monivalintavaihtoehto;
    private Long kysymysid;
    private String kysymys_fi;
    private String kysymys_sv;
    private Long kysymysryhmaid;
    private String kysymysryhma_fi;
    private String kysymysryhma_sv;
    private String vastaustyyppi;
    private Long vastaajaid;
    private String rahoitusmuoto;
    private String tutkintotunnus;
    private String tutkinto_fi;
    private String tutkinto_sv;
    private String opintoalatunnus;
    private String opintoala_fi;
    private String opintoala_sv;
    private String suorituskieli;
    private String valmistavan_koulutuksen_jarjestaja;
    private String valmistavan_koulutuksen_jarjestaja_fi;
    private String valmistavan_koulutuksen_jarjestaja_sv;
    private String valmistavan_koulutuksen_oppilaitos;
    private String valmistavan_koulutuksen_oppilaitos_fi;
    private String valmistavan_koulutuksen_oppilaitos_sv;
    private Long kyselykertaid;
    private String kyselykerta;
    private Long kyselyid;
    private String kysely_fi;
    private String kysely_sv;
    private String koulutustoimija;
    private String koulutustoimija_fi;
    private String koulutustoimija_sv;

    public SA_Aipal() {}

    public SA_Aipal(Long vastausid) {
        this.vastausid = vastausid;
    }

    @Id
    @Column
    public Long getVastausid() {
        return vastausid;
    }

    public void setVastausid(Long vastausid) {
        this.vastausid = vastausid;
    }

    @Column(nullable = true)
    @Temporal(TemporalType.DATE)
    public Date getVastausaika() {
        return this.vastausaika;
    }

    public void setVastausaika(Date vastausaika) {
        this.vastausaika = vastausaika;
    }

    @Column(nullable = true)
    public Short getNumerovalinta() {
        return numerovalinta;
    }

    public void setNumerovalinta(Short numerovalinta) {
        this.numerovalinta = numerovalinta;
    }

    @Column(nullable = true)
    public Short getVaihtoehto() {
        return vaihtoehto;
    }

    public void setVaihtoehto(Short vaihtoehto) {
        this.vaihtoehto = vaihtoehto;
    }

    @Column(nullable = true)
    @Size(max = 500)
    public String getMonivalintavaihtoehto() {
        return monivalintavaihtoehto;
    }

    public void setMonivalintavaihtoehto(String monivalintavaihtoehto) {
        this.monivalintavaihtoehto = monivalintavaihtoehto;
    }

    @Column(nullable = true)
    public Long getKysymysid() {
        return kysymysid;
    }

    public void setKysymysid(Long kysymysid) {
        this.kysymysid = kysymysid;
    }

    @Column(nullable = true)
    @Size(max = 500)
    public String getKysymys_fi() {
        return kysymys_fi;
    }

    public void setKysymys_fi(String kysymys_fi) {
        this.kysymys_fi = kysymys_fi;
    }

    @Column(nullable = true)
    @Size(max = 500)
    public String getKysymys_sv() {
        return kysymys_sv;
    }

    public void setKysymys_sv(String kysymys_sv) {
        this.kysymys_sv = kysymys_sv;
    }

    @Column(nullable = true)
    public Long getKysymysryhmaid() {
        return kysymysryhmaid;
    }

    public void setKysymysryhmaid(Long kysymysryhmaid) {
        this.kysymysryhmaid = kysymysryhmaid;
    }

    @Column(nullable = true)
    @Size(max = 500)
    public String getKysymysryhma_fi() {
        return kysymysryhma_fi;
    }

    public void setKysymysryhma_fi(String kysymysryhma_fi) {
        this.kysymysryhma_fi = kysymysryhma_fi;
    }

    @Column(nullable = true)
    @Size(max = 500)
    public String getKysymysryhma_sv() {
        return kysymysryhma_sv;
    }

    public void setKysymysryhma_sv(String kysymysryhma_sv) {
        this.kysymysryhma_sv = kysymysryhma_sv;
    }

    @Column(nullable = true)
    @Size(max = 20)
    public String getVastaustyyppi() {
        return vastaustyyppi;
    }

    public void setVastaustyyppi(String vastaustyyppi) {
        this.vastaustyyppi = vastaustyyppi;
    }

    @Column(nullable = true)
    public Long getVastaajaid() {
        return vastaajaid;
    }

    public void setVastaajaid(Long vastaajaid) {
        this.vastaajaid = vastaajaid;
    }

    @Column(nullable = true)
    @Size(max = 20)
    public String getRahoitusmuoto() {
        return rahoitusmuoto;
    }

    public void setRahoitusmuoto(String rahoitusmuoto) {
        this.rahoitusmuoto = rahoitusmuoto;
    }

    @Column(nullable = true)
    @Size(max = 20)
    public String getTutkintotunnus() {
        return tutkintotunnus;
    }

    public void setTutkintotunnus(String tutkintotunnus) {
        this.tutkintotunnus = tutkintotunnus;
    }

    @Column(nullable = true)
    @Size(max = 500)
    public String getTutkinto_fi() {
        return tutkinto_fi;
    }

    public void setTutkinto_fi(String tutkinto_fi) {
        this.tutkinto_fi = tutkinto_fi;
    }

    @Column(nullable = true)
    @Size(max = 500)
    public String getTutkinto_sv() {
        return tutkinto_sv;
    }

    public void setTutkinto_sv(String tutkinto_sv) {
        this.tutkinto_sv = tutkinto_sv;
    }

    @Column(nullable = true)
    @Size(max = 20)
    public String getOpintoalatunnus() {
        return opintoalatunnus;
    }

    public void setOpintoalatunnus(String opintoalatunnus) {
        this.opintoalatunnus = opintoalatunnus;
    }

    @Column(nullable = true)
    @Size(max = 500)
    public String getOpintoala_fi() {
        return opintoala_fi;
    }

    public void setOpintoala_fi(String opintoala_fi) {
        this.opintoala_fi = opintoala_fi;
    }

    @Column(nullable = true)
    @Size(max = 500)
    public String getOpintoala_sv() {
        return opintoala_sv;
    }

    public void setOpintoala_sv(String opintoala_sv) {
        this.opintoala_sv = opintoala_sv;
    }

    @Column(nullable = true)
    @Size(max = 20)
    public String getSuorituskieli() {
        return suorituskieli;
    }

    public void setSuorituskieli(String suorituskieli) {
        this.suorituskieli = suorituskieli;
    }

    @Column(nullable = true)
    @Size(max = 20)
    public String getValmistavan_koulutuksen_jarjestaja() {
        return valmistavan_koulutuksen_jarjestaja;
    }

    public void setValmistavan_koulutuksen_jarjestaja(String valmistavan_koulutuksen_jarjestaja) {
        this.valmistavan_koulutuksen_jarjestaja = valmistavan_koulutuksen_jarjestaja;
    }

    @Column(nullable = true)
    @Size(max = 500)
    public String getValmistavan_koulutuksen_jarjestaja_fi() {
        return valmistavan_koulutuksen_jarjestaja_fi;
    }

    public void setValmistavan_koulutuksen_jarjestaja_fi(String valmistavan_koulutuksen_jarjestaja_fi) {
        this.valmistavan_koulutuksen_jarjestaja_fi = valmistavan_koulutuksen_jarjestaja_fi;
    }

    @Column(nullable = true)
    @Size(max = 500)
    public String getValmistavan_koulutuksen_jarjestaja_sv() {
        return valmistavan_koulutuksen_jarjestaja_sv;
    }

    public void setValmistavan_koulutuksen_jarjestaja_sv(String valmistavan_koulutuksen_jarjestaja_sv) {
        this.valmistavan_koulutuksen_jarjestaja_sv = valmistavan_koulutuksen_jarjestaja_sv;
    }

    @Column(nullable = true)
    @Size(max = 20)
    public String getValmistavan_koulutuksen_oppilaitos() {
        return valmistavan_koulutuksen_oppilaitos;
    }

    public void setValmistavan_koulutuksen_oppilaitos(String valmistavan_koulutuksen_oppilaitos) {
        this.valmistavan_koulutuksen_oppilaitos = valmistavan_koulutuksen_oppilaitos;
    }

    @Column(nullable = true)
    @Size(max = 500)
    public String getValmistavan_koulutuksen_oppilaitos_fi() {
        return valmistavan_koulutuksen_oppilaitos_fi;
    }

    public void setValmistavan_koulutuksen_oppilaitos_fi(String valmistavan_koulutuksen_oppilaitos_fi) {
        this.valmistavan_koulutuksen_oppilaitos_fi = valmistavan_koulutuksen_oppilaitos_fi;
    }

    @Column(nullable = true)
    @Size(max = 500)
    public String getValmistavan_koulutuksen_oppilaitos_sv() {
        return valmistavan_koulutuksen_oppilaitos_sv;
    }

    public void setValmistavan_koulutuksen_oppilaitos_sv(String valmistavan_koulutuksen_oppilaitos_sv) {
        this.valmistavan_koulutuksen_oppilaitos_sv = valmistavan_koulutuksen_oppilaitos_sv;
    }

    @Column(nullable = true)
    public Long getKyselykertaid() {
        return kyselykertaid;
    }

    public void setKyselykertaid(Long kyselykertaid) {
        this.kyselykertaid = kyselykertaid;
    }

    @Column(nullable = true)
    @Size(max = 500)
    public String getKyselykerta() {
        return kyselykerta;
    }

    public void setKyselykerta(String kyselykerta) {
        this.kyselykerta = kyselykerta;
    }

    @Column(nullable = true)
    public Long getKyselyid() {
        return kyselyid;
    }

    public void setKyselyid(Long kyselyid) {
        this.kyselyid = kyselyid;
    }

    @Column(nullable = true)
    @Size(max = 500)
    public String getKysely_fi() {
        return kysely_fi;
    }

    public void setKysely_fi(String kysely_fi) {
        this.kysely_fi = kysely_fi;
    }

    @Column(nullable = true)
    @Size(max = 500)
    public String getKysely_sv() {
        return kysely_sv;
    }

    public void setKysely_sv(String kysely_sv) {
        this.kysely_sv = kysely_sv;
    }

    @Column(nullable = true)
    @Size(max = 20)
    public String getKoulutustoimija() {
        return koulutustoimija;
    }

    public void setKoulutustoimija(String koulutustoimija) {
        this.koulutustoimija = koulutustoimija;
    }

    @Column(nullable = true)
    @Size(max = 500)
    public String getKoulutustoimija_fi() {
        return koulutustoimija_fi;
    }

    public void setKoulutustoimija_fi(String koulutustoimija_fi) {
        this.koulutustoimija_fi = koulutustoimija_fi;
    }

    @Column(nullable = true)
    @Size(max = 500)
    public String getKoulutustoimija_sv() {
        return koulutustoimija_sv;
    }

    public void setKoulutustoimija_sv(String koulutustoimija_sv) {
        this.koulutustoimija_sv = koulutustoimija_sv;
    }
}