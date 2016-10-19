import requests
r = requests.post("http://127.0.0.1/dev_portal/trunk/api/load_data/load_prof_pic.php", data={ 'user_id'  : '21'	})
print(r.status_code, r.reason)
print(r.text[:300] + '...')
