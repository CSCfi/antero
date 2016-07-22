package fi.csc.antero.odata.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import java.util.Date;

/**
 * Created by aheikkinen on 22/07/16.
 */
@Entity(name = "SA_KOULUTUSLUOKITUS")
public class SA_Koulutusluokitus {

    private Long id;
    private Date luotuaika;
    private String koodi;
    private String nimi;
    private String nimi_sv;
    private String nimi_en;
    private Date alkupvm;
    private Date loppupvm;
    private String koulutusaste2002koodi;
    private String koulutusaste2002nimi;
    private String koulutusaste2002nimi_sv;
    private String koulutusaste2002nimi_en;
    private String koulutusala2002koodi;
    private String koulutusala2002nimi;
    private String koulutusala2002nimi_sv;
    private String koulutusala2002nimi_en;
    private String opintoala2002koodi;
    private String opintoala2002nimi;
    private String opintoala2002nimi_sv;
    private String opintoala2002nimi_en;
    private String koulutusaste1995koodi;
    private String koulutusaste1995nimi;
    private String koulutusaste1995nimi_sv;
    private String koulutusaste1995nimi_en;
    private String koulutusala1995koodi;
    private String koulutusala1995nimi;
    private String koulutusala1995nimi_sv;
    private String koulutusala1995nimi_en;
    private String opintoala1995koodi;
    private String opintoala1995nimi;
    private String opintoala1995nimi_sv;
    private String opintoala1995nimi_en;
    private String tutkintokoodi;
    private String tutkintonimi;
    private String tutkintonimi_sv;
    private String tutkintonimi_en;
    private String tutkintotyyppikoodi;
    private String tutkintotyyppinimi;
    private String tutkintotyyppinimi_sv;
    private String tutkintotyyppinimi_en;
    private String koulutustyyppikoodi;
    private String koulutustyyppinimi;
    private String koulutustyyppinimi_sv;
    private String koulutustyyppinimi_en;
    private String isced2011koulutusastekoodi;
    private String isced2011koulutusastenimi;
    private String isced2011koulutusastenimi_sv;
    private String isced2011koulutusastenimi_en;
    private String isced2011koulutusastetaso1koodi;
    private String isced2011koulutusastetaso1nimi;
    private String isced2011koulutusastetaso1nimi_sv;
    private String isced2011koulutusastetaso1nimi_en;
    private String isced2011koulutusastetaso2koodi;
    private String isced2011koulutusastetaso2nimi;
    private String isced2011koulutusastetaso2nimi_sv;
    private String isced2011koulutusastetaso2nimi_en;
    private String isced2011koulutusalataso1koodi;
    private String isced2011koulutusalataso1nimi;
    private String isced2011koulutusalataso1nimi_sv;
    private String isced2011koulutusalataso1nimi_en;
    private String isced2011koulutusalataso2koodi;
    private String isced2011koulutusalataso2nimi;
    private String isced2011koulutusalataso2nimi_sv;
    private String isced2011koulutusalataso2nimi_en;
    private String isced2011koulutusalataso3koodi;
    private String isced2011koulutusalataso3nimi;
    private String isced2011koulutusalataso3nimi_sv;
    private String isced2011koulutusalataso3nimi_en;

    public SA_Koulutusluokitus() {}

    public SA_Koulutusluokitus(Long id) {
        this.id = id;
    }

    @Id
    @Column(nullable = false)
    public Long getid() {
        return this.id;
    }

    @Column(nullable = true)
    @Temporal(TemporalType.DATE)
    public Date getluotuaika() {
        return this.luotuaika;
    }

    @Column(nullable = false)
    @Size(max = 6)
    public String getkoodi() {
        return this.koodi;
    }

