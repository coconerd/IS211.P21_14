🌾 You’re unbeleafable!
# Bài tập lớn 1: 
##  Lược đồ cơ sở dữ liệu quản lý cửa hàng bán cây cảnh PlantParadise:
![image](https://github.com/user-attachments/assets/b22f3eba-2262-4276-8079-d453bf8e84f6)

**CHINHANH (MACHINHANH, TENCHINHANH, DIACHI)** <br>
Tân từ: Mỗi chi nhánh có mã chi nhánh (MACHINHANH) dùng để phân biệt các chi nhánh với nhau, ngoài ra còn có tên chi nhánh (TENCHINHANH) và địa chỉ của chi nhánh đó (DIACHI). Địa chỉ chi nhánh sẽ là một trong ba thành phố: Hà Nội, Đà Nẵng hoặc TPHCM.

**KHACHHANG (MAKHACHHANG, EMAIL, HOTEN, SDT, DIACHI, GIOITINH, NGAYSINH)** <br>
Tân từ: Mỗi khách hàng có mã khách hàng (MAKHACHHANG) dùng để định danh. Các thông tin lưu kèm bao gồm email (EMAIL), họ tên (HOTEN), số điện thoại (SDT), địa chỉ (DIACHI), giới tính (GIOITINH) và ngày sinh (NGAYSINH).

**NHANVIEN (MANHANVIEN, MACHINHANH, HOTEN, GIOITINH, NGAYSINH, SDT, DIACHI, NGAYVAOLAM, CHUCVU, LUONG)** <br>
Tân từ: Mỗi nhân viên có mã nhân viên (MANHANVIEN) để phân biệt. Mỗi nhân viên làm việc tại một chi nhánh (MACHINHANH) cụ thể, kèm theo các thông tin cá nhân như họ tên (HOTEN), giới tính (GIOITINH), ngày sinh (NGAYSINH), số điện thoại (SDT), địa chỉ (DIACHI), ngày vào làm (NGAYVAOLAM), chức vụ (CHUCVU) và mức lương (LUONG).

**SANPHAM (MASANPHAM, TENSANPHAM, THELOAI, GIA)** <br>
Tân từ: Mỗi sản phẩm có mã sản phẩm (MASANPHAM) duy nhất để phân biệt. Các thông tin kèm theo gồm tên sản phẩm (TENSANPHAM), thể loại sản phẩm (THELOAI) với giá trị mặc định là 0 đối với sản phẩm là cây và 1 đối với sản phẩm là chậu, và giá bán (GIA).

**THUOCTINHSANPHAM (MASANPHAM, TENTHUOCTINH, GIATRITHUOCTINH)** <br>
Tân từ: Bảng này lưu trữ các thuộc tính chi tiết của sản phẩm, bao gồm mã sản phẩm (MASANPHAM), tên thuộc tính (TENTHUOCTINH) và giá trị của thuộc tính đó (GIATRITHUOCTINH). Mỗi sản phẩm có thể có nhiều thuộc tính khác nhau.

**DANHMUC_SANPHAM (MASANPHAM, TENDANHMUC)** <br>
Tân từ: Bảng này liên kết sản phẩm với các danh mục phân loại, gồm mã sản phẩm (MASANPHAM) và tên danh mục (TENDANHMUC). Một sản phẩm có thể thuộc nhiều danh mục.

**HOADON (MAHOADON, MAKHACHHANG, MANHANVIEN, TONGTIEN, NGAYTAO, PHUONGTHUCTHANHTOAN)** <br>
Tân từ: Mỗi hóa đơn có mã hóa đơn (MAHOADON) để phân biệt. Thông tin hóa đơn bao gồm mã khách hàng (MAKHACHHANG), mã nhân viên lập hóa đơn (MANHANVIEN), tổng tiền hóa đơn (TONGTIEN), ngày tạo hóa đơn (NGAYTAO), và phương thức thanh toán (PHUONGTHUCTHANHTOAN).

**CHITIETHOADON (MAHOADON, MASANPHAM, SOLUONG, THANHTIEN)** <br>
Tân từ: Bảng chi tiết hóa đơn ghi lại các sản phẩm được bán trong từng hóa đơn, gồm mã hóa đơn (MAHOADON), mã sản phẩm (MASANPHAM), số lượng sản phẩm bán ra (SOLUONG) và thành tiền tương ứng (THANHTIEN).

**KHOSANPHAM_QLKHO (MASANPHAM, MACHINHANH, SOLUONG, NGAYCAPNHAT)** <br>
Tân từ: Bảng này quản lý việc nhập kho cũng như số lượng tồn kho của sản phẩm tại từng chi nhánh, gồm mã sản phẩm (MASANPHAM), mã chi nhánh (MACHINHANH), số lượng tồn (SOLUONG) và ngày cập nhật tồn kho (NGAYCAPNHAT).
 
**KHOSANPHAM_QLBANHANG (MASANPHAM, MACHINHANH, TINHTRANG, NGAYCAPNHAT, TONGSOLUONGDABAN, TONGSOLUONGDANHGIA, TONGSOLUONGSAO)** <br>
Tân từ: Bảng này quản lý tình trạng bán hàng của sản phẩm tại các chi nhánh, gồm mã sản phẩm (MASANPHAM), mã chi nhánh (MACHINHANH), tình trạng còn hàng hoặc hết hàng (TINHTRANG), ngày cập nhật (NGAYCAPNHAT), tổng số lượng sản phẩm đã bán (TONGSOLUONGDABAN), tổng số lượng đánh giá sản phẩm (TONGSOLUONGDANHGIA) và tổng số sao đánh giá trung bình (TONGSOLUONGSAO).

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
  KHOSANPHAM_QLBANHANG1 = 𝜋MaChiNhanh, MaSanPham, TinhTrang, NgayCapNhat, TongSoLuongDaBan, TongSoLuongDanhGia, TongSoLuongSao (KHOSANPHAM ⋉MaChiNhanh CHINHANH1)
  KHOSANPHAM_QLBANHANG2 = 𝜋MaChiNhanh, MaSanPham, TinhTrang, NgayCapNhat, TongSoLuongDaBan, TongSoLuongDanhGia, TongSoLuongSao (KHOSANPHAM ⋉MaChiNhanh CHINHANH2)
  KHOSANPHAM_QLBANHANG3 = 𝜋MaChiNhanh, MaSanPham, TinhTrang, NgayCapNhat, TongSoLuongDaBan, TongSoLuongDanhGia, TongSoLuongSao (KHOSANPHAM ⋉MaChiNhanh CHINHANH3)

- Quan hệ KHACHHANG, SANPHAM, DANHMUC_SANPHAM, THUOCTINHSANPHAM được nhân bản tại tất cả các chi nhánh.
```
