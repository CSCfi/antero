import time
import pandas as pd
from selenium import webdriver
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Options for Jenkins
options = Options()
options.headless = True

# Open firefox
driver = webdriver.Firefox(options=options)

# Helper function to wait for element and return it
def wait_for_element(by, value, timeout=10):
    return WebDriverWait(driver, timeout).until(
        EC.presence_of_element_located((by, value))
    )

# Main function
def get_reports(language):
    if language == "fi":
        lang = "fi-fi"
        folder = "Raportit"
        hidden_pages = [
            {
                "section_menu": "Esi- ja perusopetus",
                "subsection_menu": "Ainevalinnat 2000–2019",
                "url": "https://vipunen.fi/fi-fi/perus/Sivut/Ainevalinnat-2000-2019.aspx"
            },
            {
                "section_menu": "Esi- ja perusopetus",
                "subsection_menu": "Perusopetuksen lisäopetuksen päättäneiden sijoittuminen 2009–2021",
                "url": "https://vipunen.fi/fi-fi/perus/Sivut/Perusopetuksen-lisäopetuksen-päättäneiden-sijoittuminen-2009-2018.aspx"
            },
            {
                "section_menu": "Lukiokoulutus",
                "subsection_menu": "Ainevalinnat 2010–2017",
                "url": "https://vipunen.fi/fi-fi/lukio/Sivut/Ainevalinnat-2010-2017.aspx"
            },
            {
                "section_menu": "Ammattikorkeakoulutus",
                "subsection_menu": "Taloustiedot 2014-2018",
                "url": "https://vipunen.fi/fi-fi/amk/Sivut/taloustiedot-2014-2018.aspx"
            },
            {
                "section_menu": "Yliopistokoulutus",
                "subsection_menu": "Taloustiedot 2014-2018",
                "url": "https://vipunen.fi/fi-fi/yliopisto/Sivut/Taloustiedot-2012-2018.aspx"
            },
            {
                "section_menu": "Korkeakoulutus ja t&k-toiminta",
                "subsection_menu": "Bibliometriikka (Scopus)",
                "url": "https://vipunen.fi/fi-fi/kkyhteiset/Sivut/Bibliometriikka-(Scopus).aspx"
            }
        ]
    elif language == "sv":
        lang = "sv-fi"
        folder = "Rapporter"
        hidden_pages = [
            {
                "section_menu": "Förskoleundervisning och grundläggande utbildning",
                "subsection_menu": "Ämnesval 2000–2019",
                "url": "https://vipunen.fi/sv-fi/grundlaggande/Sidor/Ainevalinnat-2000-2019.aspx"
            }
        ]
    elif language == "en":
        lang = "en-gb"
        folder = "Reports"
        hidden_pages = []
    else:
        return 0

    # Open front page
    driver.get("https://vipunen.fi/" + lang)  
    time.sleep(5)
    
    #  Section names and links from zz2_RootAspMenu
    section_menu = wait_for_element(By.ID, "zz2_RootAspMenu")
    section_links = section_menu.find_elements(By.TAG_NAME, "a")
    
    # Link list
    first_level_links = []
    for a in section_links:
        href = a.get_attribute("href")
        if href:
            text_element = a.find_element(By.CLASS_NAME, "menu-item-text")
            link_text = text_element.text.strip() if text_element else ""
            first_level_links.append({"url": href, "text": link_text})
    
    # Dataframe for results
    xlsb_rows = []
    visualization_rows = []
    
    # Loop trough sections
    for section_link in first_level_links:
        driver.get(section_link["url"])
        time.sleep(2)
    
        section_text = section_link["text"]
    
        # Subsection names and links from zz4_RootAspMenu
        try:
            subsection_menu = wait_for_element(By.ID, "zz4_RootAspMenu", timeout=5)
            subsection_links = subsection_menu.find_elements(By.TAG_NAME, "a")
            second_level_links = []
            for a in subsection_links:
                href = a.get_attribute("href")
                if href:
                    text_element = a.find_element(By.CLASS_NAME, "menu-item-text")
                    link_text = text_element.text.strip() if text_element else ""
                    second_level_links.append({"url": href, "text": link_text})
        except:
            second_level_links = []
    
        # Loop through subsections
        for subsection_link in second_level_links:
            driver.get(subsection_link["url"])
            time.sleep(2)
    
            try:
                subsection_title = driver.find_element(By.CLASS_NAME, "vipunen-title")
                subsection_name = subsection_title.text.strip()
            except Exception:
                subsection_name = subsection_link["text"]
    
            # Find xlsb links from the subsection
            all_links = driver.find_elements(By.TAG_NAME, "a")
            for a in all_links:
                href = a.get_attribute("href")
                if href:
                    if "/" + lang + "/" + folder + "/" in href:
                        start = href.find("/" + lang + "/" + folder + "/")
                        end = href.find(".xlsb") + len(".xlsb")
                        clean_href = href[start:end].split(folder + "/")[-1].replace("%20", " ").replace("%C3%A4", "ä").replace("%C3%B6", "ö").replace("%28", "(").replace("%29", ")")
                        text = a.text.strip()
                        xlsb_rows.append({
                            "Raportti": clean_href,
                            "Osio": section_text,
                            "Alaosio": subsection_name,
                            "Näkökulma": text
                        })
                    elif "&file=" in href:
                        start = href.find("&file=") + len("&file=")
                        end = href.find(".xlsb") + len(".xlsb")
                        clean_href = href[start:end].split("&file=")[-1].replace("%20", " ").replace("%C3%A4", "ä").replace("%C3%B6", "ö").replace("%28", "(").replace("%29", ")")
                        text = a.text.strip()
                        xlsb_rows.append({
                            "Raportti": clean_href,
                            "Osio": section_text,
                            "Alaosio": subsection_name,
                            "Näkökulma": text
                        })
                    elif "app.powerbi.com" in href:
                        start = href.find("https://app.powerbi.com")
                        end = href.find("MiOjh9") + len("MiOjh9")
                        clean_href = href[start:end]
                        text = a.text.strip()
                        text = text.split('\n', 1)[1] if '\n' in text else text
                        visualization_rows.append({
                            "Visualisointi": clean_href,
                            "Osio": section_text,
                            "Alaosio": subsection_name,
                            "Näkökulma": text
                        })
                    else:
                        continue
                
									  
											   
											 
												   
										   
					  
     
    # Hidden pages  
    if len(hidden_pages) > 0:
        for page in hidden_pages:
            driver.get(page["url"])
            time.sleep(2)
        
            section_text = page["section_menu"]
            subsection_text = page["subsection_menu"]
        
            all_links = driver.find_elements(By.TAG_NAME, "a")
            for a in all_links:
                href = a.get_attribute("href")
                if href:
                    if "/" + lang + "/" + folder + "/" in href:
                        start = href.find("/" + lang + "/" + folder + "/")
                        end = href.find(".xlsb") + len(".xlsb")
                        clean_href = href[start:end].split(folder + "/")[-1].replace("%20", " ").replace("%C3%A4", "ä").replace("%C3%B6", "ö").replace("%28", "(").replace("%29", ")")
                        text = a.text.strip()
                        xlsb_rows.append({
                            "Raportti": clean_href,
                            "Osio": section_text,
                            "Alaosio": subsection_text,
                            "Näkökulma": text
                        })
                    elif "&file=" in href:
                        start = href.find("&file=") + len("&file=")
                        end = href.find(".xlsb") + len(".xlsb")
                        clean_href = href[start:end].split("&file=")[-1].replace("%20", " ").replace("%C3%A4", "ä").replace("%C3%B6", "ö").replace("%28", "(").replace("%29", ")")
                        text = a.text.strip()
                        xlsb_rows.append({
                            "Raportti": clean_href,
                            "Osio": section_text,
                            "Alaosio": subsection_text,
                            "Näkökulma": text
                        })
                    elif "app.powerbi.com" in href:
                        start = href.find("https://app.powerbi.com")
                        end = href.find("MiOjh9") + len("MiOjh9")
                        clean_href = href[start:end]
                        text = a.text.strip()
                        text = text.split('\n', 1)[1] if '\n' in text else text
                        visualization_rows.append({
                            "Visualisointi": clean_href,
                            "Osio": section_text,
                            "Alaosio": subsection_text,
                            "Näkökulma": text
                        })
                    else:
                        continue
        
									  
											   
											 
												   
										   
					  
            
    # Save results into csv
    df = pd.DataFrame(xlsb_rows)
    df = df[df["Raportti"].notna() & (df["Raportti"] != "")]
    df.to_csv("D:/pdi_integrations/data/vipunen/raportit/Raportit_" + language + ".csv", index=False, sep=";", encoding="utf-8-sig")
    df2 = pd.DataFrame(visualization_rows)
    df2 = df2[df2["Visualisointi"].notna() & (df2["Visualisointi"] != "")]
    df2.to_csv("D:/pdi_integrations/data/vipunen/raportit/Visualisoinnit_" + language + ".csv", index=False, sep=";", encoding="utf-8-sig")
    
    return df.shape[0] + df2.shape[0]

rows_fi = get_reports("fi")
print(str(rows_fi) + " finnish report links")
rows_sv = get_reports("sv")
print(str(rows_sv) + " swedish report links")
rows_en = get_reports("en")
print(str(rows_en) + " english report links")

# Close firefox
driver.quit()