-- create a new database for working TechBlog project
CREATE DATABASE techblog;
USE techblog;

-- create table for signup page
CREATE TABLE user(
	id INT primary key auto_increment,
    name VARCHAR(500) not null,
    email VARCHAR(500) not null unique,
    password VARCHAR(500) not null,
    gender VARCHAR(10) not null,
    about VARCHAR(1000),
    rdate TIMESTAMP default now(),
    profile VARCHAR(100) default 'default.png'
);

select * from user;

truncate table user;

-- create table for storing categories of post
CREATE TABLE categories(
	cid INT primary key auto_increment,
    name VARCHAR(100) not null,
    description VARCHAR(200)
);

insert into categories(name,description)values("Data Structure & Algorithms","about data structure and algorithms");
insert into categories(name,description)values("Software Architecture","about software development");
insert into categories(name,description)values("Networking","about networking");
insert into categories(name,description)values("Internet of Things","about IoT");


commit;
select * from categories;


-- create table for storing blog(post)
-- first foreign key catId referenece to categories table cid and
-- second foreign key userId reference to user table id

CREATE TABLE posts(
	pid INT primary key auto_increment,
    pTitle VARCHAR(150) not null,
    pContent LONGTEXT,
    pCode LONGTEXT,
    pPic VARCHAR(100),
    pDate TIMESTAMP default now(),
    catId INT,
    userId INT,
    FOREIGN KEY (catId) REFERENCES categories(cid)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (userId) REFERENCES user(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

select * from posts;




-- create a table for working real time Like system on our posts
CREATE TABLE liked(
	lid INT primary key auto_increment,
    pid INT,
    uid INT,
    FOREIGN KEY (pid) REFERENCES posts(pid)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (uid) REFERENCES user(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

select * from liked;













