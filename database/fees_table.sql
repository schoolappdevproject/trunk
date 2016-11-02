create table tbl_fees_data(
id_fees_data INT NOT NULL AUTO_INCREMENT,
user_id INT NOT NULL,
school_id INT NOT NULL,
standard INT,
fees_txt VARCHAR (5000),
PRIMARY KEY(id_fees_data));

