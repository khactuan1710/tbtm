import 'package:flutter_test/flutter_test.dart';
import 'package:quanlymaygiat/features/users/data/models/register_request_dto.dart';
import 'package:quanlymaygiat/features/users/presentation/cubit/create_account_cubit.dart';

// User: màn "Tạo tài khoản" báo lỗi "Cập nhật đầy đủ các trường!" dù đã nhập
// hết thông tin trên UI. Nguyên nhân: server (POST /register) bắt buộc CẢ
// eWeLinkAccount/eWeLinkPassword (không có ô nhập ở UI cũ) VÀ addressNew
// phải là mảng KHÔNG RỖNG (UI cũ luôn gửi []) — request luôn thiếu trường dù
// user nhập gì. Test này khoá lại: buildRegisterRequest() phải validate đủ
// và dựng request có đủ mọi trường server yêu cầu.
void main() {
  group('buildRegisterRequest', () {
    ({RegisterRequestDto? request, String? error}) validCall({
      String? address = 'Số 1, Hà Nội',
      String? eWeLinkAccount = 'ewelink_user',
      String? eWeLinkPassword = 'ewelink_pass',
    }) => buildRegisterRequest(
      username: 'chu_tro_1',
      password: 'matkhau123',
      fullName: 'Nguyễn Văn A',
      phoneNumber: '0912345678',
      address: address,
      percentText: '10',
      bankCode: 'TPB',
      bankAccountNumber: '0123456789',
      bankAccountName: 'NGUYEN VAN A',
      eWeLinkAccount: eWeLinkAccount,
      eWeLinkPassword: eWeLinkPassword,
      type: 'user',
    );

    test(
      'ĐÚNG BUG: nhập đủ mọi ô UI cũ (thiếu eWeLink) → server vẫn từ chối vì '
      'thiếu eWeLinkAccount/eWeLinkPassword',
      () {
        final result = validCall(eWeLinkAccount: null, eWeLinkPassword: null);
        expect(result.request, isNull);
        expect(result.error, contains('eWeLink'));
      },
    );

    test('thiếu địa chỉ → lỗi, không tạo request (addressNew sẽ rỗng)', () {
      final result = validCall(address: '');
      expect(result.request, isNull);
      expect(result.error, contains('địa chỉ'));
    });

    test('nhập đủ mọi trường bắt buộc → tạo request thành công', () {
      final result = validCall();
      expect(result.error, isNull);
      expect(result.request, isNotNull);
    });

    test(
      'request tạo ra có ĐỦ mọi trường server /register yêu cầu (app.py:1080)',
      () {
        final request = validCall().request!;
        expect(request.username, isNotEmpty);
        expect(request.password, isNotEmpty);
        expect(request.fullName, isNotEmpty);
        expect(request.phoneNumber, isNotEmpty);
        expect(request.eWeLinkAccount, isNotEmpty);
        expect(request.eWeLinkPassword, isNotEmpty);
        expect(request.bankCode, isNotEmpty);
        expect(request.bankAccountNumber, isNotEmpty);
        expect(request.bankAccountName, isNotEmpty);
        expect(request.type, isNotEmpty);
        // Trường "gãy" nhất trước fix — Python coi [] là falsy, PHẢI có ít
        // nhất 1 phần tử.
        expect(request.addressNew, isNotEmpty);
        expect(request.addressNew, ['Số 1, Hà Nội']);
      },
    );

    test(
      'type="admin" giữ nguyên "admin", type khác (vd "user") map thành '
      '"host" — khớp quy ước server/app Android, không gửi thẳng "user"',
      () {
        final asAdmin = buildRegisterRequest(
          username: 'u',
          password: 'p',
          fullName: 'n',
          address: 'a',
          eWeLinkAccount: 'e',
          eWeLinkPassword: 'e',
          type: 'admin',
        ).request!;
        expect(asAdmin.type, 'admin');

        final asUser = buildRegisterRequest(
          username: 'u',
          password: 'p',
          fullName: 'n',
          address: 'a',
          eWeLinkAccount: 'e',
          eWeLinkPassword: 'e',
          type: 'user',
        ).request!;
        expect(asUser.type, 'host');
      },
    );
  });
}
