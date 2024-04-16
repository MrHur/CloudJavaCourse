# pip install selenium
# pip install webdriver-manager

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

#[CODE 1]
def CoffeeBean_store(result):
    CoffeeBean_URL = "https://www.coffeebeankorea.com/store/store.asp"
    wd = webdriver.Chrome(service=service, options=chrome_options)
             
    for i in range(1, 30):  #370, 매장 수 만큼 반복
        # print(i)
        wd.get(CoffeeBean_URL)
        time.sleep(1)  #웹페이지 연결할 동안 1초 대기
        try:
            wd.execute_script("storePop2(%d)" %i)
            #execute_script("스크립트", 요소)	해당 페이지에 스크립트를 만들 때 사용합니다. 
            # 요소는 필수 파라미터는 아니고 요소가 있으면 요소에 스크립트가 실행되고 없으면 
            # 전체 페이지에 스크립트가 움직입니다.
            time.sleep(1) #스크립트 실행 할 동안 1초 대기
            html = wd.page_source  #page_source: 브라우저에 보이는 그대로의 HTML, 크롬 개발자 도구의 Element 탭 내용과 동일.
            soupCB = BeautifulSoup(html, 'html.parser')
            store_name_h2 = soupCB.select("div.store_txt > h2")
            store_name = store_name_h2[0].string
            print(store_name)  #매장 이름 출력하기
            store_info = soupCB.select("div.store_txt > table.store_table > tbody > tr > td")
            store_address_list = list(store_info[2])
            store_address = store_address_list[0]
            store_phone = store_info[3].string
            result.append([store_name]+[store_address]+[store_phone])
        except:
            continue 
    return

#[CODE 0]
def main():
    result = []
    print('CoffeeBean store crawling >>>>>>>>>>>>>>>>>>>>>>>>>>')
    CoffeeBean_store(result)  #[CODE 1]
    
    CB_tbl = pd.DataFrame(result, columns=('store', 'address','phone'))
    CB_tbl.to_csv('CoffeeBean.csv', encoding='cp949', mode='w', index=True)

if __name__ == '__main__':
     main()
