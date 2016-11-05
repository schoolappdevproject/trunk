
select tbl_review_data.id_review_data,
	tbl_review_data.review_date,
	tbl_review_data.tbl_review_title,
	tbl_review_data.tbl_review_text,
	tbl_users.username
	from tbl_review_data,tbl_users  
where tbl_review_data.id_user_data = tbl_users.user_id 
	and tbl_review_data.id_school = 1;

