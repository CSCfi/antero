using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Data.Sql;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;
using System.Data.SqlClient;
using System.Runtime.InteropServices;
using System.Timers;
using System.Threading.Tasks;

namespace AloittaneidenLapaisyCSharp
{
    public class Laskenta
    {
        //' Lähtödatan sarakeryhmien lukumäärä

        int SarakeryhmienLkm = 55;
        //'
        //' Laskennan SQL-koodi
        //'

        public void LaskeTiivistetytRivit(string dbYhteysOsoite, bool JatkaLaskentaa)
        {
            // Kirjaa ylös laskennan alkuaika
            Stopwatch totalElapsedTime = new Stopwatch();

            // Tiivistetyn sarakemuodon sarakkeet
            string[] tiivistetyt = new string[13];
            tiivistetyt[0] = "opp";
            tiivistetyt[1] = "opmala";
            tiivistetyt[2] = "opmopa";
            tiivistetyt[3] = "opmast";
            tiivistetyt[4] = "opm95opa";
            tiivistetyt[5] = "koulutussektori";
            tiivistetyt[6] = "kalat1"; //tiivistetyt[9] = "olotamm";
            tiivistetyt[7] = "kalat2"; //tiivistetyt[10] = "olosyys";
            tiivistetyt[8] = "kalat3"; //tiivistetyt[12] = "amas";
            tiivistetyt[9] = "suorv";
            tiivistetyt[10] = "suorlk";
            tiivistetyt[11] = "kmaak";
            tiivistetyt[12] = "ptoim1r5";

            // Aineistossa esiintyvät tutkintolajit, ml. kaatoluokat
            string[] Tutkintolajit = new string[10];
            Tutkintolajit[0] = "lu";
            Tutkintolajit[1] = "ampt";
            Tutkintolajit[2] = "amlk";
            Tutkintolajit[3] = "muukk";
            Tutkintolajit[4] = "amk";
            Tutkintolajit[5] = "ylamk";
            Tutkintolajit[6] = "alkk";
            Tutkintolajit[7] = "ylkk";
            Tutkintolajit[8] = "tk";
            Tutkintolajit[9] = "muuta";

            // Avaa tietokantayhteydet kyselyä ja inserttiä varten
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = dbYhteysOsoite;

            SqlConnection insertConn = new SqlConnection();
            insertConn.ConnectionString = dbYhteysOsoite;
            int rivinumero = -1;
            long rivilaskuri = 0;

            Stopwatch stopWatch = new Stopwatch();
            try
            {
                conn.Open();
                insertConn.Open();

                SqlCommand countcmd = default(SqlCommand);

                Console.WriteLine("Haetaan ensin käsiteltävien rivien määrä...");
                if (JatkaLaskentaa)
                {
                    countcmd = new SqlCommand("SELECT COUNT(*) FROM VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty WHERE rivinumero NOT IN (SELECT rivinumero FROM VipunenTK_DW.dbo._aloittaneiden_lapaisy_lasketut_sarakkeet)", conn);
                }
                else
                {
                    countcmd = new SqlCommand("SELECT COUNT(*) FROM VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty", conn);
                }
                countcmd.CommandTimeout = 0;
                int rivicount = (int)countcmd.ExecuteScalar();

                totalElapsedTime.Start();
                // Aloita käsittelemään rivi kerrallaan
                if (JatkaLaskentaa)
                {
                    Console.WriteLine("Jatketaan laskentaa...");
                }
                else
                {
                    Console.WriteLine("Aloitetaan laskenta...");
                }

                // Hae lähtötaulun rivit
                SqlCommand command = default(SqlCommand);
                if (JatkaLaskentaa)
                {
                    command = new SqlCommand("SELECT * FROM VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty WHERE rivinumero NOT IN (SELECT rivinumero FROM VipunenTK_DW.dbo._aloittaneiden_lapaisy_lasketut_sarakkeet)", conn);
                }
                else
                {
                    command = new SqlCommand("SELECT * FROM VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty", conn);
                }
                command.CommandTimeout = 0;
                //poista timeout kokonaan
                SqlDataReader reader = default(SqlDataReader);
                reader = command.ExecuteReader();
                DataTable dt = fillDataTable(dbYhteysOsoite);

                using (reader)
                {

                    while (reader.Read())
                    {
                        if (rivilaskuri == 0)
                            stopWatch.Start();
                        // Raportoi etenemisestä silloin tällöin
                        rivinumero = reader.GetInt32(reader.GetOrdinal("rivinumero"));
                        rivilaskuri = rivilaskuri + 1;
                        if (rivilaskuri % 1000 == 0)
                        {
                            double pros = Math.Round((float)rivilaskuri / rivicount * 100, 2, MidpointRounding.AwayFromZero);
                            long nopeus = stopWatch.ElapsedMilliseconds == 0 ? 0 : 1000000 / stopWatch.ElapsedMilliseconds;
                            long nopeuska = totalElapsedTime.ElapsedMilliseconds / 1000 == 0 ? 0 : rivilaskuri / (totalElapsedTime.ElapsedMilliseconds / 1000);
                            if (rivilaskuri != 0)
                                Console.WriteLine("Lasketaan riviä " + string.Format("{0:n0}", rivilaskuri) + " / " + string.Format("{0:n0}", rivicount) +  " (" + pros + " %), nopeus " + string.Format("{0:n0}", nopeus) + " (" + string.Format("{0:n0}", nopeuska) + ") r/s");
                            stopWatch.Restart();

                            if (rivilaskuri % 25000 == 0)
                            {
                                TimeSpan jaljella = TimeSpan.FromSeconds((rivicount - rivilaskuri) / nopeuska);
                                Console.WriteLine("Aikaa kulunut " + totalElapsedTime.Elapsed + ", jäljellä ka:n perusteella " + jaljella.ToString() + ".");
                            }
                        }
                            // Kopioi tavalliset rivin arvot
                            Dictionary<string, string> arvot = new Dictionary<string, string>();
                        for (int i = 0; i <= (reader.FieldCount - 1); i++)
                        {
                            if (reader.GetName(i).StartsWith("Sarakeryhma"))
                            {
                                break;
                            }
                            else if (reader.IsDBNull(i))
                            {
                                arvot.Add(reader.GetName(i), "null");
                            }
                            else if (reader.GetProviderSpecificFieldType(i).Equals(typeof(SqlDecimal)))
                            {
                                arvot.Add(reader.GetName(i), reader.GetDecimal(i).ToString());
                            }
                            else if (reader.GetProviderSpecificFieldType(i).Equals(typeof(SqlInt32)))
                            {
                                arvot.Add(reader.GetName(i), reader.GetInt32(i).ToString());
                            }
                            else if (reader.GetProviderSpecificFieldType(i).Equals(typeof(SqlString)))
                            {
                                arvot.Add(reader.GetName(i), reader.GetString(i));
                            }
                            else
                            {
                                throw new Exception("Sarakkeen SQL-tyyppiä ei pystytä käsittelemään: " + reader.GetName(i));
                            }
                        }

                        // Pura auki tiivistetyt sarakeryhmät

                        for (int i = 1; i <= SarakeryhmienLkm; i++)
                        {
                            if (!reader.IsDBNull(reader.GetOrdinal("Sarakeryhma" + i + "_ID")))
                            {
                                string id = reader.GetString(reader.GetOrdinal("Sarakeryhma" + i + "_ID"));
                                string vuosi = id.Substring(id.Length - 4);
                                string tutkintolaji = reader.GetString(reader.GetOrdinal("Sarakeryhma" + i + "_tutkintolaji"));
                                string tyyppi = reader.GetString(reader.GetOrdinal("Sarakeryhma" + i + "_tyyppi"));

                                // Poimi vain ne arvot, jotka kuuluvat ko. seurantatiedon tyyppiin
                                string sarakeryhma = "Sarakeryhma" + i;
                                if (tyyppi == "sijoittuminen")
                                {
                                    arvot.Add("ptoim1r5_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_ptoim1r5")));
                                    // amas ei käytössä / jsyrjala 3.11.2020
									// arvot.Add("amas_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_amas")));
                                }
                                else if (tyyppi == "opiskelu")
                                {
                                    arvot.Add(tutkintolaji + "opiskkoulk_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_koulk")));
                                    arvot.Add(tutkintolaji + "opiskopmala_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_opmala")));
                                    arvot.Add(tutkintolaji + "opiskopmopa_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_opmopa")));
                                    arvot.Add(tutkintolaji + "opiskopmast_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_opmast")));
                                    arvot.Add(tutkintolaji + "opiskopm95opa_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_opm95opa")));
                                    arvot.Add(tutkintolaji + "opiskkoulutussektori_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_koulutussektori")));
                                    arvot.Add(tutkintolaji + "opiskkalat1_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_kalat1")));
                                    arvot.Add(tutkintolaji + "opiskkalat2_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_kalat2")));
                                    arvot.Add(tutkintolaji + "opiskkalat3_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_kalat3")));
                                    arvot.Add(tutkintolaji + "opiskjarj_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_jarj")));
                                    arvot.Add(tutkintolaji + "opiskopp_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_opp")));
                                    arvot.Add(tutkintolaji + "kmaak_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_kmaak")));
                                    // tutkinto
                                }
                                else
                                {
                                    arvot.Add(tutkintolaji + "suorv_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_suorv")));
                                    arvot.Add(tutkintolaji + "suorlk_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_suorlk")));
                                    arvot.Add(tutkintolaji + "tutkmaak_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_kmaak")));
                                    arvot.Add(tutkintolaji + "tutkjarj_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_jarj")));
                                    arvot.Add(tutkintolaji + "tutkopp_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_opp")));
                                    arvot.Add(tutkintolaji + "tutkkoulk_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_koulk")));
                                    arvot.Add(tutkintolaji + "tutkopmala_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_opmala")));
                                    arvot.Add(tutkintolaji + "tutkopmopa_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_opmopa")));
                                    arvot.Add(tutkintolaji + "tutkopmast_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_opmast")));
                                    arvot.Add(tutkintolaji + "tutkopm95opa_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_opm95opa")));
                                    arvot.Add(tutkintolaji + "tutkkoulutussektori_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_koulutussektori")));
                                    arvot.Add(tutkintolaji + "tutkkalat1_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_kalat1")));
                                    arvot.Add(tutkintolaji + "tutkkalat2_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_kalat2")));
                                    arvot.Add(tutkintolaji + "tutkkalat3_" + vuosi, reader.GetString(reader.GetOrdinal(sarakeryhma + "_kalat3")));
                                }
                            }
                        }

                        // Suorita itse päättely
                        Dictionary<string, string> muutokset = Laske_johdetut_muuttujat(ref arvot, false);

                        // Inserttaa päättelyn palauttamat arvot uudeksi riviksi tulostauluun (jos palautti)

                        if (muutokset.Count > 0)
                        {
                            DataRow dr = dt.NewRow();
                            dr["rivinumero"] = Convert.ToString(rivinumero);
                            foreach (KeyValuePair<string, string> kvp in muutokset)
                            {
                                dr[kvp.Key] = kvp.Value;
                            }
                            dt.Rows.Add(dr);
                            /*string sarakePätkä = "rivinumero";
                            string arvoPätkä = Convert.ToString(rivinumero);
                            foreach (string muutosAvain in muutokset.Keys)
                            {
                                sarakePätkä = sarakePätkä + ", [" + muutosAvain + "]";
                                arvoPätkä = arvoPätkä + ", " + muutokset[muutosAvain];
                            }
                            string insertLause = "INSERT INTO VipunenTK_DW.dbo._aloittaneiden_lapaisy_lasketut_sarakkeet (" + sarakePätkä + ") VALUES (" + arvoPätkä + ")";
                            SqlCommand insertCommand = new SqlCommand(insertLause, insertConn);
                            insertCommand.CommandTimeout = 0;

                            insertCommand.ExecuteNonQuery();*/
                        }

                        if (rivilaskuri % 100000 == 0)
                        {
                            /*DataTable dt2 = dt.Copy();
                            dt.Clear();*/
                            new Task(() => { BulkInsertoiRivit(insertConn, dt); }).Start();
                            //BulkInsertoiRivit(insertConn, dt);
                            dt = fillDataTable(dbYhteysOsoite);
                        }
                    }
                }
                
                if (dt.Rows.Count > 0)
                    BulkInsertoiRivit(insertConn, dt);

                System.Threading.Thread.Sleep(7000);
                Console.WriteLine("Laskenta suoritettu onnistuneesti.");

            }
            catch (Exception ex)
            {
                Console.WriteLine("Virheellinen rivi: " + rivinumero);
                Console.WriteLine("Virhe: " + ex.ToString());

            }
            finally
            {
                conn.Close();
                insertConn.Close();

            }

            totalElapsedTime.Stop();
            Console.WriteLine("Ajoaika: " + totalElapsedTime.Elapsed);

        }

        private void BulkInsertoiRivit(SqlConnection insertConn, DataTable dt)
        {
            using (SqlBulkCopy bulkCopy = new SqlBulkCopy(insertConn))
            {
                bulkCopy.DestinationTableName = "VipunenTK_DW.dbo._aloittaneiden_lapaisy_lasketut_sarakkeet";

                Stopwatch sw = new Stopwatch();
                sw.Start();
                Console.WriteLine("Kirjoitetaan lasketut rivit kantaan...");
                // Write from the source to the destination.
                bulkCopy.WriteToServer(dt);
                dt.Clear();
                Console.WriteLine("Kirjoitettiin rivit kantaan, kesto " + sw.Elapsed + ".");
            }
        }

        //'
        //' Varsinainen laskentalogiikka, eli funktio, joka toteuttaa johdettujen luokittelumuuttujien laskennan.
        //' Funktiota kutsutaan kerran jokaista laskettavaa riviä kohden.
        //'
        //' Käsittelyn perusrakenne:
        //'
        //' JOKAISELLE TAULUN RIVILLE 
        //'   LASKE RIVIKOHTAISIA APUMUUTTUJIA
        //'   KÄY LÄPI SEURANTAMERKINNÄT (TYYPEITTÄIN, KOULUTUSLAJEITTAIN JA VUOSITTAIN):
        //'     JOS MERKINTÄ PERIODIN SISÄLLÄ
        //'       LISÄÄ MERKINTÄKERÄIMEEN
        //'   LUO JOUKKO BOOLEAN-LIPPUJA, JOTKA KUVAAVAT RIVIÄ. ALUSTA NE ARVOON false.
        //'   KÄY LÄPI MERKINTÄKERÄIMEN MERKINNÄT
        //'     TULKITSE MERKINTÄ JA NOSTA TARVITTAVAT LIPUT YLÖS (true)
        //'   PÄÄTTELE TARVITTAVAT LUOKAT PRIORISOINTIEN MUKAISESSA JÄRJESTYKSESSÄ
        //'     PÄÄTTELYSSÄ NOJATAAN SUORAAN EDELLÄ LASKETTUIHIN LIPPUIHIN
        //'   PALAUTA RIVIN LUOKITTELUT FUNKTION KUTSUJALLE
        //'
        public Dictionary<string, string> Laske_johdetut_muuttujat(ref Dictionary<string, string> Arvot, bool Debug)
        {

            //'
            //' Määrittele laskennassa käytettävät vakiot
            //'
            string[] Tutkintolajit = new string[10];
            Tutkintolajit[0] = "lu";
            Tutkintolajit[1] = "ampt";
            Tutkintolajit[2] = "amlk";
            Tutkintolajit[3] = "muukk";
            Tutkintolajit[4] = "amk";
            Tutkintolajit[5] = "ylamk";
            Tutkintolajit[6] = "alkk";
            Tutkintolajit[7] = "ylkk";
            Tutkintolajit[8] = "tk";
            Tutkintolajit[9] = "muuta";

            //'
            //' Määritetään dictionary, johon lopullinen tulokset kerätään
            //'
            Dictionary<string, string> Paivitykset = new Dictionary<string, string>();

            //'
            //' Määritetään lukumäärä, jota tämä rivi vastaa
            //'
            string lkm = Arvot["lkm_int"];

            //'
            //' Määritetään periodin alkuhetki ja loppuhetki
            //'
            string lahde = Arvot["lahde"];
            decimal Aloittamisvuosi = default(decimal);
            int Aloittamislukukausi = 0;
            if (lahde == "41" | lahde == "51")
            {
                Aloittamisvuosi = Convert.ToDecimal(Arvot["alvv_kk"]);
                Aloittamislukukausi = Convert.ToInt32(Arvot["allk_kk"]);
            }
            else
            {
                Aloittamisvuosi = Convert.ToDecimal(Arvot["alvv"]);
                Aloittamislukukausi = Convert.ToInt32(Arvot["allk"]);
            }
            decimal Periodin_alkuhetki = default(decimal);
            if (Aloittamislukukausi == 1)
            {
                Periodin_alkuhetki = Aloittamisvuosi;
                // kevätlukukausi
            }
            else
            {
                Periodin_alkuhetki = Aloittamisvuosi + Convert.ToDecimal(0.5);
                // syyslukukausi
            }
            decimal Periodin_loppuhetki = default(decimal);
            Periodin_loppuhetki = Periodin_alkuhetki + Convert.ToDecimal(Arvot["tarkasteluperiodi"]) - Convert.ToDecimal(0.5);

            //'
            //' Kerätään merkinnät periodin ajalta
            //' Tätä varten luodaan keräin (collector), johon täydennetään löydettyjä merkintöjä merkintätyyppi kerrallaan
            List<Dictionary<string, string>> MerkintaKerain = new List<Dictionary<string, string>>();
            bool OnAloittanutOpiskelun = false;

            // Mennään läpi periodiin osuvat tasavuodet

            for (int Vuosi = Convert.ToInt32(Math.Floor(Periodin_alkuhetki)); Vuosi <= Convert.ToInt32(Math.Floor(Periodin_loppuhetki)); Vuosi++)
            {
                // Kerätään tutkintojen suoritukset
                foreach (string TutkintolajiIter1 in Tutkintolajit)
                {

                    if (Arvot.ContainsKey(TutkintolajiIter1 + "suorv_" + Vuosi))
                    {
                        // Tarkista, ollaanko periodin reunoilla
                        decimal TutkinnonSuoritushetki = default(decimal);
                        if (Arvot[TutkintolajiIter1 + "suorlk_" + Vuosi] == "1")
                        {
                            TutkinnonSuoritushetki = Convert.ToDecimal(Vuosi);
                            // kevätlukukausi
                        }
                        else
                        {
                            TutkinnonSuoritushetki = Convert.ToDecimal(Vuosi) + Convert.ToDecimal(0.5);
                            // syyslukukausi
                        }


                        if (Periodin_alkuhetki <= TutkinnonSuoritushetki & TutkinnonSuoritushetki <= Periodin_loppuhetki)
                        {
                            // Löydetty tutkinto, kerää se ja kirjaa samalla tiedot palautettavaksi oheistiedoksi
                            Dictionary<string, string> TutkinnonTiedot = new Dictionary<string, string>();
                            TutkinnonTiedot.Add("merktyyppi", "tutkinto");
                            TutkinnonTiedot.Add("tutkintolaji", TutkintolajiIter1);
                            TutkinnonTiedot.Add("suorv", Arvot[TutkintolajiIter1 + "suorv_" + Vuosi]);
                            Paivitykset["saavutettu_suorv"] = Arvot[TutkintolajiIter1 + "suorv_" + Vuosi] ;
                            TutkinnonTiedot.Add("suorlk", Arvot[TutkintolajiIter1 + "suorlk_" + Vuosi]);
                            Paivitykset["saavutettu_suorlk"] = Arvot[TutkintolajiIter1 + "suorlk_" + Vuosi] ;
                            TutkinnonTiedot.Add("tutkmaak", Arvot[TutkintolajiIter1 + "tutkmaak_" + Vuosi]);
                            Paivitykset["saavutettu_tutkmaak"] = Arvot[TutkintolajiIter1 + "tutkmaak_" + Vuosi] ;
                            TutkinnonTiedot.Add("tutkjarj", Arvot[TutkintolajiIter1 + "tutkjarj_" + Vuosi]);
                            Paivitykset["saavutettu_tutkjarj"] = Arvot[TutkintolajiIter1 + "tutkjarj_" + Vuosi] ;
                            TutkinnonTiedot.Add("tutkopp", Arvot[TutkintolajiIter1 + "tutkopp_" + Vuosi]);
                            Paivitykset["saavutettu_tutkopp"] = Arvot[TutkintolajiIter1 + "tutkopp_" + Vuosi] ;
                            TutkinnonTiedot.Add("tutkkoulk", Arvot[TutkintolajiIter1 + "tutkkoulk_" + Vuosi]);
                            Paivitykset["saavutettu_tutkkoulk"] = Arvot[TutkintolajiIter1 + "tutkkoulk_" + Vuosi] ;
                            TutkinnonTiedot.Add("tutkopmala", Arvot[TutkintolajiIter1 + "tutkopmala_" + Vuosi]);
                            //Paivitykset["saavutettu_tutkopmala"] = Arvot[TutkintolajiIter1 + "tutkopmala_" + Vuosi] ;
                            TutkinnonTiedot.Add("tutkopmopa", Arvot[TutkintolajiIter1 + "tutkopmopa_" + Vuosi]);
                            //Paivitykset["saavutettu_tutkopmopa"] = Arvot[TutkintolajiIter1 + "tutkopmopa_" + Vuosi] ;
                            TutkinnonTiedot.Add("tutkopmast", Arvot[TutkintolajiIter1 + "tutkopmast_" + Vuosi]);
                            //Paivitykset["saavutettu_tutkopmast"] = Arvot[TutkintolajiIter1 + "tutkopmast_" + Vuosi] ;
                            TutkinnonTiedot.Add("tutkopm95opa", Arvot[TutkintolajiIter1 + "tutkopm95opa_" + Vuosi]);
                            //Paivitykset["saavutettu_tutkopm95opa"] = Arvot[TutkintolajiIter1 + "tutkopm95opa_" + Vuosi] ;
                            TutkinnonTiedot.Add("tutkkoulutussektori", Arvot[TutkintolajiIter1 + "tutkkoulutussektori_" + Vuosi]);
                            Paivitykset["saavutettu_tutkkoulutussektori"] = Arvot[TutkintolajiIter1 + "tutkkoulutussektori_" + Vuosi];
                            TutkinnonTiedot.Add("tutkkalat1", Arvot[TutkintolajiIter1 + "tutkkalat1_" + Vuosi]);
                            //Paivitykset["saavutettu_tutkkalat1"] = Arvot[TutkintolajiIter1 + "tutkkalat1_" + Vuosi];
                            TutkinnonTiedot.Add("tutkkalat2", Arvot[TutkintolajiIter1 + "tutkkalat2_" + Vuosi]);
                            //Paivitykset["saavutettu_tutkkalat2"] = Arvot[TutkintolajiIter1 + "tutkkalat2_" + Vuosi];
                            TutkinnonTiedot.Add("tutkkalat3", Arvot[TutkintolajiIter1 + "tutkkalat3_" + Vuosi]);
                            //Paivitykset["saavutettu_tutkkalat3"] = Arvot[TutkintolajiIter1 + "tutkkalat3_" + Vuosi];

                            MerkintaKerain.Add(TutkinnonTiedot);

                            if (Debug)
                            {
                                Paivitykset.Add("debug_periodissa_tutkinto", Convert.ToString(Vuosi));
                            }

                        }
                    }
                }

                // Kerätään opiskelut
                foreach (string TutkintolajiIter2 in Tutkintolajit)
                {

                    if (Arvot.ContainsKey(TutkintolajiIter2 + "opiskkoulk_" + Vuosi))
                    {
                        // Katso, tulkitaanko merkintä opiskelun aloittamiseksi (aloittaminen tark. neljän ensimmäinen lukukauden aikana ainakin kerran läsnäolevaksi ilm.)
                        decimal OpiskelunSuoritushetki = Convert.ToDecimal(Vuosi) + Convert.ToDecimal(0.5);
                        // suoritushetki aina syyslukukausi
                        if (Periodin_alkuhetki <= OpiskelunSuoritushetki & OpiskelunSuoritushetki <= (Periodin_alkuhetki + Convert.ToDecimal(1.5)))
                        {
                            OnAloittanutOpiskelun = true;
                        }
								
						// yksinkertaistettu; keväällä katsotaan edellistä syksyä  / jsyrjala 3.11.2020					
					/*
                        // Laske periodi (opiskelumerkinnöille on oma tulkinta, jossa vain 
                        // periodin lopussa voimassa oleva merkintä hyväksytään)
                        decimal Opiskelu_Periodin_alkuhetki = default(decimal);
                        if ((Periodin_loppuhetki % 1) == Convert.ToDecimal(0))
                        {
                            // kevätlukukausi (loppuhetki X.0), syyslukukauden merkintä pätee ((X-1).5)
                            Opiskelu_Periodin_alkuhetki = Periodin_loppuhetki - Convert.ToDecimal(0.5);
                        }
                        else
                        {
                            // syyslukukausi (loppuhetki X.5), vaaditaan merkintä samalta hetkeltä
                            Opiskelu_Periodin_alkuhetki = Periodin_loppuhetki;
                        }
					*/
					
                        // Tarkasta osutaanko periodiin
						
                        // if (Opiskelu_Periodin_alkuhetki <= OpiskelunSuoritushetki & OpiskelunSuoritushetki <= Periodin_loppuhetki)
						if (Periodin_loppuhetki - Convert.ToDecimal(0.5) <= OpiskelunSuoritushetki & OpiskelunSuoritushetki <= Periodin_loppuhetki)
                        {
                            // Löydetty opiskelu, kerää se
                            Dictionary<string, string> OpiskelunTiedot = new Dictionary<string, string>();
                            OpiskelunTiedot.Add("merktyyppi", "opiskelu");
                            OpiskelunTiedot.Add("tutkintolaji", TutkintolajiIter2);
                            OpiskelunTiedot.Add("opiskkoulk", Arvot[TutkintolajiIter2 + "opiskkoulk_" + Vuosi]);
                            OpiskelunTiedot.Add("opiskopmala", Arvot[TutkintolajiIter2 + "opiskopmala_" + Vuosi]);
                            OpiskelunTiedot.Add("opiskopmopa", Arvot[TutkintolajiIter2 + "opiskopmopa_" + Vuosi]);
                            OpiskelunTiedot.Add("opiskopmast", Arvot[TutkintolajiIter2 + "opiskopmast_" + Vuosi]);
                            OpiskelunTiedot.Add("opiskopm95opa", Arvot[TutkintolajiIter2 + "opiskopm95opa_" + Vuosi]);
                            OpiskelunTiedot.Add("opiskkoulutussektori", Arvot[TutkintolajiIter2 + "opiskkoulutussektori_" + Vuosi]);
                            OpiskelunTiedot.Add("opiskkalat1", Arvot[TutkintolajiIter2 + "opiskkalat1_" + Vuosi]);
                            OpiskelunTiedot.Add("opiskkalat2", Arvot[TutkintolajiIter2 + "opiskkalat2_" + Vuosi]);
                            OpiskelunTiedot.Add("opiskkalat3", Arvot[TutkintolajiIter2 + "opiskkalat3_" + Vuosi]);
                            OpiskelunTiedot.Add("opiskjarj", Arvot[TutkintolajiIter2 + "opiskjarj_" + Vuosi]);
                            OpiskelunTiedot.Add("opiskopp", Arvot[TutkintolajiIter2 + "opiskopp_" + Vuosi]);
                            OpiskelunTiedot.Add("kmaak", Arvot[TutkintolajiIter2 + "kmaak_" + Vuosi]);

                            MerkintaKerain.Add(OpiskelunTiedot);

                            if (Debug)
                            {
                                Paivitykset.Add("debug_periodissa_opiskelu", Convert.ToString(Vuosi));
                            }
                        }

                    }
                }

                // Kerätään toiminnat (eivät ole tutkintolajeittain)

                if (Arvot.ContainsKey("ptoim1r5_" + Vuosi))
                {
                    // Tarkista, ollaanko periodin reunoilla
                    decimal ToiminnanSuoritushetki = Convert.ToDecimal(Vuosi) + Convert.ToDecimal(0.5);
                    // aina syyslukukausi

					// keväällä katsotaan edellistä syksyä / jsyrjala 3.11.2020
					// if (Periodin_alkuhetki <= ToiminnanSuoritushetki & ToiminnanSuoritushetki <= Periodin_loppuhetki)
                    if (Periodin_loppuhetki - Convert.ToDecimal(0.5) <= ToiminnanSuoritushetki & ToiminnanSuoritushetki <= Periodin_loppuhetki)
                    {
                        // Löydetty toiminta, kerää se
                        Dictionary<string, string> ToiminnanTiedot = new Dictionary<string, string>();
                        ToiminnanTiedot.Add("merktyyppi", "toiminta");
                        ToiminnanTiedot.Add("ptoim1r5", Arvot["ptoim1r5_" + Vuosi]);
                        // amas ei käytössä / jsyrjala 3.11.2020
						// ToiminnanTiedot.Add("amas", Arvot["amas_" + Vuosi]);

                        MerkintaKerain.Add(ToiminnanTiedot);

                        if (Debug)
                        {
                            Paivitykset.Add("debug_periodissa_toiminta", Convert.ToString(Vuosi));
                        }
                    }
                }

            }

            if (!OnAloittanutOpiskelun)
            {
                lkm = "0";
                // eivät ole aloittaneet oikeasti, nollataan tämä rivi
            }


            //'
            //' Käsitellään kerätyt merkinnät ja päätellään johdetut muuttujat
            //'

            // Luodaan apumuuttujia päättelyä varten
            string tutkintolaji = Arvot["tutkintolaji"];
            string koulutuslaji2 = Arvot["koulutuslaji2"];
            string koulutusluokitus = Arvot["koulk"];
            string koulutusala2002 = Arvot["opmala"];
            //Jarmo 3.2.2014 Mukaan tarvitaan koulutusala
            string koulutuksen_maakunta = Arvot["maak"];
            string koulutuksen_jarjestaja = Arvot["jarj"];
            string opintoala2002 = Arvot["opmopa"];
            string opintoala1995 = Arvot["opm95opa"];
            string oppilaitos = Arvot["opp"];
            string koulutussektori = Arvot["koulutussektori"];
            string koulutusala1 = Arvot["kalat1"];
            string koulutusala2 = Arvot["kalat2"];
            string koulutusala3 = Arvot["kalat3"];

            // Muunnetaan merkinnät lipuiksi (true/false), joiden pohjalta päättely on helppo tehdä
            bool TutkintoAlkuperäisessäTutkintolajissa = false;
            bool TutkintoMuussaTutkintolajissa = false;
            bool TutkintoKandiTutkintolajissa = false;
            //Jarmo 23.1.2014
            bool TutkintoAlkuperäiselläKoulutusalalla2002 = false;
            bool TutkintoMuullaKoulutusalalla2002 = false;
            bool TutkintoAlkuperäiselläJärjestäjällä = false;
            bool TutkintoMuullaJärjestäjällä = false;
            bool TutkintoAlkuperäisessäMaakunnassa = false;
            bool TutkintoMuussaMaakunnassa = false;
            bool TutkintoAlkuperäiselläOpintoalalla2002 = false;
            bool TutkintoMuullaOpintoalalla2002 = false;
            bool TutkintoAlkuperäiselläOpintoalalla1995 = false;
            bool TutkintoMuullaOpintoalalla1995 = false;
            bool TutkintoAlkuperäisessäOppilaitoksessa = false;
            bool TutkintoMuussaOppilaitoksessa = false;
            bool TutkintoAlkuperäiselläKoulutussektorilla = false;
            bool TutkintoMuullaKoulutussektorilla = false;
            bool TutkintoAlkuperäiselläKoulutusalalla1 = false;
            bool TutkintoMuullaKoulutusalalla1 = false;
            bool TutkintoAlkuperäiselläKoulutusalalla2 = false;
            bool TutkintoMuullaKoulutusalalla2 = false;
            bool TutkintoAlkuperäiselläKoulutusalalla3 = false;
            bool TutkintoMuullaKoulutusalalla3 = false;

            bool TutkintoLukiokoulutuksesta = false;
            bool AmmatillinenPerustutkinto = false;
            bool AmmatillinenLisäkoulutus = false;
            bool MuuKorkeinJaViimeisimmäksiSuoritettuTutkintoKorkeakoulututkinto = false;
            bool Ammattikorkeakoulututkinto = false;
            bool AlempiKorkeakoulututkinto = false;
            bool YlempiAmmattikorkeakoulututkinto = false;
            bool YlempiKorkeakoulututkinto = false;
            bool TutkijakoulutusasteenTutkinto = false;
            bool MuuKorkeinJaViimeisimmäksiSuoritettuTutkintoToinenAste = false;

            bool OpiskeluAlkuperäisessäTutkintolajissa = false;
            bool OpiskeluMuussaTutkintolajissa = false;
            bool OpiskeluAlkuperäiselläKoulutusalalla2002 = false;
            bool OpiskeluMuullaKoulutusalalla2002 = false;
            bool OpiskeluAlkuperäiselläJärjestäjällä = false;
            bool OpiskeluMuullaJärjestäjällä = false;
            bool OpiskeluAlkuperäisessäMaakunnassa = false;
            bool OpiskeluMuussaMaakunnassa = false;
            bool OpiskeluAlkuperäiselläOpintoalalla2002 = false;
            bool OpiskeluMuullaOpintoalalla2002 = false;
            bool OpiskeluAlkuperäiselläOpintoalalla1995 = false;
            bool OpiskeluMuullaOpintoalalla1995 = false;
            bool OpiskeluAlkuperäisessäOppilaitoksessa = false;
            bool OpiskeluMuussaOppilaitoksessa = false;
            bool OpiskeluAlkuperäiselläKoulutussektorilla = false;
            bool OpiskeluMuullaKoulutussektorilla = false;
            bool OpiskeluAlkuperäiselläKoulutusalalla1 = false;
            bool OpiskeluMuullaKoulutusalalla1 = false;
            bool OpiskeluAlkuperäiselläKoulutusalalla2 = false;
            bool OpiskeluMuullaKoulutusalalla2 = false;
            bool OpiskeluAlkuperäiselläKoulutusalalla3 = false;
            bool OpiskeluMuullaKoulutusalalla3 = false;

            bool OpiskeleeLukiokoulutuksessa = false;
            bool OpiskeleeAmmatillistaPerustutkintoa = false;
            bool OpiskeleeAmmatillisessaLisäkoulutuksessa = false;
            bool OpiskeleeMuussaKoulutuksessaKorkeakoulututkinto = false;
            bool OpiskeleeAmmattikorkeakoulututkintoa = false;
            bool OpiskeleeAlempaaKorkeakoulututkintoa = false;
            bool OpiskeleeYlempääAmmattikorkeakoulututkintoa = false;
            bool OpiskeleeYlempääKorkeakoulututkintoa = false;
            bool OpiskeleeTieteellistäJatkotutkintoa = false;
            bool OpiskeluMuuhunKuinKorkeakoulututkintoonJohtavassaKoulutuksessa = false;

            bool KeskeyttänytTyöllinen = false;
            bool KeskeyttänytEiTyöllinen = false;


            foreach (Dictionary<string, string> Merkinta in MerkintaKerain)
            {
                // Tutkinto

                if (Merkinta["merktyyppi"] == "tutkinto")
                {
                    // Tutkintolaji
                    if (Merkinta["tutkintolaji"] == "lu")
                        TutkintoLukiokoulutuksesta = true;
                    else if (Merkinta["tutkintolaji"] == "ampt")
                        AmmatillinenPerustutkinto = true;
                    else if (Merkinta["tutkintolaji"] == "amlk")
                        AmmatillinenLisäkoulutus = true;
                    else if (Merkinta["tutkintolaji"] == "muukk")
                        MuuKorkeinJaViimeisimmäksiSuoritettuTutkintoKorkeakoulututkinto = true;
                    else if (Merkinta["tutkintolaji"] == "amk")
                        Ammattikorkeakoulututkinto = true;
                    else if (Merkinta["tutkintolaji"] == "ylamk")
                        YlempiAmmattikorkeakoulututkinto = true;
                    else if (Merkinta["tutkintolaji"] == "alkk")
                        AlempiKorkeakoulututkinto = true;
                    else if (Merkinta["tutkintolaji"] == "ylkk")
                        YlempiKorkeakoulututkinto = true;
                    else if (Merkinta["tutkintolaji"] == "tk")
                        TutkijakoulutusasteenTutkinto = true;
                    else if (Merkinta["tutkintolaji"] == "muuta")
                        MuuKorkeinJaViimeisimmäksiSuoritettuTutkintoToinenAste = true;

                    // Vertailut alkuperäiseen
                    if (tutkintolaji == Merkinta["tutkintolaji"])
                        TutkintoAlkuperäisessäTutkintolajissa = true;
                    else
                    {
                        // Jarmo 23.1.2014
                        if (tutkintolaji == "ylkk" & Merkinta["tutkintolaji"] == "alkk")
                            TutkintoKandiTutkintolajissa = true;
                        else
                            TutkintoMuussaTutkintolajissa = true;
                    }
					
                    //If koulutusluokitus = Merkinta["tutkkoulk"] Then
                    //Jarmo 3.2.2014 Vertailu pitää tehdä koulutusalalla, ei koulutuskoodilla
                    if (koulutusala2002 == Merkinta["tutkopmala"])
                        TutkintoAlkuperäiselläKoulutusalalla2002 = true;
                    else
                        TutkintoMuullaKoulutusalalla2002 = true;

                    if (koulutuksen_jarjestaja == Merkinta["tutkjarj"])
                        TutkintoAlkuperäiselläJärjestäjällä = true;
                    else
                        TutkintoMuullaJärjestäjällä = true;

                    if (koulutuksen_maakunta == Merkinta["tutkmaak"])
                        TutkintoAlkuperäisessäMaakunnassa = true;
                    else
                        TutkintoMuussaMaakunnassa = true;

                    if (oppilaitos == Merkinta["tutkopp"])
                        TutkintoAlkuperäisessäOppilaitoksessa = true;
                    else
                        TutkintoMuussaOppilaitoksessa = true;

                    if (opintoala2002 == Merkinta["tutkopmopa"])
                        TutkintoAlkuperäiselläOpintoalalla2002 = true;
                    else
                        TutkintoMuullaOpintoalalla2002 = true;

                    if (opintoala1995 == Merkinta["tutkopm95opa"])
                        TutkintoAlkuperäiselläOpintoalalla1995 = true;
                    else
                        TutkintoMuullaOpintoalalla1995 = true;

                    if (koulutussektori == Merkinta["tutkkoulutussektori"])
                        TutkintoAlkuperäiselläKoulutussektorilla = true;
                    else
                        TutkintoMuullaKoulutussektorilla = true;

                    if (koulutusala1 == Merkinta["tutkkalat1"])
                        TutkintoAlkuperäiselläKoulutusalalla1 = true;
                    else
                        TutkintoMuullaKoulutusalalla1 = true;

                    if (koulutusala2 == Merkinta["tutkkalat2"])
                        TutkintoAlkuperäiselläKoulutusalalla2 = true;
                    else
                        TutkintoMuullaKoulutusalalla2 = true;

                    if (koulutusala3 == Merkinta["tutkkalat3"])
                        TutkintoAlkuperäiselläKoulutusalalla3 = true;
                    else
                        TutkintoMuullaKoulutusalalla3 = true;

                    // Opiskelu
                }
                else if (Merkinta["merktyyppi"] == "opiskelu")
                {
                    // Koulutuslajit
                    if (Merkinta["tutkintolaji"] == "lu")
                        OpiskeleeLukiokoulutuksessa = true;
                    else if (Merkinta["tutkintolaji"] == "ampt")
                        OpiskeleeAmmatillistaPerustutkintoa = true;
                    else if (Merkinta["tutkintolaji"] == "amlk")
                        OpiskeleeAmmatillisessaLisäkoulutuksessa = true;
                    else if (Merkinta["tutkintolaji"] == "muukk")
                        OpiskeleeMuussaKoulutuksessaKorkeakoulututkinto = true;
                    else if (Merkinta["tutkintolaji"] == "amk")
                        OpiskeleeAmmattikorkeakoulututkintoa = true;
                    else if (Merkinta["tutkintolaji"] == "ylamk")
                        OpiskeleeYlempääAmmattikorkeakoulututkintoa = true;
                    else if (Merkinta["tutkintolaji"] == "alkk")
                        OpiskeleeAlempaaKorkeakoulututkintoa = true;
                    else if (Merkinta["tutkintolaji"] == "ylkk")
                        OpiskeleeYlempääKorkeakoulututkintoa = true;
                    else if (Merkinta["tutkintolaji"] == "tk")
                        OpiskeleeTieteellistäJatkotutkintoa = true;
                    else if (Merkinta["tutkintolaji"] == "muuta")
                        OpiskeluMuuhunKuinKorkeakoulututkintoonJohtavassaKoulutuksessa = true;

                    // Vertailut alkuperäiseen
                    // Jarmo 23.1.2014
                    if (tutkintolaji == Merkinta["tutkintolaji"] | (tutkintolaji == "ylkk" & Merkinta["tutkintolaji"] == "alkk"))
                        OpiskeluAlkuperäisessäTutkintolajissa = true;
                    else
                        OpiskeluMuussaTutkintolajissa = true;

                    //If koulutusluokitus = Merkinta["opiskkoulk"] Then
                    //Jarmo 3.2.2014 Vertailu tehdään koulutusalalla, ei koulutuskoodilla
                    if (koulutusala2002 == Merkinta["opiskopmala"])
                        OpiskeluAlkuperäiselläKoulutusalalla2002 = true;
                    else
                        OpiskeluMuullaKoulutusalalla2002 = true;

                    if (koulutuksen_jarjestaja == Merkinta["opiskjarj"])
                        OpiskeluAlkuperäiselläJärjestäjällä = true;
                    else
                        OpiskeluMuullaJärjestäjällä = true;

                    if (koulutuksen_maakunta == Merkinta["kmaak"])
                        OpiskeluAlkuperäisessäMaakunnassa = true;
                    else
                        OpiskeluMuussaMaakunnassa = true;

                    if (oppilaitos == Merkinta["opiskopp"])
                        OpiskeluAlkuperäisessäOppilaitoksessa = true;
                    else
                        OpiskeluMuussaOppilaitoksessa = true;

                    if (opintoala2002 == Merkinta["opiskopmopa"])
                        OpiskeluAlkuperäiselläOpintoalalla2002 = true;
                    else
                        OpiskeluMuullaOpintoalalla2002 = true;

                    if (opintoala1995 == Merkinta["opiskopm95opa"])
                        OpiskeluAlkuperäiselläOpintoalalla1995 = true;
                    else
                        OpiskeluMuullaOpintoalalla1995 = true;

                    if (koulutussektori == Merkinta["opiskkoulutussektori"])
                        OpiskeluAlkuperäiselläKoulutussektorilla = true;
                    else
                        OpiskeluMuullaKoulutussektorilla = true;

                    if (koulutusala1 == Merkinta["opiskkalat1"])
                        OpiskeluAlkuperäiselläKoulutusalalla1 = true;
                    else
                        OpiskeluMuullaKoulutusalalla1 = true;

                    if (koulutusala2 == Merkinta["opiskkalat2"])
                        OpiskeluAlkuperäiselläKoulutusalalla2 = true;
                    else
                        OpiskeluMuullaKoulutusalalla2 = true;

                    if (koulutusala3 == Merkinta["opiskkalat3"])
                        OpiskeluAlkuperäiselläKoulutusalalla3 = true;
                    else
                        OpiskeluMuullaKoulutusalalla3 = true;

                    // Toiminta
                }
                else if (Merkinta["merktyyppi"] == "toiminta")
                {
                    if (Merkinta["ptoim1r5"] == "11")
                        KeskeyttänytTyöllinen = true;
                    else
                        KeskeyttänytEiTyöllinen = true;
                }
                else
                    throw new Exception("Kerättyä merkinnän tyyppiä ei pystytä käsittelemään: " + Merkinta["merktyyppi"]);
            }

            //
            // Kerää kaikki luokat (sarakkeet), joihin tämän rivin opiskelijat lisätään (lkm)
            //

            // Käsittele Mallitaulukko 1a
            if (TutkintoAlkuperäisessäTutkintolajissa)
                Paivitykset.Add("1a_tutkinto_alkuperaisessa_tutkintolajissa", lkm);
            else if (TutkintoKandiTutkintolajissa)
                Paivitykset.Add("1a_tutkinto_kandi_tutkintolajissa", lkm);
            else if (TutkintoMuussaTutkintolajissa)
                Paivitykset.Add("1a_tutkinto_muussa_tutkintolajissa", lkm);
            else if (OpiskeluAlkuperäisessäTutkintolajissa)
                Paivitykset.Add("1a_opiskelee_alkuperaisessa_tutkintolajissa", lkm);
            else if (OpiskeluMuussaTutkintolajissa)
                Paivitykset.Add("1a_opiskelee_muussa_tutkintolajissa", lkm);
            else if (KeskeyttänytTyöllinen)
                Paivitykset.Add("1a_keskeyttanyt_tyollinen", lkm);
            else
                Paivitykset.Add("1a_keskeyttanyt_ei_tyollinen", lkm);

            // Käsittele Mallitaulukko 1b
            if (TutkintoAlkuperäisessäTutkintolajissa)
                Paivitykset.Add("1b_tutkinto_alkuperaisessa_tutkintolajissa", lkm);
            else if (OpiskeluAlkuperäisessäTutkintolajissa)
                Paivitykset.Add("1b_opiskelee_alkuperaisessa_tutkintolajissa", lkm);
            else if (TutkintoKandiTutkintolajissa)
                Paivitykset.Add("1b_tutkinto_kandi_tutkintolajissa", lkm);
            else if (TutkintoMuussaTutkintolajissa)
                Paivitykset.Add("1b_tutkinto_muussa_tutkintolajissa", lkm);
            else if (OpiskeluMuussaTutkintolajissa)
                Paivitykset.Add("1b_opiskelee_muussa_tutkintolajissa", lkm);
            else if (KeskeyttänytTyöllinen)
                Paivitykset.Add("1b_keskeyttanyt_tyollinen", lkm);
            else
                Paivitykset.Add("1b_keskeyttanyt_ei_tyollinen", lkm);

            // Käsittele Mallitaulukko 1c ("megataulukko")
            // Lukiokoulutus, nuorten OPS TAI Lukiokoulutus, aikuisten OPS
            if (koulutuslaji2 == "21" | koulutuslaji2 == "22")
            {
                if (TutkintoLukiokoulutuksesta)
                    Paivitykset.Add("1c_tutkinto_lukiokoulutuksesta", lkm);
                else if (AmmatillinenPerustutkinto)
                    Paivitykset.Add("1c_ammatillinen_perustutkinto", lkm);
                else if (AmmatillinenLisäkoulutus)
                    Paivitykset.Add("1c_ammatillinen_lisakoulutus_ammattitutkinto_tai_erikoisammattitutkinto", lkm);
                else if (MuuKorkeinJaViimeisimmäksiSuoritettuTutkintoKorkeakoulututkinto)
                    Paivitykset.Add("1c_muu_korkein_ja_viimeisimmaksi_suoritettu_tutkinto_korkeakoulututkinto", lkm);
                else
                    Paivitykset.Add("1c_ei_tutkintoa", lkm);

                // OPS-perusteinen ammatillinen peruskoulutus TAI Näyttötutkintoon valmistava koulutus: perustutkinnot TAI OPS-perusteinen ammatillinen peruskoulutus TAI Näyttötutkintoon valmistava koulutus: perustutkinnot
				// tilv 2018- ei enää ops/näyttö-erottelua (-> koodit 6X)
                // tilv 2019- ei enää oppis/oppil jaottelua (-> koodit 7X-8X)
            }
            else if (koulutuslaji2 == "31" | koulutuslaji2 == "32" | koulutuslaji2 == "35" | koulutuslaji2 == "36" | koulutuslaji2 == "61" | koulutuslaji2 == "64" | koulutuslaji2 == "71" | koulutuslaji2 == "74" | koulutuslaji2 == "77" | koulutuslaji2 == "80")
            {
                if (AmmatillinenPerustutkinto)
                    Paivitykset.Add("1c_ammatillinen_perustutkinto", lkm);
                else if (AmmatillinenLisäkoulutus)
                    Paivitykset.Add("1c_ammatillinen_lisakoulutus_ammattitutkinto_tai_erikoisammattitutkinto", lkm);
                else if (TutkintoLukiokoulutuksesta)
                    Paivitykset.Add("1c_tutkinto_lukiokoulutuksesta", lkm);
                else if (MuuKorkeinJaViimeisimmäksiSuoritettuTutkintoKorkeakoulututkinto)
                    Paivitykset.Add("1c_muu_korkein_ja_viimeisimmaksi_suoritettu_tutkinto_korkeakoulututkinto", lkm);
                else
                    Paivitykset.Add("1c_ei_tutkintoa", lkm);

                // Näyttötutkintoon valmistava koulutus: ammattitutkinnot TAI Näyttötutkintoon valmistava koulutus: erikoisammattitutkinnot TAI Näyttötutkintoon valmistava koulutus: ammattitutkinnot TAI Näyttötutkintoon valmistava koulutus: erikoisammattitutkinnot
                // tilv 2018- ei enää ops/näyttö-erottelua (-> koodit 6X)
                // tilv 2019- ei enää oppis/oppil jaottelua (-> koodit 7X-8X)
            }
            else if (koulutuslaji2 == "33" | koulutuslaji2 == "34" | koulutuslaji2 == "37" | koulutuslaji2 == "38" | koulutuslaji2 == "62" | koulutuslaji2 == "63"  | koulutuslaji2 == "65" | koulutuslaji2 == "66" | koulutuslaji2 == "72" | koulutuslaji2 == "73" | koulutuslaji2 == "75" | koulutuslaji2 == "76" | koulutuslaji2 == "78" | koulutuslaji2 == "79" | koulutuslaji2 == "81" | koulutuslaji2 == "82")
            {
                if (AmmatillinenLisäkoulutus)
                    Paivitykset.Add("1c_ammatillinen_lisakoulutus_ammattitutkinto_tai_erikoisammattitutkinto", lkm);
                else if (AmmatillinenPerustutkinto)
                    Paivitykset.Add("1c_ammatillinen_perustutkinto", lkm);
                else if (TutkintoLukiokoulutuksesta)
                    Paivitykset.Add("1c_tutkinto_lukiokoulutuksesta", lkm);
                else if (MuuKorkeinJaViimeisimmäksiSuoritettuTutkintoKorkeakoulututkinto)
                    Paivitykset.Add("1c_muu_korkein_ja_viimeisimmaksi_suoritettu_tutkinto_korkeakoulututkinto", lkm);
                else
                    Paivitykset.Add("1c_ei_tutkintoa", lkm);

                // Ammattikorkeakoulututkinto, nuorten koulutus TAI Ammattikorkeakoulututkinto, aikuisten koulutus
            }
            else if (koulutuslaji2 == "41" | koulutuslaji2 == "42")
            {
                if (Ammattikorkeakoulututkinto)
                    Paivitykset.Add("1c_ammattikorkeakoulututkinto", lkm);
                else if (YlempiAmmattikorkeakoulututkinto)
                    Paivitykset.Add("1c_ylempi_ammattikorkeakoulututkinto", lkm);
                else if (TutkijakoulutusasteenTutkinto)
                    Paivitykset.Add("1c_tutkijakoulutusasteen_tutkinto", lkm);
                else if (YlempiKorkeakoulututkinto)
                    Paivitykset.Add("1c_ylempi_korkeakoulututkinto", lkm);
                else if (AlempiKorkeakoulututkinto)
                    Paivitykset.Add("1c_alempi_korkeakoulututkinto", lkm);
                else if (MuuKorkeinJaViimeisimmäksiSuoritettuTutkintoToinenAste)
                    Paivitykset.Add("1c_muu_korkein_ja_viimeisimmaksi_suoritettu_tutkinto_toinen_aste", lkm);
                else
                    Paivitykset.Add("1c_ei_tutkintoa", lkm);

                // Ylempään AMK-tutkintoon tähtäävä koulutus
            }
            else if (koulutuslaji2 == "46")
            {
                if (YlempiAmmattikorkeakoulututkinto)
                    Paivitykset.Add("1c_ylempi_ammattikorkeakoulututkinto", lkm);
                else if (Ammattikorkeakoulututkinto)
                    Paivitykset.Add("1c_ammattikorkeakoulututkinto", lkm);
                else if (TutkijakoulutusasteenTutkinto)
                    Paivitykset.Add("1c_tutkijakoulutusasteen_tutkinto", lkm);
                else if (YlempiKorkeakoulututkinto)
                    Paivitykset.Add("1c_ylempi_korkeakoulututkinto", lkm);
                else if (AlempiKorkeakoulututkinto)
                    Paivitykset.Add("1c_alempi_korkeakoulututkinto", lkm);
                else if (MuuKorkeinJaViimeisimmäksiSuoritettuTutkintoToinenAste)
                    Paivitykset.Add("1c_muu_korkein_ja_viimeisimmaksi_suoritettu_tutkinto_toinen_aste", lkm);
                else
                    Paivitykset.Add("1c_ei_tutkintoa", lkm);

                // Alempaan korkeakoulututkintoon tähtäävä koulutus
            }
            else if (koulutuslaji2 == "51a")
            {
                if (AlempiKorkeakoulututkinto)
                    Paivitykset.Add("1c_alempi_korkeakoulututkinto", lkm);
                else if (TutkijakoulutusasteenTutkinto)
                    Paivitykset.Add("1c_tutkijakoulutusasteen_tutkinto", lkm);
                else if (YlempiKorkeakoulututkinto)
                    Paivitykset.Add("1c_ylempi_korkeakoulututkinto", lkm);
                else if (YlempiAmmattikorkeakoulututkinto)
                    Paivitykset.Add("1c_ylempi_ammattikorkeakoulututkinto", lkm);
                else if (Ammattikorkeakoulututkinto)
                    Paivitykset.Add("1c_ammattikorkeakoulututkinto", lkm);
                else if (MuuKorkeinJaViimeisimmäksiSuoritettuTutkintoToinenAste)
                    Paivitykset.Add("1c_muu_korkein_ja_viimeisimmaksi_suoritettu_tutkinto_toinen_aste", lkm);
                else
                    Paivitykset.Add("1c_ei_tutkintoa", lkm);

                // Ylempään korkeakoulututkintoon tähtäävä koulutus
            }
            else if (koulutuslaji2 == "51b")
            {
                if (YlempiKorkeakoulututkinto)
                    Paivitykset.Add("1c_ylempi_korkeakoulututkinto", lkm);
                else if (TutkijakoulutusasteenTutkinto)
                    Paivitykset.Add("1c_tutkijakoulutusasteen_tutkinto", lkm);
                else if (AlempiKorkeakoulututkinto)
                    Paivitykset.Add("1c_alempi_korkeakoulututkinto", lkm);
                else if (YlempiAmmattikorkeakoulututkinto)
                    Paivitykset.Add("1c_ylempi_ammattikorkeakoulututkinto", lkm);
                else if (Ammattikorkeakoulututkinto)
                    Paivitykset.Add("1c_ammattikorkeakoulututkinto", lkm);
                else if (MuuKorkeinJaViimeisimmäksiSuoritettuTutkintoToinenAste)
                    Paivitykset.Add("1c_muu_korkein_ja_viimeisimmaksi_suoritettu_tutkinto_toinen_aste", lkm);
                else
                    Paivitykset.Add("1c_ei_tutkintoa", lkm);

                // Lisensiaatinkoulutus, tohtorinkoulutus ja lääkärien erik.koul.
            }
            else if (koulutuslaji2 == "52")
            {
                if (TutkijakoulutusasteenTutkinto)
                    Paivitykset.Add("1c_tutkijakoulutusasteen_tutkinto", lkm);
                else if (YlempiKorkeakoulututkinto)
                    Paivitykset.Add("1c_ylempi_korkeakoulututkinto", lkm);
                else if (AlempiKorkeakoulututkinto)
                    Paivitykset.Add("1c_alempi_korkeakoulututkinto", lkm);
                else if (YlempiAmmattikorkeakoulututkinto)
                    Paivitykset.Add("1c_ylempi_ammattikorkeakoulututkinto", lkm);
                else if (Ammattikorkeakoulututkinto)
                    Paivitykset.Add("1c_ammattikorkeakoulututkinto", lkm);
                else if (MuuKorkeinJaViimeisimmäksiSuoritettuTutkintoToinenAste)
                    Paivitykset.Add("1c_muu_korkein_ja_viimeisimmaksi_suoritettu_tutkinto_toinen_aste", lkm);
                else
                    Paivitykset.Add("1c_ei_tutkintoa", lkm);
            }
            else
                throw new Exception("Tuntematon koulutuslaji2: " + koulutuslaji2);

            // Käsittele Mallitaulukko 1d ("megataulukko")
            // Lukiokoulutus, nuorten OPS TAI Lukiokoulutus, aikuisten OPS
            if (koulutuslaji2 == "21" | koulutuslaji2 == "22")
            {
                if (OpiskeleeLukiokoulutuksessa)
                    Paivitykset.Add("1d_opiskelee_lukiokoulutuksessa", lkm);
                else if (OpiskeleeAmmatillistaPerustutkintoa)
                    Paivitykset.Add("1d_opiskelee_ammatillista_perustutkintoa", lkm);
                else if (OpiskeleeAmmatillisessaLisäkoulutuksessa)
                    Paivitykset.Add("1d_opiskelee_ammatillisessa_lisakoulutuksessa", lkm);
                else if (OpiskeleeMuussaKoulutuksessaKorkeakoulututkinto)
                    Paivitykset.Add("1d_opiskelee_muussa_koulutuksessa_korkeakoulututkinto", lkm);
                else
                    Paivitykset.Add("1d_ei_opiskele", lkm);

                // OPS-perusteinen ammatillinen peruskoulutus TAI Näyttötutkintoon valmistava koulutus: perustutkinnot TAI OPS-perusteinen ammatillinen peruskoulutus TAI Näyttötutkintoon valmistava koulutus: perustutkinnot
                // tilv 2018- ei enää ops/näyttö-erottelua (koodit 6X)
                // tilv 2019- ei enää oppis/oppil jaottelua (-> koodit 7X-8X)
            }
            else if (koulutuslaji2 == "31" | koulutuslaji2 == "32" | koulutuslaji2 == "35" | koulutuslaji2 == "36" | koulutuslaji2 == "61" | koulutuslaji2 == "64" | koulutuslaji2 == "71" | koulutuslaji2 == "74" | koulutuslaji2 == "77" | koulutuslaji2 == "80")
            {
                if (OpiskeleeAmmatillistaPerustutkintoa)
                    Paivitykset.Add("1d_opiskelee_ammatillista_perustutkintoa", lkm);
                else if (OpiskeleeAmmatillisessaLisäkoulutuksessa)
                    Paivitykset.Add("1d_opiskelee_ammatillisessa_lisakoulutuksessa", lkm);
                else if (OpiskeleeLukiokoulutuksessa)
                    Paivitykset.Add("1d_opiskelee_lukiokoulutuksessa", lkm);
                else if (OpiskeleeMuussaKoulutuksessaKorkeakoulututkinto)
                    Paivitykset.Add("1d_opiskelee_muussa_koulutuksessa_korkeakoulututkinto", lkm);
                else
                    Paivitykset.Add("1d_ei_opiskele", lkm);

                // Näyttötutkintoon valmistava koulutus: ammattitutkinnot TAI Näyttötutkintoon valmistava koulutus: erikoisammattitutkinnot TAI Näyttötutkintoon valmistava koulutus: ammattitutkinnot TAI Näyttötutkintoon valmistava koulutus: erikoisammattitutkinnot
                // tilv 2018- ei enää ops/näyttö-erottelua (koodit 6X)
                // tilv 2019- ei enää oppis/oppil jaottelua (-> koodit 7X-8X)
            }
            else if (koulutuslaji2 == "33" | koulutuslaji2 == "34" | koulutuslaji2 == "37" | koulutuslaji2 == "38" | koulutuslaji2 == "62" | koulutuslaji2 == "63" | koulutuslaji2 == "65" | koulutuslaji2 == "66" | koulutuslaji2 == "72" | koulutuslaji2 == "73" | koulutuslaji2 == "75" | koulutuslaji2 == "76" | koulutuslaji2 == "78" | koulutuslaji2 == "79" | koulutuslaji2 == "81" | koulutuslaji2 == "82")
            {
                if (OpiskeleeAmmatillisessaLisäkoulutuksessa)
                    Paivitykset.Add("1d_opiskelee_ammatillisessa_lisakoulutuksessa", lkm);
                else if (OpiskeleeAmmatillistaPerustutkintoa)
                    Paivitykset.Add("1d_opiskelee_ammatillista_perustutkintoa", lkm);
                else if (OpiskeleeLukiokoulutuksessa)
                    Paivitykset.Add("1d_opiskelee_lukiokoulutuksessa", lkm);
                else if (OpiskeleeMuussaKoulutuksessaKorkeakoulututkinto)
                    Paivitykset.Add("1d_opiskelee_muussa_koulutuksessa_korkeakoulututkinto", lkm);
                else
                    Paivitykset.Add("1d_ei_opiskele", lkm);

                // Ammattikorkeakoulututkinto, nuorten koulutus TAI Ammattikorkeakoulututkinto, aikuisten koulutus
            }
            else if (koulutuslaji2 == "41" | koulutuslaji2 == "42")
            {
                if (OpiskeleeAmmattikorkeakoulututkintoa)
                    Paivitykset.Add("1d_opiskelee_ammattikorkeakoulututkintoa", lkm);
                else if (OpiskeleeYlempääAmmattikorkeakoulututkintoa)
                    Paivitykset.Add("1d_opiskelee_ylempaa_ammattikorkeakoulututkintoa", lkm);
                else if (OpiskeleeTieteellistäJatkotutkintoa)
                    Paivitykset.Add("1d_opiskelee_tieteellista_jatkotutkintoa", lkm);
                else if (OpiskeleeYlempääKorkeakoulututkintoa)
                    Paivitykset.Add("1d_opiskelee_ylempaa_korkeakoulututkintoa", lkm);
                else if (OpiskeleeAlempaaKorkeakoulututkintoa)
                    Paivitykset.Add("1d_opiskelee_alempaa_korkeakoulututkintoa", lkm);
                else if (OpiskeluMuuhunKuinKorkeakoulututkintoonJohtavassaKoulutuksessa)
                    Paivitykset.Add("1d_opiskelu_muuhun_kuin_korkeakoulututkintoon_johtavassa_koulutuksessa_toisen_asteen_opiskelu_ammatillinen_poimitaan_ensisij", lkm);
                else
                    Paivitykset.Add("1d_ei_opiskele", lkm);

                // Ylempään AMK-tutkintoon tähtäävä koulutus
            }
            else if (koulutuslaji2 == "46")
            {
                if (OpiskeleeYlempääAmmattikorkeakoulututkintoa)
                    Paivitykset.Add("1d_opiskelee_ylempaa_ammattikorkeakoulututkintoa", lkm);
                else if (OpiskeleeAmmattikorkeakoulututkintoa)
                    Paivitykset.Add("1d_opiskelee_ammattikorkeakoulututkintoa", lkm);
                else if (OpiskeleeTieteellistäJatkotutkintoa)
                    Paivitykset.Add("1d_opiskelee_tieteellista_jatkotutkintoa", lkm);
                else if (OpiskeleeYlempääKorkeakoulututkintoa)
                    Paivitykset.Add("1d_opiskelee_ylempaa_korkeakoulututkintoa", lkm);
                else if (OpiskeleeAlempaaKorkeakoulututkintoa)
                    Paivitykset.Add("1d_opiskelee_alempaa_korkeakoulututkintoa", lkm);
                else if (OpiskeluMuuhunKuinKorkeakoulututkintoonJohtavassaKoulutuksessa)
                    Paivitykset.Add("1d_opiskelu_muuhun_kuin_korkeakoulututkintoon_johtavassa_koulutuksessa_toisen_asteen_opiskelu_ammatillinen_poimitaan_ensisij", lkm);
                else
                    Paivitykset.Add("1d_ei_opiskele", lkm);

                // Alempaan korkeakoulututkintoon tähtäävä koulutus
            }
            else if (koulutuslaji2 == "51a")
            {
                if (OpiskeleeAlempaaKorkeakoulututkintoa)
                    Paivitykset.Add("1d_opiskelee_alempaa_korkeakoulututkintoa", lkm);
                else if (OpiskeleeTieteellistäJatkotutkintoa)
                    Paivitykset.Add("1d_opiskelee_tieteellista_jatkotutkintoa", lkm);
                else if (OpiskeleeYlempääKorkeakoulututkintoa)
                    Paivitykset.Add("1d_opiskelee_ylempaa_korkeakoulututkintoa", lkm);
                else if (OpiskeleeYlempääAmmattikorkeakoulututkintoa)
                    Paivitykset.Add("1d_opiskelee_ylempaa_ammattikorkeakoulututkintoa", lkm);
                else if (OpiskeleeAmmattikorkeakoulututkintoa)
                    Paivitykset.Add("1d_opiskelee_ammattikorkeakoulututkintoa", lkm);
                else if (OpiskeluMuuhunKuinKorkeakoulututkintoonJohtavassaKoulutuksessa)
                    Paivitykset.Add("1d_opiskelu_muuhun_kuin_korkeakoulututkintoon_johtavassa_koulutuksessa_toisen_asteen_opiskelu_ammatillinen_poimitaan_ensisij", lkm);
                else
                    Paivitykset.Add("1d_ei_opiskele", lkm);

                // Ylempään korkeakoulututkintoon tähtäävä koulutus
            }
            else if (koulutuslaji2 == "51b")
            {
                if (OpiskeleeYlempääKorkeakoulututkintoa)
                    Paivitykset.Add("1d_opiskelee_ylempaa_korkeakoulututkintoa", lkm);
                else if (OpiskeleeTieteellistäJatkotutkintoa)
                    Paivitykset.Add("1d_opiskelee_tieteellista_jatkotutkintoa", lkm);
                else if (OpiskeleeAlempaaKorkeakoulututkintoa)
                    Paivitykset.Add("1d_opiskelee_alempaa_korkeakoulututkintoa", lkm);
                else if (OpiskeleeYlempääAmmattikorkeakoulututkintoa)
                    Paivitykset.Add("1d_opiskelee_ylempaa_ammattikorkeakoulututkintoa", lkm);
                else if (OpiskeleeAmmattikorkeakoulututkintoa)
                    Paivitykset.Add("1d_opiskelee_ammattikorkeakoulututkintoa", lkm);
                else if (OpiskeluMuuhunKuinKorkeakoulututkintoonJohtavassaKoulutuksessa)
                    Paivitykset.Add("1d_opiskelu_muuhun_kuin_korkeakoulututkintoon_johtavassa_koulutuksessa_toisen_asteen_opiskelu_ammatillinen_poimitaan_ensisij", lkm);
                else
                    Paivitykset.Add("1d_ei_opiskele", lkm);

                // Lisensiaatinkoulutus, tohtorinkoulutus ja lääkärien erik.koul.
            }
            else if (koulutuslaji2 == "52")
            {
                if (OpiskeleeTieteellistäJatkotutkintoa)
                    Paivitykset.Add("1d_opiskelee_tieteellista_jatkotutkintoa", lkm);
                else if (OpiskeleeYlempääKorkeakoulututkintoa)
                    Paivitykset.Add("1d_opiskelee_ylempaa_korkeakoulututkintoa", lkm);
                else if (OpiskeleeAlempaaKorkeakoulututkintoa)
                    Paivitykset.Add("1d_opiskelee_alempaa_korkeakoulututkintoa", lkm);
                else if (OpiskeleeYlempääAmmattikorkeakoulututkintoa)
                    Paivitykset.Add("1d_opiskelee_ylempaa_ammattikorkeakoulututkintoa", lkm);
                else if (OpiskeleeAmmattikorkeakoulututkintoa)
                    Paivitykset.Add("1d_opiskelee_ammattikorkeakoulututkintoa", lkm);
                else if (OpiskeluMuuhunKuinKorkeakoulututkintoonJohtavassaKoulutuksessa)
                    Paivitykset.Add("1d_opiskelu_muuhun_kuin_korkeakoulututkintoon_johtavassa_koulutuksessa_toisen_asteen_opiskelu_ammatillinen_poimitaan_ensisij", lkm);
                else
                    Paivitykset.Add("1d_ei_opiskele", lkm);
            }
            else
                throw new Exception("Tuntematon koulutuslaji2: " + koulutuslaji2);

            // Käsittele Mallitaulukko 1e
            //Jarmo 23.1.2014
            //Siirretty kandiehto 1e -> 1f Jarmo 2.7.2014
            if (TutkintoAlkuperäisessäTutkintolajissa)
                Paivitykset.Add("1e_kylla", lkm);
            else
                Paivitykset.Add("1e_ei", lkm);

            // Käsittele Mallitaulukko 1f
            //Siirretty kandiehto 1e -> 1f Jarmo 2.7.2014
            if (TutkintoMuussaTutkintolajissa | TutkintoKandiTutkintolajissa)
                Paivitykset.Add("1f_kylla", lkm);
            else
                Paivitykset.Add("1f_ei", lkm);

            // Käsittele Mallitaulukko 1g
            if (OpiskeluAlkuperäisessäTutkintolajissa)
                Paivitykset.Add("1g_kylla", lkm);
            else
                Paivitykset.Add("1g_ei", lkm);

            // Käsittele Mallitaulukko 1h
            if (OpiskeluMuussaTutkintolajissa)
                Paivitykset.Add("1h_kylla", lkm);
            else
                Paivitykset.Add("1h_ei", lkm);

            // Käsittele Mallitaulukko 2a
            if (TutkintoAlkuperäiselläKoulutusalalla2002)
                Paivitykset.Add("2a_tutkinto_alkuperaisella_koulutusalalla_2002", lkm);
            else if (TutkintoMuullaKoulutusalalla2002)
                Paivitykset.Add("2a_tutkinto_muulla_koulutusalalla_2002", lkm);
            else if (OpiskeluAlkuperäiselläKoulutusalalla2002)
                Paivitykset.Add("2a_opiskelee_alkuperaisella_koulutusalalla_2002", lkm);
            else if (OpiskeluMuullaKoulutusalalla2002)
                Paivitykset.Add("2a_opiskelee_muulla_koulutusalalla_2002", lkm);
            else if (KeskeyttänytTyöllinen)
                Paivitykset.Add("2a_keskeyttanyt_tyollinen", lkm);
            else
                Paivitykset.Add("2a_keskeyttanyt_ei_tyollinen", lkm);

            // Käsittele Mallitaulukko 2b
            if (TutkintoAlkuperäiselläKoulutusalalla2002)
                Paivitykset.Add("2b_tutkinto_alkuperaisella_koulutusalalla_2002", lkm);
            else if (OpiskeluAlkuperäiselläKoulutusalalla2002)
                Paivitykset.Add("2b_opiskelee_alkuperaisella_koulutusalalla_2002", lkm);
            else if (TutkintoMuullaKoulutusalalla2002)
                Paivitykset.Add("2b_tutkinto_muulla_koulutusalalla_2002", lkm);
            else if (OpiskeluMuullaKoulutusalalla2002)
                Paivitykset.Add("2b_opiskelee_muulla_koulutusalalla_2002", lkm);
            else if (KeskeyttänytTyöllinen)
                Paivitykset.Add("2b_keskeyttanyt_tyollinen", lkm);
            else
                Paivitykset.Add("2b_keskeyttanyt_ei_tyollinen", lkm);

            // Mallitaulukoita 2c-2d ei ole

            // Käsittele Mallitaulukko 2e
            if (TutkintoAlkuperäiselläKoulutusalalla2002)
                Paivitykset.Add("2e_kylla", lkm);
            else
                Paivitykset.Add("2e_ei", lkm);

            // Käsittele Mallitaulukko 2f
            if (TutkintoMuullaKoulutusalalla2002)
                Paivitykset.Add("2f_kylla", lkm);
            else
                Paivitykset.Add("2f_ei", lkm);

            // Käsittele Mallitaulukko 2g
            if (OpiskeluAlkuperäiselläKoulutusalalla2002)
                Paivitykset.Add("2g_kylla", lkm);
            else
                Paivitykset.Add("2g_ei", lkm);

            // Käsittele Mallitaulukko 2h
            if (OpiskeluMuullaKoulutusalalla2002)
                Paivitykset.Add("2h_kylla", lkm);
            else
                Paivitykset.Add("2h_ei", lkm);

            // Käsittele Mallitaulukko 3a
            if (TutkintoAlkuperäiselläOpintoalalla2002)
                Paivitykset.Add("3a_tutkinto_alkuperaisella_opintoalalla_2002", lkm);
            else if (TutkintoMuullaOpintoalalla2002)
                Paivitykset.Add("3a_tutkinto_muulla_opintoalalla_2002", lkm);
            else if (OpiskeluAlkuperäiselläOpintoalalla2002)
                Paivitykset.Add("3a_opiskelee_alkuperaisella_opintoalalla_2002", lkm);
            else if (OpiskeluMuullaOpintoalalla2002)
                Paivitykset.Add("3a_opiskelee_muulla_opintoalalla_2002", lkm);
            else if (KeskeyttänytTyöllinen)
                Paivitykset.Add("3a_keskeyttanyt_tyollinen", lkm);
            else
                Paivitykset.Add("3a_keskeyttanyt_ei_tyollinen", lkm);

            // Käsittele Mallitaulukko 3b
            if (TutkintoAlkuperäiselläOpintoalalla2002)
                Paivitykset.Add("3b_tutkinto_alkuperaisella_opintoalalla_2002", lkm);
            else if (OpiskeluAlkuperäiselläOpintoalalla2002)
                Paivitykset.Add("3b_opiskelee_alkuperaisella_opintoalalla_2002", lkm);
            else if (TutkintoMuullaOpintoalalla2002)
                Paivitykset.Add("3b_tutkinto_muulla_opintoalalla_2002", lkm);
            else if (OpiskeluMuullaOpintoalalla2002)
                Paivitykset.Add("3b_opiskelee_muulla_opintoalalla_2002", lkm);
            else if (KeskeyttänytTyöllinen)
                Paivitykset.Add("3b_keskeyttanyt_tyollinen", lkm);
            else
                Paivitykset.Add("3b_keskeyttanyt_ei_tyollinen", lkm);

            // Mallitaulukoita 3c-3d ei ole

            // Käsittele Mallitaulukko 3e
            if (TutkintoAlkuperäiselläOpintoalalla2002)
                Paivitykset.Add("3e_kylla", lkm);
            else
                Paivitykset.Add("3e_ei", lkm);

            // Käsittele Mallitaulukko 3f
            if (TutkintoMuullaOpintoalalla2002)
                Paivitykset.Add("3f_kylla", lkm);
            else
                Paivitykset.Add("3f_ei", lkm);

            // Käsittele Mallitaulukko 3g
            if (OpiskeluAlkuperäiselläOpintoalalla2002)
                Paivitykset.Add("3g_kylla", lkm);
            else
                Paivitykset.Add("3g_ei", lkm);

            // Käsittele Mallitaulukko 3h
            if (OpiskeluMuullaOpintoalalla2002)
                Paivitykset.Add("3h_kylla", lkm);
            else
                Paivitykset.Add("3h_ei", lkm);

            // Käsittele Mallitaulukko 4a
            if (TutkintoAlkuperäiselläJärjestäjällä)
                Paivitykset.Add("4a_tutkinto_alkuperaisella_jarjestajalla", lkm);
            else if (TutkintoMuullaJärjestäjällä)
                Paivitykset.Add("4a_tutkinto_muulla_jarjestajalla", lkm);
            else if (OpiskeluAlkuperäiselläJärjestäjällä)
                Paivitykset.Add("4a_opiskelee_alkuperaisella_jarjestajalla", lkm);
            else if (OpiskeluMuullaJärjestäjällä)
                Paivitykset.Add("4a_opiskelee_muulla_jarjestajalla", lkm);
            else if (KeskeyttänytTyöllinen)
                Paivitykset.Add("4a_keskeyttanyt_tyollinen", lkm);
            else
                Paivitykset.Add("4a_keskeyttanyt_ei_tyollinen", lkm);

            // Käsittele Mallitaulukko 4b
            if (TutkintoAlkuperäiselläJärjestäjällä)
                Paivitykset.Add("4b_tutkinto_alkuperaisella_jarjestajalla", lkm);
            else if (OpiskeluAlkuperäiselläJärjestäjällä)
                Paivitykset.Add("4b_opiskelee_alkuperaisella_jarjestajalla", lkm);
            else if (TutkintoMuullaJärjestäjällä)
                Paivitykset.Add("4b_tutkinto_muulla_jarjestajalla", lkm);
            else if (OpiskeluMuullaJärjestäjällä)
                Paivitykset.Add("4b_opiskelee_muulla_jarjestajalla", lkm);
            else if (KeskeyttänytTyöllinen)
                Paivitykset.Add("4b_keskeyttanyt_tyollinen", lkm);
            else
                Paivitykset.Add("4b_keskeyttanyt_ei_tyollinen", lkm);

            // Mallitaulukoita 4c-4d ei ole

            // Käsittele Mallitaulukko 4e
            if (TutkintoAlkuperäiselläJärjestäjällä)
                Paivitykset.Add("4e_kylla", lkm);
            else
                Paivitykset.Add("4e_ei", lkm);

            // Käsittele Mallitaulukko 4f
            if (TutkintoMuullaJärjestäjällä)
                Paivitykset.Add("4f_kylla", lkm);
            else
                Paivitykset.Add("4f_ei", lkm);

            // Käsittele Mallitaulukko 4g
            if (OpiskeluAlkuperäiselläJärjestäjällä)
                Paivitykset.Add("4g_kylla", lkm);
            else
                Paivitykset.Add("4g_ei", lkm);

            // Käsittele Mallitaulukko 4h
            if (OpiskeluMuullaJärjestäjällä)
                Paivitykset.Add("4h_kylla", lkm);
            else
                Paivitykset.Add("4h_ei", lkm);

            // Käsittele Mallitaulukko 5a
            if (TutkintoAlkuperäisessäOppilaitoksessa)
                Paivitykset.Add("5a_tutkinto_alkuperaisessa_oppilaitoksessa", lkm);
            else if (TutkintoMuussaOppilaitoksessa)
                Paivitykset.Add("5a_tutkinto_muussa_oppilaitoksessa", lkm);
            else if (OpiskeluAlkuperäisessäOppilaitoksessa)
                Paivitykset.Add("5a_opiskelee_alkuperaisessa_oppilaitoksessa", lkm);
            else if (OpiskeluMuussaOppilaitoksessa)
                Paivitykset.Add("5a_opiskelee_muussa_oppilaitoksessa", lkm);
            else if (KeskeyttänytTyöllinen)
                Paivitykset.Add("5a_keskeyttanyt_tyollinen", lkm);
            else
                Paivitykset.Add("5a_keskeyttanyt_ei_tyollinen", lkm);

            // Käsittele Mallitaulukko 5b
            if (TutkintoAlkuperäisessäOppilaitoksessa)
                Paivitykset.Add("5b_tutkinto_alkuperaisessa_oppilaitoksessa", lkm);
            else if (OpiskeluAlkuperäisessäOppilaitoksessa)
                Paivitykset.Add("5b_opiskelee_alkuperaisessa_oppilaitoksessa", lkm);
            else if (TutkintoMuussaOppilaitoksessa)
                Paivitykset.Add("5b_tutkinto_muussa_oppilaitoksessa", lkm);
            else if (OpiskeluMuussaOppilaitoksessa)
                Paivitykset.Add("5b_opiskelee_muussa_oppilaitoksessa", lkm);
            else if (KeskeyttänytTyöllinen)
                Paivitykset.Add("5b_keskeyttanyt_tyollinen", lkm);
            else
                Paivitykset.Add("5b_keskeyttanyt_ei_tyollinen", lkm);

            // Mallitaulukoita 5c-5d ei ole

            // Käsittele Mallitaulukko 5e
            if (TutkintoAlkuperäisessäOppilaitoksessa)
                Paivitykset.Add("5e_kylla", lkm);
            else
                Paivitykset.Add("5e_ei", lkm);

            // Käsittele Mallitaulukko 5f
            if (TutkintoMuussaOppilaitoksessa)
                Paivitykset.Add("5f_kylla", lkm);
            else
                Paivitykset.Add("5f_ei", lkm);

            // Käsittele Mallitaulukko 5g
            if (OpiskeluAlkuperäisessäOppilaitoksessa)
                Paivitykset.Add("5g_kylla", lkm);
            else
                Paivitykset.Add("5g_ei", lkm);

            // Käsittele Mallitaulukko 5h
            if (OpiskeluMuussaOppilaitoksessa)
                Paivitykset.Add("5h_kylla", lkm);
            else
                Paivitykset.Add("5h_ei", lkm);

            // Käsittele Mallitaulukko 6a
            if (TutkintoAlkuperäisessäMaakunnassa)
                Paivitykset.Add("6a_tutkinto_alkuperaisessa_maakunnassa", lkm);
            else if (TutkintoMuussaMaakunnassa)
                Paivitykset.Add("6a_tutkinto_muussa_maakunnassa", lkm);
            else if (OpiskeluAlkuperäisessäMaakunnassa)
                Paivitykset.Add("6a_opiskelee_alkuperaisessa_maakunnassa", lkm);
            else if (OpiskeluMuussaMaakunnassa)
                Paivitykset.Add("6a_opiskelee_muussa_maakunnassa", lkm);
            else if (KeskeyttänytTyöllinen)
                Paivitykset.Add("6a_keskeyttanyt_tyollinen", lkm);
            else
                Paivitykset.Add("6a_keskeyttanyt_ei_tyollinen", lkm);

            // Käsittele Mallitaulukko 6b
            if (TutkintoAlkuperäisessäMaakunnassa)
                Paivitykset.Add("6b_tutkinto_alkuperaisessa_maakunnassa", lkm);
            else if (OpiskeluAlkuperäisessäMaakunnassa)
                Paivitykset.Add("6b_opiskelee_alkuperaisessa_maakunnassa", lkm);
            else if (TutkintoMuussaMaakunnassa)
                Paivitykset.Add("6b_tutkinto_muussa_maakunnassa", lkm);
            else if (OpiskeluMuussaMaakunnassa)
                Paivitykset.Add("6b_opiskelee_muussa_maakunnassa", lkm);
            else if (KeskeyttänytTyöllinen)
                Paivitykset.Add("6b_keskeyttanyt_tyollinen", lkm);
            else
                Paivitykset.Add("6b_keskeyttanyt_ei_tyollinen", lkm);

            // Mallitaulukoita 6c-6d ei ole

            // Käsittele Mallitaulukko 6e
            if (TutkintoAlkuperäisessäMaakunnassa)
                Paivitykset.Add("6e_kylla", lkm);
            else
                Paivitykset.Add("6e_ei", lkm);

            // Käsittele Mallitaulukko 6f
            if (TutkintoMuussaMaakunnassa)
                Paivitykset.Add("6f_kylla", lkm);
            else
                Paivitykset.Add("6f_ei", lkm);

            // Käsittele Mallitaulukko 6g
            if (OpiskeluAlkuperäisessäMaakunnassa)
                Paivitykset.Add("6g_kylla", lkm);
            else
                Paivitykset.Add("6g_ei", lkm);

            // Käsittele Mallitaulukko 6h
            if (OpiskeluMuussaMaakunnassa)
                Paivitykset.Add("6h_kylla", lkm);
            else
                Paivitykset.Add("6h_ei", lkm);

            // Käsittele Mallitaulukko 7a
            if (TutkintoAlkuperäiselläKoulutussektorilla)
                Paivitykset.Add("7a_tutkinto_alkuperaisella_koulutussektorilla", lkm);
            else if (TutkintoMuullaKoulutussektorilla)
                Paivitykset.Add("7a_tutkinto_muulla_koulutussektorilla", lkm);
            else if (OpiskeluAlkuperäiselläKoulutussektorilla)
                Paivitykset.Add("7a_opiskelee_alkuperaisella_koulutussektorilla", lkm);
            else if (OpiskeluMuullaKoulutussektorilla)
                Paivitykset.Add("7a_opiskelee_muulla_koulutussektorilla", lkm);
            else if (KeskeyttänytTyöllinen)
                Paivitykset.Add("7a_keskeyttanyt_tyollinen", lkm);
            else
                Paivitykset.Add("7a_keskeyttanyt_ei_tyollinen", lkm);

            // Käsittele Mallitaulukko 7b
            if (TutkintoAlkuperäiselläKoulutussektorilla)
                Paivitykset.Add("7b_tutkinto_alkuperaisella_koulutussektorilla", lkm);
            else if (OpiskeluAlkuperäiselläKoulutussektorilla)
                Paivitykset.Add("7b_opiskelee_alkuperaisella_koulutussektorilla", lkm);
            else if (TutkintoMuullaKoulutussektorilla)
                Paivitykset.Add("7b_tutkinto_muulla_koulutussektorilla", lkm);
            else if (OpiskeluMuullaKoulutussektorilla)
                Paivitykset.Add("7b_opiskelee_muulla_koulutussektorilla", lkm);
            else if (KeskeyttänytTyöllinen)
                Paivitykset.Add("7b_keskeyttanyt_tyollinen", lkm);
            else
                Paivitykset.Add("7b_keskeyttanyt_ei_tyollinen", lkm);

            // Mallitaulukoita 7c-7d ei ole

            // Käsittele Mallitaulukko 7e
            if (TutkintoAlkuperäiselläKoulutussektorilla)
                Paivitykset.Add("7e_kylla", lkm);
            else
                Paivitykset.Add("7e_ei", lkm);

            // Käsittele Mallitaulukko 7f
            if (TutkintoMuullaKoulutussektorilla)
                Paivitykset.Add("7f_kylla", lkm);
            else
                Paivitykset.Add("7f_ei", lkm);

            // Käsittele Mallitaulukko 7g
            if (OpiskeluAlkuperäiselläKoulutussektorilla)
                Paivitykset.Add("7g_kylla", lkm);
            else
                Paivitykset.Add("7g_ei", lkm);

            // Käsittele Mallitaulukko 7h
            if (OpiskeluMuullaKoulutussektorilla)
                Paivitykset.Add("7h_kylla", lkm);
            else
                Paivitykset.Add("7h_ei", lkm);

            // Käsittele Mallitaulukko 8a
            if (TutkintoAlkuperäiselläOpintoalalla1995)
                Paivitykset.Add("8a_tutkinto_alkuperaisella_opintoalalla_1995", lkm);
            else if (TutkintoMuullaOpintoalalla1995)
                Paivitykset.Add("8a_tutkinto_muulla_opintoalalla_1995", lkm);
            else if (OpiskeluAlkuperäiselläOpintoalalla1995)
                Paivitykset.Add("8a_opiskelee_alkuperaisella_opintoalalla_1995", lkm);
            else if (OpiskeluMuullaOpintoalalla1995)
                Paivitykset.Add("8a_opiskelee_muulla_opintoalalla_1995", lkm);
            else if (KeskeyttänytTyöllinen)
                Paivitykset.Add("8a_keskeyttanyt_tyollinen", lkm);
            else
                Paivitykset.Add("8a_keskeyttanyt_ei_tyollinen", lkm);

            // Käsittele Mallitaulukko 8b
            if (TutkintoAlkuperäiselläOpintoalalla1995)
                Paivitykset.Add("8b_tutkinto_alkuperaisella_opintoalalla_1995", lkm);
            else if (OpiskeluAlkuperäiselläOpintoalalla1995)
                Paivitykset.Add("8b_opiskelee_alkuperaisella_opintoalalla_1995", lkm);
            else if (TutkintoMuullaOpintoalalla1995)
                Paivitykset.Add("8b_tutkinto_muulla_opintoalalla_1995", lkm);
            else if (OpiskeluMuullaOpintoalalla1995)
                Paivitykset.Add("8b_opiskelee_muulla_opintoalalla_1995", lkm);
            else if (KeskeyttänytTyöllinen)
                Paivitykset.Add("8b_keskeyttanyt_tyollinen", lkm);
            else
                Paivitykset.Add("8b_keskeyttanyt_ei_tyollinen", lkm);

            // Mallitaulukoita 8c-8d ei ole

            // Käsittele Mallitaulukko 8e
            if (TutkintoAlkuperäiselläOpintoalalla1995)
                Paivitykset.Add("8e_kylla", lkm);
            else
                Paivitykset.Add("8e_ei", lkm);

            // Käsittele Mallitaulukko 8f
            if (TutkintoMuullaOpintoalalla1995)
                Paivitykset.Add("8f_kylla", lkm);
            else
                Paivitykset.Add("8f_ei", lkm);

            // Käsittele Mallitaulukko 8g
            if (OpiskeluAlkuperäiselläOpintoalalla1995)
                Paivitykset.Add("8g_kylla", lkm);
            else
                Paivitykset.Add("8g_ei", lkm);

            // Käsittele Mallitaulukko 8h
            if (OpiskeluMuullaOpintoalalla1995)
                Paivitykset.Add("8h_kylla", lkm);
            else
                Paivitykset.Add("8h_ei", lkm);

            // Käsittele Mallitaulukko 9a
            if (TutkintoAlkuperäiselläKoulutusalalla1)
                Paivitykset.Add("9a_tutkinto_alkuperaisella_koulutusalalla1", lkm);
            else if (TutkintoMuullaKoulutusalalla1)
                Paivitykset.Add("9a_tutkinto_muulla_koulutusalalla1", lkm);
            else if (OpiskeluAlkuperäiselläKoulutusalalla1)
                Paivitykset.Add("9a_opiskelee_alkuperaisella_koulutusalalla1", lkm);
            else if (OpiskeluMuullaKoulutusalalla1)
                Paivitykset.Add("9a_opiskelee_muulla_koulutusalalla1", lkm);
            else if (KeskeyttänytTyöllinen)
                Paivitykset.Add("9a_keskeyttanyt_tyollinen", lkm);
            else
                Paivitykset.Add("9a_keskeyttanyt_ei_tyollinen", lkm);

            // Käsittele Mallitaulukko 9b
            if (TutkintoAlkuperäiselläKoulutusalalla1)
                Paivitykset.Add("9b_tutkinto_alkuperaisella_koulutusalalla1", lkm);
            else if (OpiskeluAlkuperäiselläKoulutusalalla1)
                Paivitykset.Add("9b_opiskelee_alkuperaisella_koulutusalalla1", lkm);
            else if (TutkintoMuullaKoulutusalalla1)
                Paivitykset.Add("9b_tutkinto_muulla_koulutusalalla1", lkm);
            else if (OpiskeluMuullaKoulutusalalla1)
                Paivitykset.Add("9b_opiskelee_muulla_koulutusalalla1", lkm);
            else if (KeskeyttänytTyöllinen)
                Paivitykset.Add("9b_keskeyttanyt_tyollinen", lkm);
            else
                Paivitykset.Add("9b_keskeyttanyt_ei_tyollinen", lkm);

            // Mallitaulukoita 9c-9d ei ole

            // Käsittele Mallitaulukko 9e
            if (TutkintoAlkuperäiselläKoulutusalalla1)
                Paivitykset.Add("9e_kylla", lkm);
            else
                Paivitykset.Add("9e_ei", lkm);

            // Käsittele Mallitaulukko 9f
            if (TutkintoMuullaKoulutusalalla1)
                Paivitykset.Add("9f_kylla", lkm);
            else
                Paivitykset.Add("9f_ei", lkm);

            // Käsittele Mallitaulukko 9g
            if (OpiskeluAlkuperäiselläKoulutusalalla1)
                Paivitykset.Add("9g_kylla", lkm);
            else
                Paivitykset.Add("9g_ei", lkm);

            // Käsittele Mallitaulukko 9h
            if (OpiskeluMuullaKoulutusalalla1)
                Paivitykset.Add("9h_kylla", lkm);
            else
                Paivitykset.Add("9h_ei", lkm);

            // Käsittele Mallitaulukko 10a
            if (TutkintoAlkuperäiselläKoulutusalalla2)
                Paivitykset.Add("10a_tutkinto_alkuperaisella_koulutusalalla2", lkm);
            else if (TutkintoMuullaKoulutusalalla2)
                Paivitykset.Add("10a_tutkinto_muulla_koulutusalalla2", lkm);
            else if (OpiskeluAlkuperäiselläKoulutusalalla2)
                Paivitykset.Add("10a_opiskelee_alkuperaisella_koulutusalalla2", lkm);
            else if (OpiskeluMuullaKoulutusalalla2)
                Paivitykset.Add("10a_opiskelee_muulla_koulutusalalla2", lkm);
            else if (KeskeyttänytTyöllinen)
                Paivitykset.Add("10a_keskeyttanyt_tyollinen", lkm);
            else
                Paivitykset.Add("10a_keskeyttanyt_ei_tyollinen", lkm);

            // Käsittele Mallitaulukko 10b
            if (TutkintoAlkuperäiselläKoulutusalalla2)
                Paivitykset.Add("10b_tutkinto_alkuperaisella_koulutusalalla2", lkm);
            else if (OpiskeluAlkuperäiselläKoulutusalalla2)
                Paivitykset.Add("10b_opiskelee_alkuperaisella_koulutusalalla2", lkm);
            else if (TutkintoMuullaKoulutusalalla2)
                Paivitykset.Add("10b_tutkinto_muulla_koulutusalalla2", lkm);
            else if (OpiskeluMuullaKoulutusalalla2)
                Paivitykset.Add("10b_opiskelee_muulla_koulutusalalla2", lkm);
            else if (KeskeyttänytTyöllinen)
                Paivitykset.Add("10b_keskeyttanyt_tyollinen", lkm);
            else
                Paivitykset.Add("10b_keskeyttanyt_ei_tyollinen", lkm);

            // Mallitaulukoita 10c-10d ei ole

            // Käsittele Mallitaulukko 10e
            if (TutkintoAlkuperäiselläKoulutusalalla2)
                Paivitykset.Add("10e_kylla", lkm);
            else
                Paivitykset.Add("10e_ei", lkm);

            // Käsittele Mallitaulukko 10f
            if (TutkintoMuullaKoulutusalalla2)
                Paivitykset.Add("10f_kylla", lkm);
            else
                Paivitykset.Add("10f_ei", lkm);

            // Käsittele Mallitaulukko 10g
            if (OpiskeluAlkuperäiselläKoulutusalalla2)
                Paivitykset.Add("10g_kylla", lkm);
            else
                Paivitykset.Add("10g_ei", lkm);

            // Käsittele Mallitaulukko 10h
            if (OpiskeluMuullaKoulutusalalla2)
                Paivitykset.Add("10h_kylla", lkm);
            else
                Paivitykset.Add("10h_ei", lkm);

            // Käsittele Mallitaulukko 11a
            if (TutkintoAlkuperäiselläKoulutusalalla3)
                Paivitykset.Add("11a_tutkinto_alkuperaisella_koulutusalalla3", lkm);
            else if (TutkintoMuullaKoulutusalalla3)
                Paivitykset.Add("11a_tutkinto_muulla_koulutusalalla3", lkm);
            else if (OpiskeluAlkuperäiselläKoulutusalalla3)
                Paivitykset.Add("11a_opiskelee_alkuperaisella_koulutusalalla3", lkm);
            else if (OpiskeluMuullaKoulutusalalla3)
                Paivitykset.Add("11a_opiskelee_muulla_koulutusalalla3", lkm);
            else if (KeskeyttänytTyöllinen)
                Paivitykset.Add("11a_keskeyttanyt_tyollinen", lkm);
            else
                Paivitykset.Add("11a_keskeyttanyt_ei_tyollinen", lkm);

            // Käsittele Mallitaulukko 11b
            if (TutkintoAlkuperäiselläKoulutusalalla3)
                Paivitykset.Add("11b_tutkinto_alkuperaisella_koulutusalalla3", lkm);
            else if (OpiskeluAlkuperäiselläKoulutusalalla3)
                Paivitykset.Add("11b_opiskelee_alkuperaisella_koulutusalalla3", lkm);
            else if (TutkintoMuullaKoulutusalalla3)
                Paivitykset.Add("11b_tutkinto_muulla_koulutusalalla3", lkm);
            else if (OpiskeluMuullaKoulutusalalla3)
                Paivitykset.Add("11b_opiskelee_muulla_koulutusalalla3", lkm);
            else if (KeskeyttänytTyöllinen)
                Paivitykset.Add("11b_keskeyttanyt_tyollinen", lkm);
            else
                Paivitykset.Add("11b_keskeyttanyt_ei_tyollinen", lkm);

            // Mallitaulukoita 11c-11d ei ole

            // Käsittele Mallitaulukko 11e
            if (TutkintoAlkuperäiselläKoulutusalalla3)
                Paivitykset.Add("11e_kylla", lkm);
            else
                Paivitykset.Add("11e_ei", lkm);

            // Käsittele Mallitaulukko 11f
            if (TutkintoMuullaKoulutusalalla3)
                Paivitykset.Add("11f_kylla", lkm);
            else
                Paivitykset.Add("11f_ei", lkm);

            // Käsittele Mallitaulukko 11g
            if (OpiskeluAlkuperäiselläKoulutusalalla3)
                Paivitykset.Add("11g_kylla", lkm);
            else
                Paivitykset.Add("11g_ei", lkm);

            // Käsittele Mallitaulukko 11h
            if (OpiskeluMuullaKoulutusalalla3)
                Paivitykset.Add("11h_kylla", lkm);
            else
                Paivitykset.Add("11h_ei", lkm);

            // Palauta päivitykset kutsujalle
            Paivitykset.Add("lkm", lkm);
            return Paivitykset;
        }

        public DataTable fillDataTable(string connectionString)
        {
            string query = "SELECT TOP 0 * FROM [VipunenTK_DW].[dbo].[_aloittaneiden_lapaisy_lasketut_sarakkeet]";

            using (SqlConnection sqlConn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, sqlConn))
            {
                sqlConn.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                sqlConn.Close();
                return dt;
            }
        }
    }
}
