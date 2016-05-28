DROP DATABASE IF EXISTS music4youdb;
CREATE DATABASE music4youdb;

USE music4youdb;

CREATE TABLE users (
    id          BINARY(16) NOT NULL,
    loginid     VARCHAR(15) NOT NULL UNIQUE,
    password    BINARY(16) NOT NULL,
    email       VARCHAR(255) NOT NULL,
    fullname    VARCHAR(255) NOT NULL,
    image       varchar(40),
    PRIMARY KEY (id)      
);

CREATE TABLE user_roles (
    userid      BINARY(16) NOT NULL,
    role        ENUM ('registered','admin'),
    FOREIGN KEY (userid) REFERENCES users(id) on delete cascade,
    PRIMARY KEY (userid, role)
);

CREATE TABLE auth_tokens (
    userid      BINARY(16) NOT NULL,
    token       BINARY(16) NOT NULL,
    FOREIGN KEY (userid) REFERENCES users(id) on delete cascade,
    PRIMARY KEY (token)
);

CREATE TABLE ads (
    id          BINARY(16) NOT NULL,
    userid      BINARY(16) NOT NULL,
    subject     varchar(50) NOT NULL, 
    description varchar(500) NOT NULL,
    precio      long,
    type        int NOT NULL,
    image       varchar(50),
    last_modified	timestamp default current_timestamp ON UPDATE CURRENT_TIMESTAMP,
    creation_timestamp	datetime not null default current_timestamp,
    FOREIGN KEY (userid) REFERENCES users(id),
    PRIMARY KEY (id)
);

create table events (

    id	        BINARY(16) NOT NULL,
    userid      BINARY(16) NOT NULL,
    titol	varchar(100) not null,
    text	varchar(600) not null,
    lat         long,
    lon         long,
    start_date	datetime not null,
    end_date	datetime not null,
    last_modified	timestamp default current_timestamp ON UPDATE CURRENT_TIMESTAMP,
    creation_timestamp	datetime not null default current_timestamp,
    FOREIGN KEY (userid) REFERENCES users(id) on delete cascade,
    PRIMARY KEY (id)
);


create table comments (
    id          BINARY(16) NOT NULL,
    userid      BINARY(16) NOT NULL,
    anuncioid	BINARY(16),
    eventid     BINARY(16),
    content	varchar(200) not null,
    last_modified	timestamp default current_timestamp ON UPDATE CURRENT_TIMESTAMP,
    creation_timestamp	datetime not null default current_timestamp,
    foreign key (userid)    references users (id) on delete cascade,
    PRIMARY KEY (id)
	
);


create table comments2 (
    id          BINARY(16) NOT NULL,
    userid      BINARY(16) NOT NULL,
    eventid     BINARY(16) NOT NULL,
    content	varchar(200) not null,
    last_modified	timestamp default current_timestamp ON UPDATE CURRENT_TIMESTAMP,
    creation_timestamp	datetime not null default current_timestamp,
    foreign key (userid)    references users (id) on delete cascade,
    foreign key (eventid)   references events (id),
    PRIMARY KEY (id)
	
);

CREATE TABLE playlist
(
    id          BINARY(16) NOT NULL,
    userid      BINARY(16) NOT NULL,
    artist      varchar (50) NOT NULL,
    title        varchar (50) NOT NULL,
    audio       varchar(20),
    youtubelink varchar(100),
    genre       varchar(20),
    publication_yr  int,
    last_modified	timestamp default current_timestamp ON UPDATE CURRENT_TIMESTAMP,
    creation_timestamp	datetime not null default current_timestamp,
    FOREIGN KEY (userid) REFERENCES users(id) on delete cascade,
    PRIMARY KEY (id)
);
	
CREATE TABLE mensajeria
(

   	id BINARY(16) NOT NULL,

	userid BINARY(16) NOT NULL,

	destinatario BINARY(16) NOT NULL,

	text VARCHAR(1000) NOT NULL,

	creation_timestamp DATETIME not null default current_timestamp,
	last_modified timestamp default current_timestamp ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (userid) REFERENCES users(id) on delete cascade,
    	FOREIGN KEY (destinatario) REFERENCES users(id),
    	PRIMARY KEY (id)
);










