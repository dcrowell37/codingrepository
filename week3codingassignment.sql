create database if not exists users;

use users;

drop table if exists users;
drop table if exists posts;
drop table if exists comments;

create table users (
	id int(11) not null auto_increment,
	username varchar(25) not null,
	email varchar(50) not null,
	password varchar(20) not null,
	primary key (id)
);

create table posts (
	id int(11) not null auto_increment,
	user_id int(11) not null,
	date_posted datetime default current_timestamp,
	content varchar(400) not null,
	primary key (id),
	foreign key (user_id) references users(id)
);

create table comments (
	user_id int(11) not null,
	post_id int(11) not null,
	date_commented datetime default current_timestamp,
	content varchar(400) not null,
	primary key (user_id, post_id),
	foreign key (user_id) references users(id),
	foreign key (post_id) references posts(id)
);
	