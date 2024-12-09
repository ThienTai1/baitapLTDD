// import 'dart:io';

import 'dienthoai.dart';

class HoaDon {
  String _maHD;
  DateTime _ngayBan;
  DienThoai _dienThoai;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKH;
  String _sdt;

  HoaDon(this._maHD, this._ngayBan, this._dienThoai, this._soLuongMua,
      this._giaBanThucTe, this._tenKH, this._sdt);

  // Getters
  String get maHD => _maHD;
  DateTime get ngayBan => _ngayBan;
  DienThoai get dienThoai => _dienThoai;
  int get soLuongMua => _soLuongMua;
  double get giaBanThucTe => _giaBanThucTe;
  String get tenKH => _tenKH;
  String get sdt => _sdt;

  // Setters
  set maHD (String maHD){
    if(maHD.isNotEmpty && maHD.startsWith("HD")){
      _maHD = maHD;
    }
  }
  set ngayBan(DateTime ngayBan){
    if(ngayBan.isAfter(DateTime.now())){
      _ngayBan = ngayBan;
    }
  }

  set soLuongMua(int soLuongMua){
    if(soLuongMua > 0){
      _soLuongMua = soLuongMua;
    }
  }

  set giaBanThucTe(double giaBanThucTe){
    if(giaBanThucTe > 0){
      _giaBanThucTe = giaBanThucTe;
    }
  }

  set tenKH(String tenKH){
    if (tenKH.isNotEmpty){
      _tenKH = tenKH;
    }
  }

  set sdt(String sdt){
    if (sdt.isNotEmpty){
      _sdt = sdt;
    }
  }

  set dienThoai(DienThoai dienThoai){
    _dienThoai = dienThoai;
  }

  double tongTien(){
    return dienThoai.giaBan * soLuongMua;
  }

  double loiNhuanThucTe(){
    return (giaBanThucTe - dienThoai.giaNhap) * soLuongMua;
  }

  void hienThiThongTin(){
    print("Ma hoa don: $maHD");
    print("Ngay ban: $ngayBan");
    print("San pham: $dienThoai");
    print("So luong san pham: $soLuongMua");
    print("Tong tien: ${tongTien()}");
    print("Loi nhuan thuc te: ${loiNhuanThucTe()}");
    print("Ten khach hang: $tenKH");
    print("So dien thoai: $sdt");
  }
}
