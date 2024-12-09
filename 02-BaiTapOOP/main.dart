import 'cuahang.dart';
void main() {
  // Tạo cửa hàng
  CuaHang cuaHang = CuaHang("Cửa hàng A", "123 Đường ABC", [], []);

  // Thêm điện thoại
  cuaHang.themDienThoai("DT001", "iPhone 14", "Apple", 20000000, 25000000, 10, true);
  cuaHang.themDienThoai("DT002", "Galaxy S23", "Samsung", 15000000, 20000000, 5, true);

  // Cập nhật thông tin điện thoại
  cuaHang.capNhatDT("DT001", giaBan: 26000000);

  // Tạo hóa đơn
  cuaHang.taoHoaDon("HD001", DateTime.now(), "DT001", 2, 26000000, "Nguyen Van A", "0901234567");

  // Báo cáo doanh thu
  double doanhThu = cuaHang.doanhThuTheoThoiGian(DateTime(2024, 1, 1), DateTime(2024, 12, 31));
  print("Doanh thu: $doanhThu");

  // Báo cáo tồn kho
  cuaHang.baoCaoTonKho();

  // Top bán chạy
  var topBanChay = cuaHang.topBanChay();
  print("Top bán chạy: $topBanChay");
}
