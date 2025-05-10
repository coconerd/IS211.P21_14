🌾 You’re unbeleafable!

## Giới thiệu đồ án môn học 
- **Tên môn học**: Cơ sở dữ liệu phân tán
- **Mã lớp**: IS211.P21
- **Tên đồ án**: THIẾT KẾ CƠ SỞ DỮ LIỆU PHÂN TÁN TRÊN HỆ QUẢN TRỊ CSDL QUAN HỆ ORACLE

## Nhóm thực hiện
**Tên nhóm: Coconerd** 🥥

| Họ và tên          | MSSV     | Vai trò     | Liên hệ                     |
|--------------------|----------|-------------|-----------------------------|
|🌱  Nguyễn Đỗ Đức Minh | 22520872 | Team member  | nddminh2021@gmail.com          |
|🌱  Phan Thị Thủy Hiền | 22520423 | Team member | thuyhienphanthi2004@gmail.com |
|🌱  Trần Vũ Bão   | 22520124 | Team member | tranvubao2004@gmail.com          |
|🌱  Phan Thành Công       | 22520170 | Team member | phanthanhcong982004@gmail.com          |

# Bài tập lớn 1: 
##  Lược đồ cơ sở dữ liệu quản lý cửa hàng bán cây cảnh PlantParadise:
![image](https://github.com/user-attachments/assets/b22f3eba-2262-4276-8079-d453bf8e84f6)

## Thiết kế chiến lược phân mảnh
```
- Quan hệ CHINHANH là phân mảnh ngang chính theo địa chỉ.
  CHINHANH1 = σDiaChi = ‘Hà Nội’  (CHINHANH)
  CHINHANH2 = σDiaChi = ‘Đà Nẵng’ (CHINHANH)
  CHINHANH3 = σDiaChi = ‘Hồ Chí Minh’ (CHINHANH)

- Quan hệ NHANVIEN, HOADON, CHITIETHOADON là phân mảnh ngang dẫn xuất.
  NHANVIEN1 = NHANVIEN ⋉MaChiNhanh  (CHINHANH1)
  NHANVIEN2 = NHANVIEN ⋉MaChiNhanh  (CHINHANH2)
  NHANVIEN3 = NHANVIEN ⋉MaChiNhanh  (CHINHANH3)

  HOADON1 = HOADON ⋉MaNhanVien  (NHANVIEN1)
  HOADON2 = HOADON ⋉MaNhanVien  (NHANVIEN2)
  HOADON3 = HOADON ⋉MaNhanVien  (NHANVIEN3)

  CHITIETHOADON1 = CHITIETHOADON ⋉MaHoaDon  (HOADON1)
  CHITIETHOADON2 = CHITIETHOADON ⋉MaHoaDon  (HOADON2)
  CHITIETHOADON3 = CHITIETHOADON ⋉MaHoaDon  (HOADON3)

- Quan hệ KHOSANPHAM được phân mảnh hỗn hợp thành các quan hệ  KHOSANPHAM_QLKHO và KHOSANPHAM_QLBANHANG.
  Trong đó: Quan hệ KHOSANPHAM_QLKHO chứa các thông tin để quản lý việc nhập sản phẩm cũng như quản lý tồn kho.
  KHOSANPHAM_QLKHO1= 𝜋MaChiNhanh, MaSanPham, NgayCapNhat, SoLuong (KHOSANPHAM ⋉MaChiNhanh CHINHANH1)
  KHOSANPHAM_QLKHO2 = 𝜋MaChiNhanh, MaSanPham, NgayCapNhat, SoLuong (KHOSANPHAM ⋉MaChiNhanh CHINHANH2)
  KHOSANPHAM_QLKHO3 = 𝜋MaChiNhanh, MaSanPham, NgayCapNhat, SoLuong (KHOSANPHAM ⋉MaChiNhanh CHINHANH3)

- Quan hệ KHOSANPHAM_QLBANHANG để quản lý thông tin tình trạng bán hàng của các sản phẩm.
  KHOSANPHAM_QLBANHANG1 =
      𝜋MaChiNhanh, MaSanPham, TinhTrang, NgayCapNhat, TongSoLuongDaBan,
      TongSoLuongDanhGia, TongSoLuongSao (KHOSANPHAM ⋉MaChiNhanh CHINHANH1)
  KHOSANPHAM_QLBANHANG2 =
      𝜋MaChiNhanh, MaSanPham, TinhTrang, NgayCapNhat, TongSoLuongDaBan,
      TongSoLuongDanhGia, TongSoLuongSao (KHOSANPHAM ⋉MaChiNhanh CHINHANH2)
  KHOSANPHAM_QLBANHANG3 =
      𝜋MaChiNhanh, MaSanPham, TinhTrang, NgayCapNhat, TongSoLuongDaBan,
      TongSoLuongDanhGia, TongSoLuongSao (KHOSANPHAM ⋉MaChiNhanh CHINHANH3)

- Quan hệ KHACHHANG, SANPHAM, DANHMUC_SANPHAM, THUOCTINHSANPHAM được nhân bản tại tất cả các chi nhánh.
```

