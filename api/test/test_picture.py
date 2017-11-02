import requests
r = requests.post("http://localhost:8888/school_app/api/image_upload/getImageNames.php", data={ 'school_id'  : '2'	})
print(r.status_code, r.reason)
print(r.text[:300] + '...')
