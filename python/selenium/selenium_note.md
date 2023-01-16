```py
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


# 自己更新chrome驅動
browser = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
browser.get("https://www.land.tycg.gov.tw/chaspx/SQry5.aspx/11")
# switch_to frame 切換框架
bb = browser.find_element(By.XPATH, '//*[@id="basic1"]/div/div[2]/iframe')
browser.switch_to.frame(bb)
browser.find_element(By.ID, 'RButton2').click()
# 退出框架
browser.switch_to.default_content()




```