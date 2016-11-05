import requests
r = requests.post("http://127.0.0.1/dev_portal/trunk/api/load_data/load_file.php", data={ 'fees_id'  : '25'})
print(r.status_code, r.reason)
print(r.text[:300] + '...')
