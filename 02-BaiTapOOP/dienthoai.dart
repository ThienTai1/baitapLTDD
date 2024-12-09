

class DienThoai {
  String _maDT;
  String _tenDT;
  String _hangSX;
  double _giaNhap;
  double _giaBan;
  int _tonKho;
  bool _trangThai;

  // Contructor
  DienThoai(this._maDT, this._tenDT, this._hangSX, this._giaNhap, this._giaBan, this._tonKho, this._trangThai);

  // Getters
  String get maDT => _maDT;
  String get tenDT =>_tenDT;
  String get hangSX => _hangSX;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get tonKho => _tonKho;
  bool get trangThai => _trangThai;

  // Setters
  set maDT(String maDT){
    if(maDT.isNotEmpty && maDT.startsWith("DT")){
      _maDT = maDT;
    }
  }

  set tenDT(String tenDT){
    if(tenDT.isNotEmpty){
      _tenDT = tenDT;
    }
  }

  set hangSX(String hangSX){
    if(hangSX.isNotEmpty){
      _hangSX = hangSX;
    }
  }
  set giaNhap(double giaNhap){
    if(giaNhap > 0 ){
      _giaNhap = giaNhap;
    }
  }
  set giaBan(double giaBan){
    if(giaBan > 0 && giaBan > giaNhap){
      _giaBan = giaBan;
    }
  }

  set tonKho(int tonKho){
    if (tonKho >= 0){
      _tonKho = tonKho;
    }
  }

  set trangThai(bool trangThai){
    _trangThai = trangThai;
  }

  // Methods
  double loiNhuanDuKien(){
    return giaBan - giaNhap;
  }

  void hienThiThongTin(){
    print("Ma dien thoai: $maDT");
    print("Ten dien thoai: $tenDT");
    print("Hang san xuat: $hangSX");
    print("Gia nhap: $giaNhap");
    print("Gia ban: $giaBan");
    print("Ton kho: $tonKho");
  }

  bool coTheBan(){
    if(tonKho>0 && trangThai==true){
      return true;
    }
    return false;
  }
}