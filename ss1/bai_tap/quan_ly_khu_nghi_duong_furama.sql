create database quan_ly_khu_nghi_duong_furama;
use quan_ly_khu_nghi_duong_furama;
create table vi_tri(
	id_vi_tri int auto_increment primary key,
    ten_vi_tri varchar(45) not null
);

create table trinh_do(
	id_trinh_do int auto_increment primary key,
	trinh_do varchar(45) not null
);

create table bo_phan(
	id_bo_phan int auto_increment primary key,
    ten_bo_phan varchar(45) not null
);

create table dich_vu_di_kem(
	id_dich_vu_di_kem int auto_increment primary key,
    ten_dich_vu_di_kem varchar(45) not null,
    gia double,
    don_vi varchar(20),
    trang_thai_kha_dung varchar(45)
);

create table loai_dich_vu(
	id_loai_dich_vu int auto_increment primary key,
    ten_loai_dich_vu varchar(50) not null
);

create table kieu_thue(
	id_kieu_thue int auto_increment primary key,
    ten_kieu_thue varchar(45) not null,
    gia double
);

create table loai_khach(
	id_loai_khach int primary key auto_increment,
    ten_loai_khach varchar(45) not null
);

create table nhan_vien(
	id_nhan_vien int primary key auto_increment,
    ho_ten varchar(50) not null,
    id_vi_tri int not null,
    id_trinh_do int not null,
    id_bo_phan int not null,
    ngay_sinh date,
    so_cmtnd varchar(45) not null,
    luong double not null,
    sdt varchar(15),
    email varchar(50),
    dia_chi varchar(200),
    constraint fk_vi_tri foreign key (id_vi_tri) references vi_tri(id_vi_tri),
    constraint fk_trinh_do foreign key (id_trinh_do) references trinh_do(id_trinh_do),
    constraint fk_bo_phan foreign key (id_bo_phan) references bo_phan(id_bo_phan)
);

create table khach_hang(
	id_khach_hang int primary key auto_increment,
    id_loai_khach int,
    ho_ten varchar(45) not null,
    ngay_sinh date,
    so_cmtnd varchar(45),
    sdt varchar(15),
    email varchar(50),
    dia_chi varchar(200),
    constraint fk_loai_khach foreign key (id_loai_khach) references loai_khach(id_loai_khach)
);

create table dich_vu(
	id_dich_vu int primary key auto_increment,
    ten_dich_vu varchar(50) not null,
    dien_tich varchar(25),
    so_tang int not null,
    so_nguoi_toi_da varchar(10) not null,
    chi_phi_thue double not null,
    id_kieu_thue int ,
	id_loai_dich_vu int,
    trang_thai varchar(50),
    foreign key (id_kieu_thue) references kieu_thue(id_kieu_thue),
    constraint fk_loai_dich_vu foreign key (id_loai_dich_vu) references loai_dich_vu(id_loai_dich_vu)
);

create table hop_dong(
	id_hop_dong int auto_increment primary key,
    ngay_lam_hop_dong date,
    ngay_ket_thuc date,
    id_nhan_vien int,
    id_khach_hang int,
    id_dich_vu int,
    tien_dat_coc double,
    tong_tien double,
    constraint fk_nhan_vien foreign key (id_nhan_vien) references nhan_vien(id_nhan_vien),
    constraint fk_khach_hang foreign key (id_khach_hang) references khach_hang(id_khach_hang),
    constraint fk_dich_vu foreign key (id_dich_vu) references dich_vu(id_dich_vu)
);

create table hop_dong_chi_tiet(
	id_hop_dong_chi_tiet int auto_increment primary key,
    id_hop_dong int,
    id_dich_vu_di_kem int,
    so_luong int,
    constraint fk_hop_dong foreign key (id_hop_dong) references hop_dong(id_hop_dong),
    constraint fk_dich_vu_di_kem foreign key (id_dich_vu_di_kem) references dich_vu_di_kem(id_dich_vu_di_kem)
);

create table villa(
	ten_dich_vu  varchar(50) not null,
    dien_tich_su_dung varchar(30),
    chi_phi_thue double,
    so_luong_nguoi_toi_da int,
    id_kieu_thue int,
    tieu_chuan_phong varchar (40),
    mo_ta_tien_nghi_khac varchar(255),
    dien_tich_ho_boi double,
    so_tang int,
    constraint fk_kieu_thue foreign key (id_kieu_thue) references kieu_thue(id_kieu_thue) on delete cascade
);

