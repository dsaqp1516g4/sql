source socialmusicdb-schema.sql;

insert into users (id,loginid,password,email,fullname, image) values (UNHEX('1'),'admin',UNHEX(MD5('123')),'das@asd.com','hicham1 azouagh', NULL);

insert into users values(UNHEX('2'),'alicia', UNHEX(MD5('alicia')), 'alicia@acme.com','Alicia tiene malicia',null);
insert into user_roles values (UNHEX('2'), 'registered');

insert into users values(UNHEX('3'),'blas', UNHEX(MD5('blas')), 'blas@acme.com','Blas te nas',null);
insert into user_roles values (UNHEX('3'), 'admin');

insert into events (id, userid, titol,text, lat, lon, start_date, end_date) values (UNHEX('1'), UNHEX('1'),'TITOL1', 'Concert de U2', NULL, NULL, '2015-12-5 09:00:00', '2015-12-5 11:00:00');

insert into ads (id, userid, subject, description, precio, type) values (UNHEX('1'), UNHEX('1'),'Orquesta Cimarrón', 'Dues presses de corrent trifàsica a peu de l escenari, una per a l equip so: Line Array Electro-Voice  de 26.000 W i l altre per a la il·luminació de 45.000 W', '100.0', '1');

insert into events (id, userid, titol,text, lat, lon, start_date, end_date) values(UNHEX('2'), UNHEX('1'),'Actuación de Kygo','El compositor y artista mostrará su talento en el Palau Sant Jordi para que sus fans y no tan fans puedan escuchar y disfrutar sus últimas canciones', NULL, NULL, '2015-12-6 09:00:00', '2015-12-6 11:00:00');