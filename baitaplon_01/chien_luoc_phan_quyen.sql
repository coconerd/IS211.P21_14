ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

----------------------------------@hienphan-----------------------------
-- Tạo role
CREATE USER GiamDocVirtual IDENTIFIED BY password;
CREATE USER QuanLyKho IDENTIFIED BY password;
CREATE USER NhanVien IDENTIFIED BY password;

CREATE USER QuanLyKhoVirtual IDENTIFIED BY password; 
CREATE USER NhanVienVirtual IDENTIFIED BY password; 

-- Role GiamDoc: 
GRANT CONNECT TO GiamDocVirtual;
-- Xem, thêm, xóa, sửa được thông tin của quan hệ NHANVIEN ở tất cả chi nhánh.
GRANT 
  SELECT, 
  INSERT, 
  DELETE, 
  UPDATE
ON BTL1."NhanVien"
TO GiamDocVirtual;

/* Xem được thông tin của các quan hệ ChiNhanh, KhachHang, SanPham, DanhMuc_SanPham, 
ThuocTinhSanPham, HoaDon, ChiTietHoaDon, KhoSanPham_QLKho, KhoSanPham_QLBanHang ở tất cả các chi nhánh. */
GRANT SELECT ON BTL1."ChiNhanh" TO GiamDocVirtual;
GRANT SELECT ON BTL1."KhachHang" TO GiamDocVirtual;
GRANT SELECT ON BTL1."SanPham" TO GiamDocVirtual;
GRANT SELECT ON BTL1."DanhMuc_SanPham" TO GiamDocVirtual;
GRANT SELECT ON BTL1."ThuocTinh_SanPham" TO GiamDocVirtual;
GRANT SELECT ON BTL1."HoaDon" TO GiamDocVirtual;
GRANT SELECT ON BTL1."ChiTietHoaDon" TO GiamDocVirtual;
GRANT SELECT ON BTL1."KhoSanPham_QLKho" TO GiamDocVirtual;
GRANT SELECT ON BTL1."KhoSanPham_QLBanHang" TO GiamDocVirtual;

-- Role QuanLyKho:
GRANT CONNECT TO QuanLyKho;
-- Xem, thêm, xóa, sửa được thông tin của các bảng SanPham, DanhMuc_SanPham, ThuocTinhSanPham.
GRANT 
  SELECT, 
  INSERT,
  DELETE,
  UPDATE
ON BTL1."SanPham" 
TO QuanLyKho;

GRANT 
  SELECT, 
  INSERT,
  DELETE,
  UPDATE
ON BTL1."DanhMuc_SanPham" 
TO QuanLyKho;

GRANT 
  SELECT, 
  INSERT,
  DELETE,
  UPDATE
ON BTL1."ThuocTinh_SanPham" 
TO QuanLyKho;

-- Xem, thêm, xóa, sửa được thông tin của quan hệ KHOSANPHAM_QLKHO, KHOSANPHAM_QLBANHANG ở chi nhánh 2.
GRANT 
  SELECT, 
  INSERT, 
  DELETE, 
  UPDATE 
ON BTL1."KhoSanPham_QLKho"
TO QuanLyKho;

GRANT 
  SELECT, 
  INSERT, 
  DELETE, 
  UPDATE 
ON BTL1."KhoSanPham_QLBanHang"
TO QuanLyKho;

-- Xem thông tin của quan hệ KHOSANPHAM_QLKHO, KHOSANPHAM_QLBANHANG ở chi nhánh 1 và chi nhánh 3.
GRANT SELECT ON BTL1."KhoSanPham_QLKho" TO QuanLyKhoVirtual;
GRANT SELECT ON BTL1."KhoSanPham_QLBanHang" TO QuanLyKhoVirtual;

CREATE PUBLIC DATABASE LINK QuanLyKho21Link
CONNECT TO QuanLyKhoVirtual IDENTIFIED BY password USING
'congphan_link';

CREATE PUBLIC DATABASE LINK QuanLyKho23Link
CONNECT TO QuanLyKhoVirtual IDENTIFIED BY password USING
'ducminh_link';

-- Role NhanVien:
GRANT CONNECT TO NhanVien;
-- Xem, thêm, xóa, sửa được thông tin của quan hệ KHACHHANG.
GRANT 
  SELECT, 
  INSERT, 
  DELETE, 
  UPDATE 
ON BTL1."KhachHang"
TO NhanVien;

-- Xem, thêm, xóa, sửa được thông tin của quan hệ HOADON, CHITIETHOADON ở chi nhánh 2.
GRANT 
  SELECT, 
  INSERT, 
  DELETE, 
  UPDATE 
ON BTL1."HoaDon"
TO NhanVien;

GRANT 
  SELECT, 
  INSERT, 
  DELETE, 
  UPDATE 
ON BTL1."ChiTietHoaDon"
TO NhanVien;

-- Xem được thông tin của quan hệ HOADON, CHITIETHOADON ở chi nhánh 2 và chi nhánh 3.
GRANT SELECT ON BTL1."HoaDon" TO NhanVienVirtual;
GRANT SELECT ON BTL1."ChiTietHoaDon" TO NhanVienVirtual;

