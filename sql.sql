CREATE DATABASE QLVEMAYBAY;
GO
USE QLVEMAYBAY;
GO
CREATE TABLE SanBay (
    MaSanBay INT PRIMARY KEY,
    TenSanBay VARCHAR(100) NOT NULL,
    ThanhPho VARCHAR(100) NOT NULL,
    QuocGia VARCHAR(100) NOT NULL,
    MaSanBayKyHieu VARCHAR(10) UNIQUE NOT NULL
);
CREATE TABLE ChuyenBay (
    MaChuyenBay INT PRIMARY KEY,
    SoHieuChuyenBay VARCHAR(20) NOT NULL,
    MaSanBayDi INT NOT NULL,
    MaSanBayDen INT NOT NULL,
    GioKhoiHanh DATETIME NOT NULL,
    GioDen DATETIME NOT NULL,
    HangHangKhong VARCHAR(50),
    Gia DECIMAL(10, 2) NOT NULL,
    SoGheTrong INT NOT NULL,
    FOREIGN KEY (MaSanBayDi) REFERENCES SanBay(MaSanBay),
    FOREIGN KEY (MaSanBayDen) REFERENCES SanBay(MaSanBay)
);
CREATE TABLE KhachHang (
    MaKhachHang INT PRIMARY KEY,
    HoVaTen VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    SoDienThoai VARCHAR(15),
    NgaySinh DATE,
    GioiTinh VARCHAR(10) NOT NULL,
    CONSTRAINT ChkGioiTinh CHECK (GioiTinh IN ('Nam', 'Nu', 'Khac'))
);
CREATE TABLE DatVe (
    MaDatVe INT PRIMARY KEY,
    MaKhachHang INT NOT NULL,
    MaChuyenBay INT NOT NULL,
    NgayDat DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    SoLuongVe INT NOT NULL,
    TongTien DECIMAL(10, 2) NOT NULL,
    TrangThai VARCHAR(20) DEFAULT 'DaDat',
    CONSTRAINT ChkTrangThai CHECK (TrangThai IN ('DaDat', 'DaHuy', 'HoanTat')),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
    FOREIGN KEY (MaChuyenBay) REFERENCES ChuyenBay(MaChuyenBay)
);
CREATE TABLE ThanhToan (
    MaThanhToan INT PRIMARY KEY,
    MaDatVe INT NOT NULL,
    NgayThanhToan DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    SoTien DECIMAL(10, 2) NOT NULL,
    PhuongThucThanhToan VARCHAR(20) NOT NULL,
    TrangThai VARCHAR(20) DEFAULT 'DangCho',
    CONSTRAINT ChkPhuongThuc CHECK (PhuongThucThanhToan IN ('TheTinDung', 'TheGhiNo', 'PayPal', 'ChuyenKhoan')),
    CONSTRAINT ChkTrangThaiTT CHECK (TrangThai IN ('DangCho', 'ThanhCong', 'ThatBai')),
    FOREIGN KEY (MaDatVe) REFERENCES DatVe(MaDatVe)
);
INSERT INTO ChuyenBay (MaChuyenBay, SoHieuChuyenBay, MaSanBayDi, MaSanBayDen, GioKhoiHanh, GioDen, HangHangKhong, Gia, SoGheTrong) 
VALUES 
(1, 'VN123', 1, 2, '2024-12-01 08:00:00', '2024-12-01 11:00:00', 'Vietnam Airlines', 1500000, 100),
(2, 'QH456', 3, 1, '2024-12-02 15:00:00', '2024-12-02 18:30:00', 'Bamboo Airways', 2000000, 120),
(3, 'VJ789', 2, 3, '2024-12-03 10:00:00', '2024-12-03 13:00:00', 'VietJet Air', 1200000, 80);
INSERT INTO SanBay (MaSanBay, TenSanBay, ThanhPho, QuocGia, MaSanBayKyHieu) 
VALUES 
(1, 'San bay Noi Bai', 'Ha Noi', 'Viet Nam', 'HAN'),
(2, 'San bay Tan Son Nhat', 'TP. Ho Chi Minh', 'Viet Nam', 'SGN'),
(3, 'San bay Da Nang', 'Da Nang', 'Viet Nam', 'DAD');
INSERT INTO KhachHang (MaKhachHang, HoVaTen, Email, SoDienThoai, NgaySinh, GioiTinh) 
VALUES 
(1, 'Ha Quoc Thanh', 'haquocthanhnb@gmail.com', '0986830471', '2004-04-13', 'Nam'),
(2, 'Tran Thi B', 'tranthib@gmail.com', '0912345678', '1985-05-15', 'Nu'),
(3, 'Le Van C', 'levanc@gmail.com', '0923456789', '2000-07-20', 'Nam');
INSERT INTO DatVe (MaDatVe, MaKhachHang, MaChuyenBay, NgayDat, SoLuongVe, TongTien, TrangThai) 
VALUES 
(1, 1, 1, '2024-11-15 10:00:00', 2, 3000000, 'DaDat'),
(2, 2, 2, '2024-11-16 12:30:00', 1, 2000000, 'HoanTat'),
(3, 3, 3, '2024-11-17 09:00:00', 3, 3600000, 'DaDat');
INSERT INTO ThanhToan (MaThanhToan, MaDatVe, NgayThanhToan, SoTien, PhuongThucThanhToan, TrangThai) 
VALUES 
(1, 1, '2024-11-15 10:05:00', 3000000, 'TheTinDung', 'ThanhCong'),
(2, 2, '2024-11-16 12:35:00', 2000000, 'ChuyenKhoan', 'ThanhCong'),
(3, 3, '2024-11-17 09:05:00', 3600000, 'TheGhiNo', 'DangCho');
SELECT * FROM SanBay;
SELECT * FROM ChuyenBay;
SELECT * FROM KhachHang;
SELECT * FROM DatVe;
SELECT * FROM ThanhToan;
