#!/usr/bin/env python
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

driver = webdriver.Firefox()
driver.get("https://www.themusiczoo.com/cgi-bin/commconfig.cgi?login=action")

# Put the cursor in the search box, enter SKU, hit "enter"
WebDriverWait(driver, 15).until(EC.title_is("PDG Commerce Administrator"))

search_box = driver.find_element_by_id("pdg-qsearch-text")
search_box.send_keys("25422") #sku_input would go here
search_box.send_keys(Keys.RETURN)