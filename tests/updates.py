import requests

headers = {
    "accept": "*/*",
    "accept-encoding": "gzip, deflate, br",
    "accept-language": "en-GB,en-US;q=0.9,en;q=0.8",
    "app-version": "1000000",
    "connection": "keep-alive",
    "content-type": "application/json",
    "dnt": "1",
    "host": "api.gotinder.com",
    "origin": "https://tinder.com",
    "platform": "web",
    "referer": "https://tinder.com",
    "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36",
    "x-auth-token": "4c1e5596-3679-4c5d-83c0-783e57349a12"
}

payload = {
    "last_activity_date": "2017-08-19T07:20:26.124Z"
}

#r = requests.post("http://localhost:7777/recs/core?locale=en-GB", headers=headers)
#print(r.json())
r = requests.post("https://api.gotinder.com/updates?locale=en-GB", headers=headers, json=payload)
print(r.json())
