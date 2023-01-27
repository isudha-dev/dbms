create database db_netflix;

use db_netflix;
drop table users;

create table users (
	user_id INT primary key,
	email varchar(30),
    password varchar(20)
);

create table profiles (
	profile_id int primary key,
	name varchar(20),
    type ENUM ('KID', 'ADULT'),
    user_id int,
    constraint Fk_UserId foreign key (user_id) references users(user_id)
);

create table videos (
	video_id int primary key,
	title varchar(50),
    description varchar(50)
);

create table actors (
	actor_id int primary key,
	name varchar(30)
);

create table videos_actors (
	video_id int,
    actor_id int,
    constraint Fk_VideoId foreign key (video_id) references videos(video_id),
    constraint Fk_ActorId foreign key (actor_id) references actors(actor_id)
);

create table watch_profiles (
	watch_profile_id int primary key,
	video_id int,
    profile_id int,
    status ENUM ('COMPLETED','IN PROGRESS'),
    constraint Fk_WatchId foreign key (video_id) references videos(video_id),
    constraint Fk_ProfileId foreign key (profile_id) references profiles(profile_id)
);

create table watch_timestamp (
	watch_profile_id int,
    last_watch timestamp,
    constraint Fk_WatchProfileId foreign key (watch_profile_id) references watch_profiles(watch_profile_id)
);