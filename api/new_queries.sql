
ALTER TABLE `tbl_blog_data` ADD FOREIGN KEY ( `id_user_data` ) REFERENCES `school_db`.`tbl_users` (
`user_id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `tbl_blog_data` ADD FOREIGN KEY ( `id_blog_attachment` ) REFERENCES `school_db`.`tbl_blog_attachment` (
`id_blog_attachment`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `tbl_blog_data` ADD FOREIGN KEY ( `id_school` ) REFERENCES `school_db`.`tbl_school_main_table` (
`school_id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `picture` ADD FOREIGN KEY ( `id_school` ) REFERENCES `school_db`.`tbl_school_main_table` (
`school_id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `picture` ADD FOREIGN KEY ( `id_user` ) REFERENCES `school_db`.`tbl_users` (
`user_id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `tbl_comments_table` ADD FOREIGN KEY ( `id_blog` ) REFERENCES `school_db`.`tbl_blog_data` (
`id_blog_data`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `tbl_comments_table` ADD FOREIGN KEY ( `user_id` ) REFERENCES `school_db`.`tbl_users` (
`user_id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `tbl_likes_blogs` ADD FOREIGN KEY ( `id_blog` ) REFERENCES `school_db`.`tbl_blog_data` (
`id_blog_data`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `tbl_likes_blogs` ADD FOREIGN KEY ( `id_user` ) REFERENCES `school_db`.`tbl_users` (
`user_id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `tbl_likes_reviews` ADD FOREIGN KEY ( `id_review` ) REFERENCES `school_db`.`tbl_review_data` (
`id_review_data`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `tbl_likes_reviews` ADD FOREIGN KEY ( `id_users` ) REFERENCES `school_db`.`tbl_users` (
`user_id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `tbl_like_comments` ADD FOREIGN KEY ( `id_user` ) REFERENCES `school_db`.`tbl_users` (
`user_id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `tbl_permission_table` ADD FOREIGN KEY ( `admin_id` ) REFERENCES `school_db`.`tbl_admin` (
`admin_id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `tbl_permission_table` ADD FOREIGN KEY ( `school_id` ) REFERENCES `school_db`.`tbl_school_main_table` (
`school_id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `tbl_ratings_table` ADD FOREIGN KEY ( `id_school` ) REFERENCES `school_db`.`tbl_school_main_table` (
`school_id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `tbl_ratings_table` ADD FOREIGN KEY ( `user_id` ) REFERENCES `school_db`.`tbl_users` (
`user_id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `tbl_review_data` CHANGE `id_review_attachment` `id_review_attachment` INT( 11 ) NOT NULL ;

ALTER TABLE `tbl_review_data` ADD FOREIGN KEY ( `id_school` ) REFERENCES `school_db`.`tbl_school_main_table` (
`school_id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `tbl_review_data` ADD FOREIGN KEY ( `id_review_attachment` ) REFERENCES `school_db`.`tbl_review_attachment` (
`id_review_attachment`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `tbl_review_data` ADD FOREIGN KEY ( `id_rating_data` ) REFERENCES `school_db`.`tbl_ratings_table` (
`id_rating`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `tbl_student_data` ADD FOREIGN KEY ( `tbl_user_id` ) REFERENCES `school_db`.`tbl_users` (
`user_id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `tbl_student_data` ADD FOREIGN KEY ( `tbl_school_id` ) REFERENCES `school_db`.`tbl_school_main_table` (
`school_id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `video` ADD FOREIGN KEY ( `id_school` ) REFERENCES `school_db`.`tbl_school_main_table` (
`school_id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `video` ADD FOREIGN KEY ( `id_user` ) REFERENCES `school_db`.`tbl_users` (
`user_id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;
