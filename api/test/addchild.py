import requests
r = requests.post("http://127.0.0.1/dev_portal/trunk/api/save_data/save_child_data.php", data={'child_name': 'djfhksjdhkfhjds', 'child_age': '45', 'user_name': 'mavin20'})
print(r.status_code, r.reason)
print(r.text[:300] + '...')
