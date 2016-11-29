
SELECT
tbl_school_main_table.school_id,
tbl_school_main_table.address, 
tbl_school_main_table.school_name,
tbl_school_main_table.latitude, 
tbl_school_main_table.longitude ,
tbl_school_main_table.city, 
tbl_school_main_table.session_timmings,
tbl_school_main_table.category,
tbl_school_main_table.school_type,
tbl_school_main_table.courses,
tbl_school_main_table.school_size,
tbl_school_main_table.board, 
tbl_school_main_table.medium_of_teaching,
tbl_school_main_table.mobility,
tbl_school_main_table.small_description,
tbl_school_main_table.religous_preference,
tbl_school_main_table.profile_pic_data,
round(avg(tbl_ratings_table.rating_points)) 
FROM tbl_school_main_table left outer join tbl_ratings_table 
on tbl_school_main_table.school_id = tbl_ratings_table.id_school;

