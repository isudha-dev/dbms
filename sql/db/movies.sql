create database db_movies;

use db_movies;

create table directors (
	director_id int primary key,
	name varchar(20),
    age int
);

create table movies (
	movie_id int primary key,
	title varchar(30),
    year year,
    director_id int,
    constraint Fk_DirId foreign key (director_id) references directors(director_id)
);

drop table actors;

create table actors (
	actor_id int primary key,
	name varchar(30),
    dob date
);

drop table movies_actors;

create table movies_actors (
	movie_id int,
    actor_id int,
    constraint Fk_MovieId foreign key (movie_id) references movies(movie_id),
    constraint Fk_ActorId foreign key (actor_id) references actors(actor_id)
);

insert into directors
values
(1, 'David Fincher', 60),
(2, 'Steven Soderbergh', 59),
(3, 'Lewis Milestone', 84)
;

insert into movies
values
(1, 'Fight club', 1999, 1),
(2, 'Ocean\'s eleven', 2001, 2),
(3, 'Ocean\'s eleven', 1960, 3)
;

insert into actors
values
(1, 'Brad Pitt', '1963-12-18'),
(2, 'George Clooney', '1961-05-16'),
(3, 'Frank Sinatra', '1915-12-12')
;

insert into movies_actors
values
(1, 1),
(2, 2),
(3, 3)
;

select a.name from actors a, movies m, movies_actors ma where m.title='Fight club' and m.movie_id=ma.movie_id and a.actor_id=ma.actor_id;
select m.title from movies m, actors a, movies_actors ma where a.name = 'George Clooney' and m.movie_id=ma.movie_id and a.actor_id=ma.actor_id;