CREATE PUBLIC DATABASE LINK NhanVien21Link
CONNECT TO NhanVienVirtual IDENTIFIED BY password USING
'congphan_link';

CREATE PUBLIC DATABASE LINK NhanVien23Link
CONNECT TO NhanVienVirtual IDENTIFIED BY password USING
'ducminh_link';

----------------------------------@congphan-----------------------------
-- Tạo role
CREATE USER GiamDoc IDENTIFIED BY password;
CREATE USER QuanLyKho IDENTIFIED BY password;
CREATE USER NhanVien IDENTIFIED BY password;

CREATE USER QuanLyKhoVirtual IDENTIFIED BY password; 
CREATE USER NhanVienVirtual IDENTIFIED BY password; 

-- GiamDoc: 
GRANT CONNECT TO GiamDoc;
-- Xem, thêm, xóa, sửa được thông tin của quan hệ NHANVIEN ở tất cả chi nhánh.
GRANT SELECT, INSERT, DELETE, UPDATE ON BTL1."NhanVien" TO GiamDoc;

CREATE PUBLIC DATABASE LINK GiamDoc12Link
CONNECT TO GiamDocVirtual IDENTIFIED BY password USING
'hienphan_link';

CREATE PUBLIC DATABASE LINK GiamDoc13Link
CONNECT TO GiamDocVirtual IDENTIFIED BY password USING
'ducminh_link';

/* Xem được thông tin của các quan hệ ChiNhanh, KhachHang, SanPham, DanhMuc_SanPham, 
ThuocTinhSanPham, HoaDon, ChiTietHoaDon, KhoSanPham_QLKho, KhoSanPham_QLBanHang ở tất cả các chi nhánh. */
GRANT SELECT ON BTL1."ChiNhanh" TO GiamDoc;
GRANT SELECT ON BTL1."KhachHang" TO GiamDoc;
GRANT SELECT ON BTL1."SanPham" TO GiamDoc;
GRANT SELECT ON BTL1."DanhMuc_SanPham" TO GiamDoc;
GRANT SELECT ON BTL1."ThuocTinh_SanPham" TO GiamDoc;
GRANT SELECT ON BTL1."HoaDon" TO GiamDoc;
GRANT SELECT ON BTL1."ChiTietHoaDon" TO GiamDoc;
GRANT SELECT ON BTL1."KhoSanPham_QLKho" TO GiamDoc;
GRANT SELECT ON BTL1."KhoSanPham_QLBanHang" TO GiamDoc;

-- QuanLyKho:
GRANT CONNECT TO QuanLyKho;
-- Xem, thêm, xóa, sửa được thông tin của các bảng SanPham, DanhMuc_SanPham, ThuocTinhSanPham.
GRANT SELECT, INSERT, DELETE, UPDATE ON BTL1."SanPham" TO QuanLyKho;
GRANT SELECT, INSERT, DELETE, UPDATE ON BTL1."DanhMuc_SanPham" TO QuanLyKho;
GRANT SELECT, INSERT, DELETE, UPDATE ON BTL1."ThuocTinh_SanPham" TO QuanLyKho;

-- Xem, thêm, xóa, sửa được thông tin của quan hệ KHOSANPHAM_QLKHO, KHOSANPHAM_QLBANHANG ở chi nhánh 1.
GRANT SELECT, INSERT, DELETE, UPDATE ON BTL1."KhoSanPham_QLKho" TO QuanLyKho;
GRANT SELECT, INSERT, DELETE, UPDATE ON BTL1."KhoSanPham_QLBanHang" TO QuanLyKho;

-- Xem thông tin của quan hệ KHOSANPHAM_QLKHO, KHOSANPHAM_QLBANHANG ở chi nhánh 2 và chi nhánh 3.
GRANT SELECT ON BTL1."KhoSanPham_QLKho" TO QuanLyKhoVirtual;
GRANT SELECT ON BTL1."KhoSanPham_QLBanHang" TO QuanLyKhoVirtual;

CREATE PUBLIC DATABASE LINK QuanLyKho12Link
CONNECT TO QuanLyKhoVirtual IDENTIFIED BY password USING
'hienphan_link';

CREATE PUBLIC DATABASE LINK QuanLyKho13Link
CONNECT TO QuanLyKhoVirtual IDENTIFIED BY password USING
'ducminh_link';

-- NhanVien:
GRANT CONNECT TO NhanVien;
-- Xem, thêm, xóa, sửa được thông tin của quan hệ KHACHHANG.
GRANT SELECT, INSERT, DELETE, UPDATE ON BTL1."KhachHang" TO NhanVien;
-- Xem, thêm, xóa, sửa được thông tin của quan hệ HOADON, CHITIETHOADON ở chi nhánh 1.
GRANT SELECT, INSERT, DELETE, UPDATE ON BTL1."HoaDon" TO NhanVien;
GRANT SELECT, INSERT, DELETE, UPDATE ON BTL1."ChiTietHoaDon" TO NhanVien;

