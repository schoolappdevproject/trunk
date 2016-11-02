import requests
r = requests.post("http://ec2-54-255-166-165.ap-southeast-1.compute.amazonaws.com//test/trunk/api/save_data/save_fees_data.php", data={ 
                                "id_school"         : "1",
                                "user_id"   	    :  "20",
                                "standard"             : "1",
                                "fees_text"       : "dkfhaskdhkjsahdksahdkhjsadj sakjdhksajhd skjdhksadhakshd sakdhsadhksajh"})
print(r.status_code, r.reason)
print(r.text[:300] + '...')
