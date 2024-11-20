create database book_management;
use book_management;
create table books(
	id int primary key auto_increment,
    title varchar(70),
    page_size int,
    author varchar(50)
);
INSERT INTO books (id, title, page_size, author) VALUES
(1, 'Toán', 45, 'Nguyễn Thái Học'),
(2, 'Văn', 34, 'Trần Mình Hoàng'),
(3, 'Sử', 56, 'Dương Trung Quốc'),
(4, 'Địa', 76, 'Lê Văn Hiến'),
(5, 'Hoá', 32, 'Hà Văn Minh');
-- Cập nhật số trang page_size=50 với sách có title = "Sử"
SET SQL_SAFE_UPDATES = 0;
update books
set page_size = 50
where title ='sử';
SET SQL_SAFE_UPDATES = 1;
select * from books;
--  Xoá sách có id =5
delete from books where id = 5;
--  Xoá bảng books
SET SQL_SAFE_UPDATES = 0;
delete from books;
SET SQL_SAFE_UPDATES = 1;
-- Xoá cơ sở dữ liệu book_management
drop database book_management;