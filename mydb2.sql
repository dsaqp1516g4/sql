DROP DATABASE IF EXISTS mydb1;
CREATE DATABASE mydb1;
USE mydb1;

CREATE TABLE users (
    id BINARY(16) NOT NULL,
    loginid VARCHAR(15) NOT NULL UNIQUE,
    password BINARY(16) NOT NULL,
    email VARCHAR(255) NOT NULL,
    fullname VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)      
);

CREATE TABLE ads(
    userid BINARY(16) NOT NULL,
    adsid BINARY(16) NOT NULL ,
    type INT(10) NOT NULL,
    FOREIGN KEY (userid) REFERENCES users(id),
    PRIMARY KEY (adsid)
       
);

CREATE TABLE adscont
(
adsid BINARY(16) NOT NULL,
adscont VARCHAR(255) NOT NULL,
opciones VARCHAR(255) NOT NULL,
listsid BINARY(16) NOT NULL ,
FOREIGN KEY (adsid) REFERENCES ads(adsid),
PRIMARY KEY (listsid)
);


CREATE TABLE lists
(
listsid BINARY(16) NOT NULL,
lists BINARY(16) NOT NULL,
FOREIGN KEY (listsid) REFERENCES adscont(listsid),
PRIMARY KEY (lists)
);

CREATE TABLE relacion(
usuario BINARY(16) NOT NULL,
anuncios BINARY(16) NOT NULL,
listas BINARY(16) NOT NULL,
FOREIGN KEY (usuario) REFERENCES users(id),
FOREIGN KEY (anuncios) REFERENCES ads(adsid),
FOREIGN KEY (listas) REFERENCES lists(lists)
);

CREATE TABLE user_roles (
    userid BINARY(16) NOT NULL,
    role ENUM ('registered'),
    FOREIGN KEY (userid) REFERENCES users(id) on delete cascade,
    PRIMARY KEY (userid, role)
);

CREATE TABLE auth_tokens (
    userid BINARY(16) NOT NULL,
    token BINARY(16) NOT NULL,
    FOREIGN KEY (userid) REFERENCES users(id) on delete cascade,
    PRIMARY KEY (token)
);

CREATE TABLE stings (
    id BINARY(16) NOT NULL,
    userid BINARY(16) NOT NULL,
    subject VARCHAR(100) NOT NULL,
    content VARCHAR(500) NOT NULL,
    last_modified TIMESTAMP NOT NULL,
    creation_timestamp DATETIME not null default current_timestamp,
    FOREIGN KEY (userid) REFERENCES users(id) on delete cascade,
    PRIMARY KEY (id)
);

insert into users (id,loginid,password,email,fullname) values (1,'admin',123,'das@asd.com','hicham1 azouagh');
    insert into users (id,loginid,password,email,fullname) values (2,'admin2',123,'das@asd.com','hicham2 azouagh');
        insert into users (id,loginid,password,email,fullname) values (3,'admin3',123,'das@asd.com','hicham3 azouagh');
insert into ads (userid,adsid,type) values(1,1,0);
insert into adscont (adsid,adscont,opciones,listsid) values (1,'asdsdaasdsadsaddas','asd dsa qwe cxz',1);
insert into lists ( listsid,lists) values(1,123114);
describe users;
describe relacion;
describe  ads;
describe adscont;
describe lists;
