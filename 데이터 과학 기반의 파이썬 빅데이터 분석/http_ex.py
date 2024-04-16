import requests
response = requests.get("https://google.com")
response.status_code
response = requests.get("https://google.com/user/")