from app import db
from flask_login import UserMixin


class Baocaocongno(db.Model):
    __tablename__ = 'baocaocongno'

    MaBaoCao = db.Column(db.Integer, primary_key=True, autoincrement=True)
    Thang = db.Column(db.Integer, nullable=False)
    Nam = db.Column(db.Integer, nullable=False)



class Baocaoton(db.Model):
    __tablename__ = 'baocaoton'

    MaBaoCao = db.Column(db.Integer, primary_key=True, autoincrement=True)
    Thang = db.Column(db.Integer, nullable=False)
    Nam = db.Column(db.Integer, nullable=False)



class Chitietbaocaocongno(db.Model):
    __tablename__ = 'chitietbaocaocongno'

    MaBaoCao = db.Column(db.ForeignKey('baocaocongno.MaBaoCao'), primary_key=True, nullable=False)
    MaKhachHang = db.Column(db.ForeignKey('khachhang.MaKhachHang'), primary_key=True, nullable=False, index=True)
    SoTienNoDau = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    SoTienNoCuoi = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())

    baocaocongno = db.relationship('Baocaocongno', primaryjoin='Chitietbaocaocongno.MaBaoCao == Baocaocongno.MaBaoCao', backref='chitietbaocaocongnoes')
    khachhang = db.relationship('Khachhang', primaryjoin='Chitietbaocaocongno.MaKhachHang == Khachhang.MaKhachHang', backref='chitietbaocaocongnoes')



class Chitietbaocaoton(db.Model):
    __tablename__ = 'chitietbaocaoton'

    MaBaoCao = db.Column(db.ForeignKey('baocaoton.MaBaoCao'), primary_key=True, nullable=False)
    MaSach = db.Column(db.ForeignKey('sach.MaSach'), primary_key=True, nullable=False, index=True)
    SoLuongTonDau = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    SoLuongTonCuoi = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())

    baocaoton = db.relationship('Baocaoton', primaryjoin='Chitietbaocaoton.MaBaoCao == Baocaoton.MaBaoCao', backref='chitietbaocaotons')
    sach = db.relationship('Sach', primaryjoin='Chitietbaocaoton.MaSach == Sach.MaSach', backref='chitietbaocaotons')



class Chitiethoadon(db.Model):
    __tablename__ = 'chitiethoadon'

    MaHoaDon = db.Column(db.ForeignKey('hoadon.MaHoaDon'), primary_key=True, nullable=False)
    MaSach = db.Column(db.ForeignKey('sach.MaSach'), primary_key=True, nullable=False, index=True)
    SoLuong = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    DonGia = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())

    hoadon = db.relationship('Hoadon', primaryjoin='Chitiethoadon.MaHoaDon == Hoadon.MaHoaDon', backref='chitiethoadons')
    sach = db.relationship('Sach', primaryjoin='Chitiethoadon.MaSach == Sach.MaSach', backref='chitiethoadons')



class Chitietphieunhap(db.Model):
    __tablename__ = 'chitietphieunhap'

    MaPhieuNhap = db.Column(db.ForeignKey('phieunhap.MaPhieuNhap'), primary_key=True, nullable=False)
    MaSach = db.Column(db.ForeignKey('sach.MaSach'), primary_key=True, nullable=False, index=True)
    SoLuong = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())

    phieunhap = db.relationship('Phieunhap', primaryjoin='Chitietphieunhap.MaPhieuNhap == Phieunhap.MaPhieuNhap', backref='chitietphieunhaps')
    sach = db.relationship('Sach', primaryjoin='Chitietphieunhap.MaSach == Sach.MaSach', backref='chitietphieunhaps')



t_chitiettacgiasach = db.Table(
    'chitiettacgiasach',
    db.Column('MaSach', db.ForeignKey('sach.MaSach'), primary_key=True, nullable=False),
    db.Column('MaTacGia', db.ForeignKey('tacgia.MaTacGia'), primary_key=True, nullable=False, index=True)
)



t_chitiettheloaisach = db.Table(
    'chitiettheloaisach',
    db.Column('MaSach', db.ForeignKey('sach.MaSach'), primary_key=True, nullable=False),
    db.Column('MaTheLoai', db.ForeignKey('theloai.MaTheLoai'), primary_key=True, nullable=False, index=True)
)



class Hoadon(db.Model):
    __tablename__ = 'hoadon'

    MaHoaDon = db.Column(db.Integer, primary_key=True, autoincrement=True)
    MaKhachHang = db.Column(db.ForeignKey('khachhang.MaKhachHang'), nullable=False, index=True)
    NgayLap = db.Column(db.DateTime, nullable=False)
    TienTra = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    TongTien = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    DaLuu = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())

    khachhang = db.relationship('Khachhang', primaryjoin='Hoadon.MaKhachHang == Khachhang.MaKhachHang', backref='hoadons')



