import requests
r = requests.post("http://127.0.0.1/dev_portal/trunk/api/api_login/login.php", data={'username': 'mavin1si',  'password': 'dd12344'})
print(r.status_code, r.reason)
print(r.text[:300] + '...')
