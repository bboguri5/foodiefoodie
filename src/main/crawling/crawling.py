from urllib.request import urlretrieve
from urllib.parse import quote_plus    
from bs4 import BeautifulSoup as BS   

from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By

keyword = input("Image Name : ")  
i_URL = f'https://www.google.com/search?q={quote_plus(keyword)}&newwindow=1&sxsrf=ALiCzsZwQuPdbGxn-D118hUJ_16Ht0qmyQ:1660808230278&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjc-uvk8M_5AhUNAN4KHSv1CDAQ_AUoAXoECAIQAw&biw=1536&bih=714&dpr=1.25'
options = webdriver.ChromeOptions()
driver=webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=options) #크롬 드라이버
options.add_experimental_option('excludeSwitches', ['enable-logging'])
driver.get(i_URL)

driver.find_element(By.CSS_SELECTOR, 'div.igM9Le').click()

html = driver.page_source
soup = BS(html,features="html.parser")

img = soup.select('img')

i_list = []
count = 1

print("Searching...")
for i in img:
   try:
      i_list.append(i.attrs["src"])
   except KeyError:
      i_list.append(i.attrs["data-src"])

print("Downloading...")
# for i in i_list:
#    urlretrieve(i,"download/"+keyword+str(count)+".jpg")
#    count+=1

driver.close()
print("FINISH")