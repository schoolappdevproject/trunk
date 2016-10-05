import requests
r = requests.post("http://127.0.0.1/dev_portal/trunk/api/save_data/save_review_comments.php", data={ 
                                "school_id"         : "1",
                                "user_id"   	    :  "20",
                                "title"             : "Annual Day Sports Meet",
                                "text_review"       : "dkfhaskdhkjsahdksahdkhjsadj sakjdhksajhd skjdhksadhakshd sakdhsadhksajh",
                                "id_review_atach"   : "1"
							})
print(r.status_code, r.reason)
print(r.text[:300] + '...')