-- Xem được thông tin của quan hệ HOADON, CHITIETHOADON ở chi nhánh 2 và chi nhánh 3.
GRANT SELECT ON BTL1."HoaDon" TO NhanVienVirtual;
GRANT SELECT ON BTL1."ChiTietHoaDon" TO NhanVienVirtual;

CREATE PUBLIC DATABASE LINK NhanVien12Link
CONNECT TO NhanVienVirtual IDENTIFIED BY password USING
'hienphan_link';

CREATE PUBLIC DATABASE LINK NhanVien13Link
CONNECT TO NhanVienVirtual IDENTIFIED BY password USING
'ducminh_link';

----------------------------------@ducminh-----------------------------
GiamDocVirtual: 
Xem, thêm, xóa, sửa thông tin của quan hệ nhân viên; được xem thông tin của tất cả quan hệ còn lại ở chi nhánh 3:


GRANT CONNECT TO GiamDocVirtual
GRANT SELECT, INSERT, DELETE, UPDATE ON BTL1."NhanVien" TO GiamDocVirtual;

GRANT SELECT ON BTL1."ChiNhanh" TO GiamDocVirtual;
GRANT SELECT ON BTL1."KhachHang" TO GiamDocVirtual;
GRANT SELECT ON BTL1."SanPham" TO GiamDocVirtual;
GRANT SELECT ON BTL1."DanhMuc_SanPham" TO GiamDocVirtual;
GRANT SELECT ON BTL1."ThuocTinh_SanPham" TO GiamDocVirtual;
GRANT SELECT ON BTL1."HoaDon" TO GiamDocVirtual;
GRANT SELECT ON BTL1."ChiTietHoaDon" TO GiamDocVirtual;
GRANT SELECT ON BTL1."KhoSanPham_QLKho" TO GiamDocVirtual;
GRANT SELECT ON BTL1."KhoSanPham_QLBanHang" TO GiamDocVirtual;

QuanLyKho:
Xem, thêm, xóa, sửa thông tin của các quan hệ SanPham, DanhMuc_SanPham, ThuocTinh_SanPham:

GRANT CONNECT TO QuanLyKho;
GRANT SELECT, INSERT, UPDATE, DELETE ON BTL1."SanPham" TO QuanLyKho;
GRANT SELECT, INSERT, UPDATE, DELETE ON BTL1."DanhMuc_SanPham" TO QuanLyKho;
GRANT SELECT, INSERT, UPDATE, DELETE ON BTL1."ThuocTinh_SanPham" TO QuanLyKho;

Xem, thêm, xóa, sửa thông tin của các quan hệ KhoSanPham_QLKho, KhoSanPham_QLBanHang:

GRANT SELECT, INSERT, DELETE, UPDATE ON BTL1."KhoSanPham_QLKho" TO QuanLyKho;
GRANT SELECT, INSERT, DELETE, UPDATE ON BTL1."KhoSanPham_QLBanHang" TO QuanLyKho;

Xem thông tin của các quan hệ KhoSanPham_QLKho, KhoSanPham_QLBanHang ở chi nhánh 1 và 2:

CREATE PUBLIC DATABASE LINK QuanLyKho31Link
CONNECT TO QuanLyKhoVirtual IDENTIFIED BY password USING
'congphan_link';
CREATE PUBLIC DATABASE LINK QuanLyKho32Link
CONNECT TO QuanLyKhoVirtual IDENTIFIED BY password USING
'hienphan_link';

QuanLyKhoVirtual: 
Xem thông tin của quan hệ KhoSanPham_QLKho, KhoSanPham_QLBanHang ở chi nhánh 2:
GRANT SELECT ON BTL1."KhoSanPham_QLKho" TO QuanLyKhoVirtual;
GRANT SELECT ON BTL1."KhoSanPham_QLBanHang" TO QuanLyKhoVirtual;

NhanVien:
Xem, thêm, xóa, sửa được thông tin của quan hệ KHACHHANG:

GRANT CONNECT TO NhanVien;
GRANT SELECT, INSERT, DELETE, UPDATE ON BTL1."KhachHang" TO NhanVien;

Xem, thêm, xóa, sửa được thông tin của quan hệ HOADON, CHITIETHOADON ở chi nhánh 3:

GRANT SELECT, INSERT, DELETE, UPDATE ON BTL1."HoaDon" TO NhanVien;
GRANT SELECT, INSERT, DELETE, UPDATE ON BTL1."ChiTietHoaDon" TO NhanVien;

Xem được thông tin của quan hệ HoaDon, ChiTietHoaDon tại chi nhánh 1 và chi nhánh 2:

CREATE PUBLIC DATABASE LINK NhanVien31Link
CONNECT TO NhanVienVirtual IDENTIFIED BY password USING
'congphan_link';

CREATE PUBLIC DATABASE LINK NhanVien32Link
CONNECT TO NhanVienVirtual IDENTIFIED BY password USING
'hienphan_link';


NhanVienVirtual:
Xem được thông tin của quan hệ HoaDon, ChiTietHoaDon ở chi nhánh 3:

GRANT SELECT ON BTL1."HoaDon" TO NhanVienVirtual;
GRANT SELECT ON BTL1."ChiTietHoaDon" TO NhanVienVirtual;
