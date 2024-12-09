import 'dienthoai.dart';
import 'hoadon.dart';

class CuaHang {
  String _tenCH;
  String _diaChi;
  List<DienThoai> _dienThoais = [];
  List<HoaDon> _hoaDons = [];

  CuaHang(this._tenCH, this._diaChi, this._dienThoais, this._hoaDons);

  // Getters
  String get tenCH => _tenCH;
  String get diaChi => _diaChi;
  List<DienThoai> get dienThoais => _dienThoais;
  List<HoaDon> get hoaDons => _hoaDons;

  // Setters
  set tenCH(String tenCH) {
    if (tenCH.isNotEmpty) {
      _tenCH = tenCH;
    }
  }

  set diaChi(String diaChi) {
    if (diaChi.isNotEmpty) {
      _diaChi = diaChi;
    }
  }

  // Methods
  void addDienThoai(DienThoai dienThoai) {
    _dienThoais.add(dienThoai);
  }

  void addHoaDon(HoaDon hoaDon) {
    _hoaDons.add(hoaDon);
  }

  void themDienThoai(String maDT, String tenDT, String hangSX, double giaNhap,
      double giaBan, int tonKho, bool trangThai) {
    if (maDT.isNotEmpty &&
        maDT.startsWith("DT") &&
        tenDT.isNotEmpty &&
        hangSX.isNotEmpty &&
        giaNhap > 0 &&
        giaBan > giaNhap &&
        tonKho >= 0) {
      DienThoai dt =
          DienThoai(maDT, tenDT, hangSX, giaNhap, giaBan, tonKho, trangThai);
      _dienThoais.add(dt);
      print("Điện thoại mới đã được thêm.");
    } else {
      print("Thông tin điện thoại không hợp lệ.");
    }
  }

  void capNhatDT(String maDT,
      {String? tenDT,
      String? hangSX,
      double? giaNhap,
      double? giaBan,
      int? tonKho,
      bool? trangThai}) {
    for (var dt in _dienThoais) {
      if (dt.maDT == maDT) {
        if (tenDT != null) dt.tenDT = tenDT;
        if (hangSX != null) dt.hangSX = hangSX;
        if (giaNhap != null && giaNhap > 0) dt.giaNhap = giaNhap;
        if (giaNhap != null){
          if (giaBan != null && giaBan > giaNhap) dt.giaBan = giaBan;
        } 
        if (tonKho != null && tonKho >= 0) dt.tonKho = tonKho;
        if (trangThai != null) dt.trangThai = trangThai;
        print("Cập nhật thành công.");
        return;
      }
    }
    print("Không tìm thấy mã điện thoại.");
  }

  void taoHoaDon(String maHD, DateTime ngayBan, String maDT, int soLuongMua,
      double giaBanThucTe, String tenKH, String sdt) {
    DienThoai? dienThoai = _dienThoais.firstWhere((dt) => dt.maDT == maDT);
    if (dienThoai == null ||
        !dienThoai.coTheBan() ||
        dienThoai.tonKho < soLuongMua) {
      print(
          "Không thể tạo hóa đơn. Kiểm tra tồn kho hoặc trạng thái sản phẩm.");
      return;
    }

    // Trừ tồn kho
    dienThoai.tonKho -= soLuongMua;

    HoaDon hoaDon =
        HoaDon(maHD, ngayBan, dienThoai, soLuongMua, giaBanThucTe, tenKH, sdt);
    _hoaDons.add(hoaDon);
    print("Hóa đơn đã được tạo.");
  }

  double doanhThuTheoThoiGian(DateTime tuNgay, DateTime denNgay) {
    return _hoaDons
        .where(
            (hd) => hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay))
        .fold(0.0, (sum, hd) => sum + hd.tongTien());
  }

  double loiNhuanTheoThoiGian(DateTime tuNgay, DateTime denNgay) {
    return _hoaDons
        .where(
            (hd) => hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay))
        .fold(0.0, (sum, hd) => sum + hd.loiNhuanThucTe());
  }

  List<Map<String, dynamic>> topBanChay() {
    var banChay = <String, int>{};

    for (var hd in _hoaDons) {
      banChay[hd.dienThoai.maDT] =
          (banChay[hd.dienThoai.maDT] ?? 0) + hd.soLuongMua;
    }

    var sorted = banChay.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return sorted.map((e) => {'maDT': e.key, 'soLuong': e.value}).toList();
  }

  void baoCaoTonKho() {
    for (var dt in _dienThoais) {
      print("Mã: ${dt.maDT}, Tên: ${dt.tenDT}, Tồn kho: ${dt.tonKho}");
    }
  }
}
