import requests
r = requests.post("http://127.0.0.1/dev_portal/trunk/api/load_data/load_school_average_rating.php", data={ 'school_id'  : '1'	})
print(r.status_code, r.reason)
print(r.text[:300] + '...')
