from bs4 import BeautifulSoup
import urllib.request
import pandas as pd
import datetime

from selenium import webdriver
import time

from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options

# 크롬 드라이버 자동 업데이트 : V.4
from webdriver_manager.chrome import ChromeDriverManager

# 브라우저 꺼짐 방지
chrome_options = Options()
chrome_options.add_experimental_option("detach", True)

# 불필요한 에러 메시지 없애기
chrome_options.add_experimental_option("excludeSwitches", ["enable-logging"])

service = Service(executable_path=ChromeDriverManager().install())
wd = webdriver.Chrome(service=service, options=chrome_options)

CoffeeBean_URL = "https://www.coffeebeankorea.com/store/store.asp"
wd.get(CoffeeBean_URL)

wd.execute_script("storePop2(390)")

html = wd.page_source

html = '<div class="store_txt"><h2>고대안암병원신관점</h2><p class="tag"><span class="decaf" title="디카페인">디카페인</span><span class="soy" title="두유">두유</span><span class="wifi" title="와이파이">와이파이</span></p><table class="store_table"><tbody><tr><th>영업시간</th><td> l 월~금 07:00~22:00 l 주말,공휴일 09:00~20:00 l </td></tr><tr><th>주차</th><td></td></tr><tr><th>주소</th><td>서울특별시 성북구 고려대로 73  <!--span class="lot">(서울특별시 성북구 고려대로 73)</span--></td></tr><tr><th>전화번호</th><td>02-544-6823</td></tr></tbody><tbody></tbody></table></div>'
soupCB1 = BeautifulSoup(html, 'html.parser')
print(soupCB1.prettify())

store_name_h2 = soupCB1.select("div.store_txt > h2")
store_name_h2

store_name = store_name_h2[0].string
store_name

store_info = soupCB1.select("div.store_txt > table.store_table > tbody > tr > td")
store_info
store_address_list = list(store_info[2])
store_address_list
store_address = store_address_list[0]
store_address

store_phone = store_info[3].string
store_phone


