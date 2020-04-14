create database test_tier_3;
grant all privileges on database test_tier_3 to jdbc_usr;

create table user_role(
	role_id serial primary key,
	name text unique not null
);

create table app_user(
	user_id serial primary key,
	username text unique not null,
	password text not null,
	first_name text not null,
	last_name text not null,
	role_id integer references user_role(role_id)
);

create table study_set(
	study_set_id serial primary key,
	name text not null,
	owner_id integer references app_user(user_id)
);

create table category(
	category_id serial primary key,
	name text unique not null
);

create table flashcard(
	flashcard_id serial,
	question text unique not null,
	answer text not null,
	category_id integer references category(category_id)
);

create table study_set_card(
	study_set_id number references study_set.study_set_id,
	flashcard_id number references flashcard.flashcard_id
	PRIMARY KEY(study_set_id, flashcard_id)
);