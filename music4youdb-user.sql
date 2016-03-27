drop user 'music4you'@'localhost';
create user 'music4you'@'localhost' identified by 'music4you';
grant all privileges on music4youdb.* to 'music4you'@'localhost';
flush privileges;