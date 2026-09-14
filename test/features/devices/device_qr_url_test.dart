import 'package:flutter_test/flutter_test.dart';
import 'package:quanlymaygiat/features/devices/presentation/screens/device_detail_screen.dart';

// QR dán trên máy phải trỏ đúng định dạng URL app Android cũ dùng khi in QR
// (CreateDeviceActivity/DeviceDetailActivity: "<baseUrl>/?maMayGiat=<deviceName>")
// — xem SEPAY_INTEGRATION_PLAN.md mục 8.
void main() {
  group('deviceQrUrl', () {
    test('ghép đúng baseUrl + maMayGiat theo deviceName', () {
      expect(
        deviceQrUrl('https://maygiat.online', 'm014'),
        'https://maygiat.online/?maMayGiat=m014',
      );
    });

    test('không tự đổi hoa/thường deviceName (giữ nguyên như đã lưu)', () {
      expect(
        deviceQrUrl('https://maygiat.online', 'M014'),
        'https://maygiat.online/?maMayGiat=M014',
      );
    });
  });
}
