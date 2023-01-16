```py
import requests
from bs4 import BeautifulSoup
from lxml import etree

url = 'http://forum.gameznetwork.com/threads/update-12-16-2022.241215/'
res = requests.get(url)
soup = BeautifulSoup(res.text, "html.parser")
# find指定要找的節點
reds = soup.find_all('div', class_='bbCodeBlock bbCodeCode')
patch_str = reds[0].pre.text
# 參考
# https://www.learncodewithmike.com/2020/02/python-beautifulsoup-web-scraper.html

```