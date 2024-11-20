create database library;
use library;

create table authors(

	id int primary key auto_increment,
	name varchar(50)
);

create table category(
	id int primary key auto_increment,
    name varchar(50)
);

create table students(
	id int auto_increment primary key,
    name varchar(50),
    class_name varchar(50),
    birthday date
);

create table books(
	id int auto_increment primary key,
    title varchar(50),
    page_size varchar(9),
    id_author int,
    id_category int,
    foreign key (id_author) references authors(id),
    foreign key (id_category) references category(id)
);

create table borrows(
	id_student int,
    id_book int,
	borrow_date date,
    return_date date,
    primary key(id_student, id_book),
    foreign key (id_student) references students(id),
    foreign key (id_book) references books(id)
);