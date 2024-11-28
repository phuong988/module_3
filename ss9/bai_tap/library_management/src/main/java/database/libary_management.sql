create database libary_management;
use libary_management;
create table books(
	id int primary key auto_increment,
	title varchar(70) not null,
    price double not null,
    publication_year date
);
create table customers(
	id int primary key auto_increment,
    name varchar(50) not null,
    day_of_birth date,
    address varchar(70)
);
create table borrow(
	id int primary key auto_increment,
    book_id int,
    customer_id int,
    borrow_date date,
    return_date date,
    foreign key (customer_id) references customers(id),
    foreign key (book_id) references books(id)
);