create table house(
	ten_dich_vu  varchar(50) not null,
    dien_tich_su_dung varchar(30),
    chi_phi_thue double,
    so_luong_nguoi_toi_da int,
    id_kieu_thue int,
    tieu_chuan_phong varchar (40),
    mo_ta_tien_nghi_khac varchar(255),
    so_tang int,
	foreign key (id_kieu_thue) references kieu_thue(id_kieu_thue) on delete cascade
);

create table room(
	ten_dich_vu  varchar(50) not null,
    dien_tich_su_dung varchar(30),
    chi_phi_thue double,
    so_luong_nguoi_toi_da int,
    id_kieu_thue int,
    dich_vu_mien_phi_di_kem varchar(50),
    foreign key (id_kieu_thue) references kieu_thue(id_kieu_thue) on delete cascade
);

INSERT INTO vi_tri (id_vi_tri, ten_vi_tri)
VALUES
  (1, 'Quản Lý'),
  (2, 'Nhân Viên');

INSERT INTO trinh_do (id_trinh_do, trinh_do)
VALUES
  (1, 'Trung Cấp'),
  (2, 'Cao Đẳng'), 
  (3, 'Đại Học'),
  (4, 'Sau Đại Học');

INSERT INTO bo_phan (id_bo_phan, ten_bo_phan)
VALUES
  (1, 'Sale-Marketing'),
  (2, 'Hành chính'),
  (3, 'Phục vụ'),
  (4, 'Quản lý');