    @Column(nullable = false)
    @Size(max = 200)
    public String getnimi() {
        return this.nimi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getnimi_sv() {
        return this.nimi_sv;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getnimi_en() {
        return this.nimi_en;
    }

    @Column(nullable = true)
    @Temporal(TemporalType.DATE)
    public Date getalkupvm() {
        return this.alkupvm;
    }

    @Column(nullable = true)
    @Temporal(TemporalType.DATE)
    public Date getloppupvm() {
        return this.loppupvm;
    }

    @Column(nullable = true)
    @Size(max = 2)
    public String getkoulutusaste2002koodi() {
        return this.koulutusaste2002koodi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getkoulutusaste2002nimi() {
        return this.koulutusaste2002nimi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getkoulutusaste2002nimi_sv() {
        return this.koulutusaste2002nimi_sv;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getkoulutusaste2002nimi_en() {
        return this.koulutusaste2002nimi_en;
    }

    @Column(nullable = true)
    @Size(max = 3)
    public String getkoulutusala2002koodi() {
        return this.koulutusala2002koodi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getkoulutusala2002nimi() {
        return this.koulutusala2002nimi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getkoulutusala2002nimi_sv() {
        return this.koulutusala2002nimi_sv;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getkoulutusala2002nimi_en() {
        return this.koulutusala2002nimi_en;
    }

    @Column(nullable = true)
    @Size(max = 3)
    public String getopintoala2002koodi() {
        return this.opintoala2002koodi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getopintoala2002nimi() {
        return this.opintoala2002nimi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getopintoala2002nimi_sv() {
        return this.opintoala2002nimi_sv;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getopintoala2002nimi_en() {
        return this.opintoala2002nimi_en;
    }

    @Column(nullable = true)
    @Size(max = 2)
    public String getkoulutusaste1995koodi() {
        return this.koulutusaste1995koodi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getkoulutusaste1995nimi() {
        return this.koulutusaste1995nimi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getkoulutusaste1995nimi_sv() {
        return this.koulutusaste1995nimi_sv;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getkoulutusaste1995nimi_en() {
        return this.koulutusaste1995nimi_en;
    }

    @Column(nullable = true)
    @Size(max = 2)
    public String getkoulutusala1995koodi() {
        return this.koulutusala1995koodi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getkoulutusala1995nimi() {
        return this.koulutusala1995nimi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getkoulutusala1995nimi_sv() {
        return this.koulutusala1995nimi_sv;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getkoulutusala1995nimi_en() {
        return this.koulutusala1995nimi_en;
    }

    @Column(nullable = true)
    @Size(max = 2)
    public String getopintoala1995koodi() {
        return this.opintoala1995koodi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getopintoala1995nimi() {
        return this.opintoala1995nimi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getopintoala1995nimi_sv() {
        return this.opintoala1995nimi_sv;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getopintoala1995nimi_en() {
        return this.opintoala1995nimi_en;
    }

    @Column(nullable = true)
    @Size(max = 3)
    public String gettutkintokoodi() {
        return this.tutkintokoodi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String gettutkintonimi() {
        return this.tutkintonimi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String gettutkintonimi_sv() {
        return this.tutkintonimi_sv;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String gettutkintonimi_en() {
        return this.tutkintonimi_en;
    }

    @Column(nullable = true)
    @Size(max = 2)
    public String gettutkintotyyppikoodi() {
        return this.tutkintotyyppikoodi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String gettutkintotyyppinimi() {
        return this.tutkintotyyppinimi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String gettutkintotyyppinimi_sv() {
        return this.tutkintotyyppinimi_sv;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String gettutkintotyyppinimi_en() {
        return this.tutkintotyyppinimi_en;
    }

    @Column(nullable = true)
    @Size(max = 3)
    public String getkoulutustyyppikoodi() {
        return this.koulutustyyppikoodi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getkoulutustyyppinimi() {
        return this.koulutustyyppinimi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getkoulutustyyppinimi_sv() {
        return this.koulutustyyppinimi_sv;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getkoulutustyyppinimi_en() {
        return this.koulutustyyppinimi_en;
    }

    @Column(nullable = true)
    @Size(max = 2)
    public String getisced2011koulutusastekoodi() {
        return this.isced2011koulutusastekoodi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getisced2011koulutusastenimi() {
        return this.isced2011koulutusastenimi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getisced2011koulutusastenimi_sv() {
        return this.isced2011koulutusastenimi_sv;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getisced2011koulutusastenimi_en() {
        return this.isced2011koulutusastenimi_en;
    }

    @Column(nullable = true)
    @Size(max = 2)
    public String getisced2011koulutusastetaso1koodi() {
        return this.isced2011koulutusastetaso1koodi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getisced2011koulutusastetaso1nimi() {
        return this.isced2011koulutusastetaso1nimi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getisced2011koulutusastetaso1nimi_sv() {
        return this.isced2011koulutusastetaso1nimi_sv;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getisced2011koulutusastetaso1nimi_en() {
        return this.isced2011koulutusastetaso1nimi_en;
    }

    @Column(nullable = true)
    @Size(max = 2)
    public String getisced2011koulutusastetaso2koodi() {
        return this.isced2011koulutusastetaso2koodi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getisced2011koulutusastetaso2nimi() {
        return this.isced2011koulutusastetaso2nimi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getisced2011koulutusastetaso2nimi_sv() {
        return this.isced2011koulutusastetaso2nimi_sv;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getisced2011koulutusastetaso2nimi_en() {
        return this.isced2011koulutusastetaso2nimi_en;
    }

    @Column(nullable = true)
    @Size(max = 2)
    public String getisced2011koulutusalataso1koodi() {
        return this.isced2011koulutusalataso1koodi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getisced2011koulutusalataso1nimi() {
        return this.isced2011koulutusalataso1nimi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getisced2011koulutusalataso1nimi_sv() {
        return this.isced2011koulutusalataso1nimi_sv;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getisced2011koulutusalataso1nimi_en() {
        return this.isced2011koulutusalataso1nimi_en;
    }

    @Column(nullable = true)
    @Size(max = 3)
    public String getisced2011koulutusalataso2koodi() {
        return this.isced2011koulutusalataso2koodi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getisced2011koulutusalataso2nimi() {
        return this.isced2011koulutusalataso2nimi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getisced2011koulutusalataso2nimi_sv() {
        return this.isced2011koulutusalataso2nimi_sv;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getisced2011koulutusalataso2nimi_en() {
        return this.isced2011koulutusalataso2nimi_en;
    }

    @Column(nullable = true)
    @Size(max = 4)
    public String getisced2011koulutusalataso3koodi() {
        return this.isced2011koulutusalataso3koodi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getisced2011koulutusalataso3nimi() {
        return this.isced2011koulutusalataso3nimi;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getisced2011koulutusalataso3nimi_sv() {
        return this.isced2011koulutusalataso3nimi_sv;
    }

    @Column(nullable = true)
    @Size(max = 200)
    public String getisced2011koulutusalataso3nimi_en() {
        return this.isced2011koulutusalataso3nimi_en;
    }


    public void setId(Long id) {
        this.id = id;
    }

    public void setLuotuaika(Date luotuaika) {
        this.luotuaika = luotuaika;
    }

    public void setKoodi(String koodi) {
        this.koodi = koodi;
    }

    public void setNimi(String nimi) {
        this.nimi = nimi;
    }

    public void setNimi_sv(String nimi_sv) {
        this.nimi_sv = nimi_sv;
    }

    public void setNimi_en(String nimi_en) {
        this.nimi_en = nimi_en;
    }

    public void setAlkupvm(Date alkupvm) {
        this.alkupvm = alkupvm;
    }

    public void setLoppupvm(Date loppupvm) {
        this.loppupvm = loppupvm;
    }

    public void setKoulutusaste2002koodi(String koulutusaste2002koodi) {
        this.koulutusaste2002koodi = koulutusaste2002koodi;
    }

    public void setKoulutusaste2002nimi(String koulutusaste2002nimi) {
        this.koulutusaste2002nimi = koulutusaste2002nimi;
    }

    public void setKoulutusaste2002nimi_sv(String koulutusaste2002nimi_sv) {
        this.koulutusaste2002nimi_sv = koulutusaste2002nimi_sv;
    }

    public void setKoulutusaste2002nimi_en(String koulutusaste2002nimi_en) {
        this.koulutusaste2002nimi_en = koulutusaste2002nimi_en;
    }

    public void setKoulutusala2002koodi(String koulutusala2002koodi) {
        this.koulutusala2002koodi = koulutusala2002koodi;
    }

    public void setKoulutusala2002nimi(String koulutusala2002nimi) {
        this.koulutusala2002nimi = koulutusala2002nimi;
    }

    public void setKoulutusala2002nimi_sv(String koulutusala2002nimi_sv) {
        this.koulutusala2002nimi_sv = koulutusala2002nimi_sv;
    }

    public void setKoulutusala2002nimi_en(String koulutusala2002nimi_en) {
        this.koulutusala2002nimi_en = koulutusala2002nimi_en;
    }

    public void setOpintoala2002koodi(String opintoala2002koodi) {
        this.opintoala2002koodi = opintoala2002koodi;
    }

    public void setOpintoala2002nimi(String opintoala2002nimi) {
        this.opintoala2002nimi = opintoala2002nimi;
    }

    public void setOpintoala2002nimi_sv(String opintoala2002nimi_sv) {
        this.opintoala2002nimi_sv = opintoala2002nimi_sv;
    }

    public void setOpintoala2002nimi_en(String opintoala2002nimi_en) {
        this.opintoala2002nimi_en = opintoala2002nimi_en;
    }

    public void setKoulutusaste1995koodi(String koulutusaste1995koodi) {
        this.koulutusaste1995koodi = koulutusaste1995koodi;
    }

    public void setKoulutusaste1995nimi(String koulutusaste1995nimi) {
        this.koulutusaste1995nimi = koulutusaste1995nimi;
    }

    public void setKoulutusaste1995nimi_sv(String koulutusaste1995nimi_sv) {
        this.koulutusaste1995nimi_sv = koulutusaste1995nimi_sv;
    }

    public void setKoulutusaste1995nimi_en(String koulutusaste1995nimi_en) {
        this.koulutusaste1995nimi_en = koulutusaste1995nimi_en;
    }

    public void setKoulutusala1995koodi(String koulutusala1995koodi) {
        this.koulutusala1995koodi = koulutusala1995koodi;
    }

    public void setKoulutusala1995nimi(String koulutusala1995nimi) {
        this.koulutusala1995nimi = koulutusala1995nimi;
    }

    public void setKoulutusala1995nimi_sv(String koulutusala1995nimi_sv) {
        this.koulutusala1995nimi_sv = koulutusala1995nimi_sv;
    }

    public void setKoulutusala1995nimi_en(String koulutusala1995nimi_en) {
        this.koulutusala1995nimi_en = koulutusala1995nimi_en;
    }

    public void setOpintoala1995koodi(String opintoala1995koodi) {
        this.opintoala1995koodi = opintoala1995koodi;
    }

    public void setOpintoala1995nimi(String opintoala1995nimi) {
        this.opintoala1995nimi = opintoala1995nimi;
    }

    public void setOpintoala1995nimi_sv(String opintoala1995nimi_sv) {
        this.opintoala1995nimi_sv = opintoala1995nimi_sv;
    }

    public void setOpintoala1995nimi_en(String opintoala1995nimi_en) {
        this.opintoala1995nimi_en = opintoala1995nimi_en;
    }

    public void setTutkintokoodi(String tutkintokoodi) {
        this.tutkintokoodi = tutkintokoodi;
    }

    public void setTutkintonimi(String tutkintonimi) {
        this.tutkintonimi = tutkintonimi;
    }

    public void setTutkintonimi_sv(String tutkintonimi_sv) {
        this.tutkintonimi_sv = tutkintonimi_sv;
    }

    public void setTutkintonimi_en(String tutkintonimi_en) {
        this.tutkintonimi_en = tutkintonimi_en;
    }

    public void setTutkintotyyppikoodi(String tutkintotyyppikoodi) {
        this.tutkintotyyppikoodi = tutkintotyyppikoodi;
    }

    public void setTutkintotyyppinimi(String tutkintotyyppinimi) {
        this.tutkintotyyppinimi = tutkintotyyppinimi;
    }

    public void setTutkintotyyppinimi_sv(String tutkintotyyppinimi_sv) {
        this.tutkintotyyppinimi_sv = tutkintotyyppinimi_sv;
    }

    public void setTutkintotyyppinimi_en(String tutkintotyyppinimi_en) {
        this.tutkintotyyppinimi_en = tutkintotyyppinimi_en;
    }

    public void setKoulutustyyppikoodi(String koulutustyyppikoodi) {
        this.koulutustyyppikoodi = koulutustyyppikoodi;
    }

    public void setKoulutustyyppinimi(String koulutustyyppinimi) {
        this.koulutustyyppinimi = koulutustyyppinimi;
    }

    public void setKoulutustyyppinimi_sv(String koulutustyyppinimi_sv) {
        this.koulutustyyppinimi_sv = koulutustyyppinimi_sv;
    }

    public void setKoulutustyyppinimi_en(String koulutustyyppinimi_en) {
        this.koulutustyyppinimi_en = koulutustyyppinimi_en;
    }

    public void setIsced2011koulutusastekoodi(String isced2011koulutusastekoodi) {
        this.isced2011koulutusastekoodi = isced2011koulutusastekoodi;
    }

    public void setIsced2011koulutusastenimi(String isced2011koulutusastenimi) {
        this.isced2011koulutusastenimi = isced2011koulutusastenimi;
    }

    public void setIsced2011koulutusastenimi_sv(String isced2011koulutusastenimi_sv) {
        this.isced2011koulutusastenimi_sv = isced2011koulutusastenimi_sv;
    }

    public void setIsced2011koulutusastenimi_en(String isced2011koulutusastenimi_en) {
        this.isced2011koulutusastenimi_en = isced2011koulutusastenimi_en;
    }

    public void setIsced2011koulutusastetaso1koodi(String isced2011koulutusastetaso1koodi) {
        this.isced2011koulutusastetaso1koodi = isced2011koulutusastetaso1koodi;
    }

    public void setIsced2011koulutusastetaso1nimi(String isced2011koulutusastetaso1nimi) {
        this.isced2011koulutusastetaso1nimi = isced2011koulutusastetaso1nimi;
    }

    public void setIsced2011koulutusastetaso1nimi_sv(String isced2011koulutusastetaso1nimi_sv) {
        this.isced2011koulutusastetaso1nimi_sv = isced2011koulutusastetaso1nimi_sv;
    }

    public void setIsced2011koulutusastetaso1nimi_en(String isced2011koulutusastetaso1nimi_en) {
        this.isced2011koulutusastetaso1nimi_en = isced2011koulutusastetaso1nimi_en;
    }

    public void setIsced2011koulutusastetaso2koodi(String isced2011koulutusastetaso2koodi) {
        this.isced2011koulutusastetaso2koodi = isced2011koulutusastetaso2koodi;
    }

    public void setIsced2011koulutusastetaso2nimi(String isced2011koulutusastetaso2nimi) {
        this.isced2011koulutusastetaso2nimi = isced2011koulutusastetaso2nimi;
    }

    public void setIsced2011koulutusastetaso2nimi_sv(String isced2011koulutusastetaso2nimi_sv) {
        this.isced2011koulutusastetaso2nimi_sv = isced2011koulutusastetaso2nimi_sv;
    }

    public void setIsced2011koulutusastetaso2nimi_en(String isced2011koulutusastetaso2nimi_en) {
        this.isced2011koulutusastetaso2nimi_en = isced2011koulutusastetaso2nimi_en;
    }

    public void setIsced2011koulutusalataso1koodi(String isced2011koulutusalataso1koodi) {
        this.isced2011koulutusalataso1koodi = isced2011koulutusalataso1koodi;
    }

    public void setIsced2011koulutusalataso1nimi(String isced2011koulutusalataso1nimi) {
        this.isced2011koulutusalataso1nimi = isced2011koulutusalataso1nimi;
    }

    public void setIsced2011koulutusalataso1nimi_sv(String isced2011koulutusalataso1nimi_sv) {
        this.isced2011koulutusalataso1nimi_sv = isced2011koulutusalataso1nimi_sv;
    }

    public void setIsced2011koulutusalataso1nimi_en(String isced2011koulutusalataso1nimi_en) {
        this.isced2011koulutusalataso1nimi_en = isced2011koulutusalataso1nimi_en;
    }

    public void setIsced2011koulutusalataso2koodi(String isced2011koulutusalataso2koodi) {
        this.isced2011koulutusalataso2koodi = isced2011koulutusalataso2koodi;
    }

    public void setIsced2011koulutusalataso2nimi(String isced2011koulutusalataso2nimi) {
        this.isced2011koulutusalataso2nimi = isced2011koulutusalataso2nimi;
    }

    public void setIsced2011koulutusalataso2nimi_sv(String isced2011koulutusalataso2nimi_sv) {
        this.isced2011koulutusalataso2nimi_sv = isced2011koulutusalataso2nimi_sv;
    }

    public void setIsced2011koulutusalataso2nimi_en(String isced2011koulutusalataso2nimi_en) {
        this.isced2011koulutusalataso2nimi_en = isced2011koulutusalataso2nimi_en;
    }

    public void setIsced2011koulutusalataso3koodi(String isced2011koulutusalataso3koodi) {
        this.isced2011koulutusalataso3koodi = isced2011koulutusalataso3koodi;
    }

    public void setIsced2011koulutusalataso3nimi(String isced2011koulutusalataso3nimi) {
        this.isced2011koulutusalataso3nimi = isced2011koulutusalataso3nimi;
    }

    public void setIsced2011koulutusalataso3nimi_sv(String isced2011koulutusalataso3nimi_sv) {
        this.isced2011koulutusalataso3nimi_sv = isced2011koulutusalataso3nimi_sv;
    }

    public void setIsced2011koulutusalataso3nimi_en(String isced2011koulutusalataso3nimi_en) {
        this.isced2011koulutusalataso3nimi_en = isced2011koulutusalataso3nimi_en;
    }
}