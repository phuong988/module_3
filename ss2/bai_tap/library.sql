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
    author_id int,
    category_id int,
    foreign key (author_id) references authors(id),
    foreign key (category_id) references category(id)
);

create table borrows(
	id int primary key auto_increment,
	student_id int,
    book_id int,
	borrow_date date,
    return_date date,
    foreign key (student_id) references students(id),
    foreign key (book_id) references books(id)
);

INSERT INTO Category (id, name) VALUES
(1, 'Tự nhiên'),
(2, 'Xã Hội'),
(3, 'Truyện'),
(4, 'Tiểu Thuyết'),
(5, 'Khác');

INSERT INTO Authors (id, name) VALUES
(1, 'Nguyễn Thái Học'),
(2, 'Trần Mình Hoàng'),
(3, 'Dương Trung Quốc'),
(4, 'Lê Văn Hiến'),
(5, 'Hà Văn Minh');

INSERT INTO Students (id, name, birthday, class_name) VALUES
(1, 'Nguyễn Văn A', '1999-12-12', 'C0822G1'),
(2, 'Nguyễn Văn B', '1999-12-13', 'C0822G1'),
(3, 'Nguyễn Văn C', '1999-12-14', 'C0822G1'),
(4, 'Nguyễn Văn D', '1999-12-15', 'C0922G1'),
(5, 'Nguyễn Văn E', '1999-12-16', 'C1022G1');

INSERT INTO Books (id, title, page_size, author_id, category_id) VALUES
(1, 'Toán', 45, 1, 1),
(2, 'Văn', 34, 2, 2),
(3, 'Sử', 56, 3, 2),
(4, 'Địa', 76, 4, 2),
(5, 'Hóa', 32, 5, 1);

INSERT INTO Borrows (id, student_id, book_id, borrow_date, return_date) VALUES
(1, 1, 1, '2022-12-12', '2022-12-13'),
(2, 2, 2, '2022-12-12', '2022-12-15'),
(3, 3, 3, '2022-12-12', '2022-12-15'),
(4, 4, 4, '2022-12-12', '2022-12-12'),
(5, 1, 5, '2022-12-13', '2022-12-15'),
(6, 1, 5, '2022-12-14', '2022-12-14'),
(7, 4, 4, '2022-12-15', '2022-12-29'),
(8, 3, 3, '2022-12-08', '2022-12-14'),
(9, 1, 2, '2022-12-06', '2022-12-30');

-- + Lấy ra toàn bộ sách có trong thư viện, cùng với tên thể loại và tác giả	
select b.id , b.title, a.name as author_name, c.name as category_name
from books b
left join authors a on a.id = b.author_id
left join category c on c.id = b.category_id;
-- + lấy ra tất cả sách, tên tác giả và thể loại trong thư viện
SELECT b.id, b.title, a.name AS author_name, c.name AS category_name
FROM books b
LEFT JOIN authors a ON a.id = b.author_id
LEFT JOIN category c ON c.id = b.category_id

UNION

SELECT b.id, b.title, a.name AS author_name, c.name AS category_name
FROM books b
RIGHT JOIN authors a ON a.id = b.author_id
RIGHT JOIN category c ON c.id = b.category_id;

-- + Lấy ra danh sách các học viên đã từng mượn sách và sắp xếp danh sách theo theo tên từ a->z	
select s.id, s.name, s.class_name, b.title as book_name, br.borrow_date, br.return_date
from students s
inner join borrows br on br.student_id = s.id
inner join books b on b.id =br.book_id
order by s.name;
-- + Lấy ra  2 quyển sách được mượn nhiều nhất	
select b.title as book_name, count(br.book_id) as borrow_count
from borrows br
join books b on b.id = br.book_id
group by br.book_id, b.title
order by borrow_count desc
limit 2;
-- hiển thị 3 học sinh mượn sach nhiều nhất
 select s.name as student_name, s.class_name, count(br.student_id) as student_borrow_count
 from borrows br
 join students s on s.id = br.student_id
 group by s.name,s.class_name
 order by student_borrow_count desc
 limit 3;