INSERT INTO nhan_vien (id_nhan_vien, ho_ten, ngay_sinh, so_cmtnd, luong, sdt, email, dia_chi, id_vi_tri, id_trinh_do, id_bo_phan)
VALUES
  (1, 'Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1),
  (2, 'Lê Văn Bình', '1997-06-02', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1, 2, 2),
  (3, 'Hồ Thị Yến', '1995-12-06', '999231723', 14000000, '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2),
  (4, 'Võ Công Toản', '1980-04-04', '123231365', 17000000, '0374444232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', 1, 4, 4),
  (5, 'Nguyễn Bình Phát', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', 2, 1, 1),
  (6, 'Khúc Nguyễn An Nghi', '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', 2, 2, 3),
  (7, 'Nguyễn Hữu Hà', '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', 2, 3, 2),
  (8, 'Nguyễn Hà Đông', '1989-06-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', 2, 4, 4),
  (9, 'Tòng Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', 2, 4, 4),
  (10, 'Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', 2, 3, 2);

INSERT INTO loai_khach (id_loai_khach, ten_loai_khach)
VALUES
  (1, 'Diamond'),
  (2, 'Platinium'),
  (3, 'Gold'),
  (4, 'Silver'),
  (5, 'Member');

INSERT INTO khach_hang (id_khach_hang, ho_ten, ngay_sinh, so_cmtnd, sdt, email, dia_chi, id_loai_khach)
VALUES
  (1, 'Nguyễn Thị Hào', '1970-11-07', '643431213', '0954233362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng', 5),
  (2, 'Phạm Xuân Diệu', '1992-08-08', '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị', 3),
  (3, 'Trương Đình Nghệ', '1990-02-27', '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh', 1),
  (4, 'Dương Văn Quan', '1981-07-08', '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng', 1),
  (5, 'Hoàng Trần Nhi Nhi', '1995-12-09', '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai', 4),
  (6, 'Tôn Nữ Mộc Châu', '2005-12-06', '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng', 4),
  (7, 'Nguyễn Mỹ Kim', '1984-04-08', '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh', 1),
  (8, 'Nguyễn Thị Hào', '1999-04-08', '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum', 3),
  (9, 'Trần Đại Danh', '1994-07-01', '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi', 1),
  (10, 'Nguyễn Tâm Đắc', '1989-07-01', '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng', 2);

INSERT INTO kieu_thue (id_kieu_thue, ten_kieu_thue, gia)
VALUES
  (1, 'year', 5000000),
  (2, 'month', 400000),
  (3, 'day', 50000),
  (4, 'hour', 10000);

INSERT INTO loai_dich_vu (id_loai_dich_vu, ten_loai_dich_vu)
VALUES
  (1, 'Villa'),
  (2, 'House'),
  (3, 'Room');
INSERT INTO dich_vu_di_kem (id_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi, trang_thai_kha_dung)
VALUES
  (1, 'Karaoke', 10000, 'giờ', 'Tiện nghi, hiện đại'),
  (2, 'Thuê xe máy', 10000, 'chiếc', 'Hỏng 1 xe'),
  (3, 'Thuê xe đạp', 20000, 'chiếc', 'Tốt'),
  (4, 'Buffet buổi sáng', 15000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
  (5, 'Buffet buổi trưa', 90000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
  (6, 'Buffet buổi tối', 16000, 'suất', 'đầy đủ đồ ăn, tráng miệng');
INSERT INTO dich_vu (id_dich_vu, ten_dich_vu, dien_tich, so_tang, so_nguoi_toi_da, chi_phi_thue, id_kieu_thue, id_loai_dich_vu, trang_thai)
VALUES
  (1, 'Villa Đà Nẵng', '500m²', 3, '10', 2000000, 1, 1, 'Sẵn sàng'),
  (2, 'House Hội An', '300m²', 2, '6', 1500000, 2, 2, 'Sẵn sàng'),
  (3, 'Room Deluxe', '50m²', 1, '2', 500000, 3, 3, 'Sẵn sàng'),
  (4, 'Room Standard', '40m²', 1, '2', 400000, 4, 3, 'Sẵn sàng'),
  (5, 'House Bình Định', '200m²', 1, '4', 1200000, 2, 2, 'Sẵn sàng'),
  (6, 'Villa Hội An', '450m²', 2, '8', 1800000, 1, 1, 'Sẵn sàng');

INSERT INTO hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, tong_tien, id_nhan_vien, id_khach_hang, id_dich_vu)
VALUES
  ('2020-12-08', '2020-12-08', 0, 2000000, 3, 1, 3),
  ('2020-07-14', '2020-07-21', 200000, 4000000, 7, 3, 1),
  ('2021-03-15', '2021-03-17', 50000, 3000000, 3, 4, 2),
  ('2021-01-14', '2021-01-18', 100000, 3500000, 7, 5, 5),
  ('2021-07-14', '2021-07-15', 0, 1500000, 7, 2, 6),
  ('2021-06-01', '2021-06-03', 0, 1800000, 7, 7, 6),
  ('2021-09-02', '2021-09-05', 100000, 2200000, 7, 4, 4),
  ('2021-06-17', '2021-06-18', 150000, 5000000, 3, 4, 1),
  ('2020-11-19', '2020-11-19', 0, 500000, 3, 4, 3),
  ('2021-04-12', '2021-04-14', 0, 800000, 10, 3, 5),
  ('2021-04-25', '2021-04-25', 0, 600000, 2, 2, 1),
  ('2021-05-25', '2021-05-27', 0, 700000, 7, 10, 1);
INSERT INTO hop_dong_chi_tiet (id_hop_dong, id_dich_vu_di_kem, so_luong)
VALUES
  (1, 1, 3),
  (2, 2, 1),
  (3, 3, 2),
  (4, 4, 4),
  (5, 5, 1),
  (6, 6, 2),
  (7, 1, 3),
  (8, 3, 1),
  (9, 4, 5),
  (10, 6, 2),
  (11, 2, 1),
  (12, 5, 2);
-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select *
from nhan_vien nv
where (
	SUBSTRING_INDEX(nv.ho_ten,' ', -1) like 'H%'
	or SUBSTRING_INDEX(nv.ho_ten,' ',-1) like 'T%'
	or SUBSTRING_INDEX(nv.ho_ten,' ', -1) like 'K%'
)
and char_length(nv.ho_ten) <= 15;
-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *
from khach_hang kh
where timestampdiff(year,ngay_sinh, CURDATE()) BETWEEN 18 and 50
and (dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị');

-- 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
SELECT kh.id_khach_hang, kh.ho_ten, COUNT(hd.id_khach_hang) AS so_lan_dat_phong
FROM khach_hang kh
JOIN hop_dong hd ON kh.id_khach_hang = hd.id_khach_hang
JOIN loai_khach lk ON kh.id_loai_khach = lk.id_loai_khach
WHERE lk.ten_loai_khach = 'Diamond'
GROUP BY kh.id_khach_hang
ORDER BY so_lan_dat_phong ASC;
-- 5. Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien 
-- (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) 
-- cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select kh.id_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.id_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,
dv.chi_phi_thue + ifnull(sum(hdct.so_luong *dvdk.gia),0) as tong_tien		
from khach_hang kh
left join hop_dong hd on kh.id_khach_hang = hd.id_khach_hang
left join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
left join hop_dong_chi_tiet hdct on hdct.id_hop_dong = hd.id_hop_dong
left join dich_vu_di_kem dvdk on dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
join loai_khach lk on kh.id_loai_khach = lk.id_loai_khach
group by kh.id_khach_hang, hd.id_hop_dong,dv.id_dich_vu
order by kh.id_khach_hang;
-- 6. Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).
SELECT 
    dv.id_dich_vu, 
    dv.ten_dich_vu, 
    dv.dien_tich, 
    dv.chi_phi_thue, 
    ldv.ten_loai_dich_vu
FROM dich_vu dv
JOIN loai_dich_vu ldv ON dv.id_loai_dich_vu = ldv.id_loai_dich_vu
WHERE dv.id_dich_vu NOT IN (
    SELECT id_dich_vu 
    FROM hop_dong 
    WHERE MONTH(ngay_lam_hop_dong) IN (1, 2, 3) 
      AND YEAR(ngay_lam_hop_dong) = 2021
);
-- 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.
SELECT 
    dv.id_dich_vu, 
    dv.ten_dich_vu, 
    dv.dien_tich, 
    dv.so_nguoi_toi_da, 
    dv.chi_phi_thue, 
    ldv.ten_loai_dich_vu
FROM dich_vu dv
JOIN loai_dich_vu ldv ON dv.id_loai_dich_vu = ldv.id_loai_dich_vu
WHERE dv.id_dich_vu IN (
    SELECT id_dich_vu 
    FROM hop_dong 
    WHERE YEAR(ngay_lam_hop_dong) = 2020
)
AND dv.id_dich_vu NOT IN (
    SELECT id_dich_vu 
    FROM hop_dong 
    WHERE YEAR(ngay_lam_hop_dong) = 2021
);
-- 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
-- cach 1: su dung distinct
select distinct ho_ten
from khach_hang;
-- cach 2: su dung group by
select ho_ten
from khach_hang
group by ho_ten;
-- cach 3: su dung subquery
SELECT ho_ten FROM (
    SELECT ho_ten FROM khach_hang
) AS unique_customers GROUP BY ho_ten;

WITH UniqueCustomers AS (
    SELECT ho_ten 
    FROM khach_hang
    GROUP BY ho_ten
)
SELECT * FROM UniqueCustomers;
-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
SELECT 
    MONTH(hd.ngay_lam_hop_dong) AS thang, 
    COUNT(DISTINCT hd.id_khach_hang) AS so_khach_dat_phong
FROM hop_dong hd
WHERE YEAR(hd.ngay_lam_hop_dong) = 2021
GROUP BY thang
ORDER BY thang;
-- 10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet).
SELECT hd.id_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, 
	   IFNULL(SUM(hdct.so_luong), 0) AS so_luong_dich_vu_di_kem
FROM hop_dong hd
LEFT JOIN hop_dong_chi_tiet hdct ON hd.id_hop_dong = hdct.id_hop_dong
GROUP BY hd.id_hop_dong;
-- 11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.

-- 12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.
-- 17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràngbuộc giữa các bảng).

-- 19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.

-- 20.	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng co trong hệ thống, thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.
SELECT 
    id_nhan_vien AS id, 
    ho_ten, 
    email, 
    sdt, 
    ngay_sinh, 
    dia_chi
FROM nhan_vien
UNION ALL
SELECT 
    id_khach_hang AS id, 
    ho_ten, 
    email, 
    sdt, 
    ngay_sinh, 
    dia_chi
FROM khach_hang;
-- 1. Hiển thị thông tin của tất cả nhân viên thuộc bộ phận hành chính có là họ “Nguyễn”
select * from nhan_vien nv 
inner join bo_phan bp on nv.id_bo_phan = bp.id_bo_phan 
where bp.id_bo_phan = 2 and nv.ho_ten like 'Nguyen%';
-- 2. Hiển thị thông tin của tất cả khách hàng có năm sinh từ 1990 đến 1985 và thuộc loại khách hàng Diamond
select 
-- 3. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có số lần đặt từ 2 lần trở lên.

-- 4. Hiển thị ma_khach_hang, ho_ten, tong_tien mà khách hàng đã làm hợp đồng  (Với tổng tiền được tính từ  Chi Phí Thuê) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

-- 5.Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ không được đặt trong 2021.

-- 6. Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

-- 7. Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần tronh nam 2020 lên gấp đôi.

-- 8. Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

-- 9.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.

-- 10.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