class Khachhang(db.Model):
    __tablename__ = 'khachhang'

    MaKhachHang = db.Column(db.Integer, primary_key=True, autoincrement=True)
    HoTen = db.Column(db.String(255, 'utf8mb4_0900_ai_ci'), nullable=False)
    SoTienNo = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    DiaChi = db.Column(db.String(255, 'utf8mb4_0900_ai_ci'))
    DienThoai = db.Column(db.String(20), nullable=False)
    Email = db.Column(db.String(255))
    BiXoa = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    def __str__(self):
        return self.HoTen


class Phanquyen(db.Model):
    __tablename__ = 'phanquyen'

    MaPhanQuyen = db.Column(db.Integer, primary_key=True, autoincrement=True)
    TenPhanQuyen = db.Column(db.String(100, 'utf8mb4_0900_ai_ci'), nullable=False)

    def __str__(self):
        return self.TenPhanQuyen

class Phieunhap(db.Model):
    __tablename__ = 'phieunhap'

    MaPhieuNhap = db.Column(db.Integer, primary_key=True, autoincrement=True)
    NgayNhapKho = db.Column(db.DateTime, nullable=False)
    NgayTaoPhieu = db.Column(db.DateTime, nullable=False)
    MaTaiKhoan = db.Column(db.ForeignKey('taikhoan.MaTaiKhoan'), nullable=False, index=True)
    DaNhap = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())

    taikhoan = db.relationship('Taikhoan', primaryjoin='Phieunhap.MaTaiKhoan == Taikhoan.MaTaiKhoan', backref='phieunhaps')



class Phieuthutien(db.Model):
    __tablename__ = 'phieuthutien'

    MaPhieuThu = db.Column(db.Integer, primary_key=True, autoincrement=True)
    MaKhachHang = db.Column(db.ForeignKey('khachhang.MaKhachHang'), nullable=False, index=True)
    NgayThu = db.Column(db.DateTime, nullable=False)
    SoTienThu = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    MaTaiKhoan = db.Column(db.ForeignKey('taikhoan.MaTaiKhoan'), nullable=False, index=True)

    khachhang = db.relationship('Khachhang', primaryjoin='Phieuthutien.MaKhachHang == Khachhang.MaKhachHang', backref='phieuthutiens')
    taikhoan = db.relationship('Taikhoan', primaryjoin='Phieuthutien.MaTaiKhoan == Taikhoan.MaTaiKhoan', backref='phieuthutiens')



class Quydinh(db.Model):
    __tablename__ = 'quydinh'

    MaQuyDinh = db.Column(db.Integer, primary_key=True, autoincrement=True)
    NgayCapNhat = db.Column(db.DateTime, nullable=False)
    SoLuongSachTonToiThieuDeNhap = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    SoLuongSachNhapToiThieu = db.Column(db.Integer, nullable=False)
    TienNoToiDa = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    SoLuongSachTonToiThieuSauKhiBan = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    DuocThuVuotSoTienKhachHangDangNo = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    #SuDung = db.Column(db.Boolean, default="False")


class Sach(db.Model):
    __tablename__ = 'sach'

    MaSach = db.Column(db.Integer, primary_key=True, autoincrement=True)
    TenSach = db.Column(db.String(255, 'utf8mb4_0900_ai_ci'), nullable=False)
    AnhBia = db.Column(db.String(255))
    SoLuongTon = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    DonGia = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    BiXoa = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())

    tacgia = db.relationship('Tacgia', secondary='chitiettacgiasach', backref='saches')
    theloai = db.relationship('Theloai', secondary='chitiettheloaisach', backref='saches')

    def __str__(self):
        return self.TenSach

class Tacgia(db.Model):
    __tablename__ = 'tacgia'

    MaTacGia = db.Column(db.Integer, primary_key=True, autoincrement=True)
    TenTacGia = db.Column(db.String(255, 'utf8mb4_0900_ai_ci'), nullable=False)

    def __str__(self):
        return self.TenTacGia

class Taikhoan(db.Model, UserMixin):
    __tablename__ = 'taikhoan'

    MaTaiKhoan = db.Column(db.Integer, primary_key=True, autoincrement=True)
    Email = db.Column(db.String(100), nullable=False)
    MatKhau = db.Column(db.String(50), nullable=False)
    HoTen = db.Column(db.String(100, 'utf8mb4_0900_ai_ci'), nullable=False)
    MaPhanQuyen = db.Column(db.ForeignKey('phanquyen.MaPhanQuyen'), nullable=False, index=True)
    BiXoa = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())

    phanquyen = db.relationship('Phanquyen', primaryjoin='Taikhoan.MaPhanQuyen == Phanquyen.MaPhanQuyen', backref='taikhoans')



class Theloai(db.Model):
    __tablename__ = 'theloai'

    MaTheLoai = db.Column(db.Integer, primary_key=True, autoincrement=True)
    TenTheLoai = db.Column(db.String(255, 'utf8mb4_0900_ai_ci'), nullable=False)

    def __str__(self):
        return self.TenTheLoai

if __name__ == '__main__':
    db.drop_all()
    db.create_all()
