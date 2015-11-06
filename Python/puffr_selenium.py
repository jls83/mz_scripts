#!/usr/bin/env python
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

sku_input = input("SKU: ")

driver = webdriver.Firefox() #opens Firefox
driver.get("https://www.themusiczoo.com/cgi-bin/commconfig.cgi?login=action") #goes to PDG login
WebDriverWait(driver, 15).until(EC.title_is("PDG Commerce Administrator")) #waits for password to be entered

# Put the cursor in the search box, enter SKU, hit "enter"

search_box = driver.find_element_by_id("pdg-qsearch-text") #sets search_box as variable, places cursor in box
search_box.send_keys(sku_input) #sku_input would go here
search_box.send_keys(Keys.RETURN)