import requests
r = requests.post("http://127.0.0.1/dev_portal/trunk/api/save_data/save_child_school.php", data={ 
				"id"             : 1,
                                "name"           : "sdsadsa",
                                "std"            : "10",
                                "rate_study"     : "1",
                                "rate_lab"       : "1",
                                "rate_sports"    : "1",
                                "rate_lib"       : "1",
                                "rate_teacher"   : "1",
                                "period_start"   : "5",
                                "period_end"     : "10",
                                "brief_intro"    : "Good School",
                                "admin_intro"    : "Good admision",
                                "username"       : "mavin20",
				"child_id"       : "8"
							})
print(r.status_code, r.reason)
print(r.text[:300] + '...')
