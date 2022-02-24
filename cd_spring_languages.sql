Create database cd_spring_languages;
Use cd_spring_languages;

Create table languages (
	id int primary key auto_increment,
	name text not null,
    creator text not null,
    currentVersion text not null,
	createdAt Datetime,
	updatedAt Datetime
);