import 'package:auto_route/auto_route.dart';
import 'package:quanlymaygiat/features/users/domain/entities/user_entity.dart';
import 'package:quanlymaygiat/features/users/presentation/cubit/user_detail_cubit.dart';
import 'package:quanlymaygiat/shared/design_system/design_system.dart';

@RoutePage()
class UserDetailScreen extends BasePage<UserDetailCubit, UserDetailState> {
  const UserDetailScreen({super.key, required this.user});

  final UserEntity user;

  @override
  List<BlocProvider> get providers => [
    BlocProvider<UserDetailCubit>(
      create: (_) => getIt<UserDetailCubit>(param1: user),
    ),
  ];

  @override
  Widget buildContent(BuildContext context) {
    return BlocBuilder<UserDetailCubit, UserDetailState>(
      builder: (context, state) {
        final cubit = context.read<UserDetailCubit>();
        final u = state.user;
        return AppScaffold(
          appBar: BaseAppBar(
            title: u.fullName.isEmpty ? 'Chi tiết người dùng' : u.fullName,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(16.s, 16.s, 16.s, 16.s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _HeaderCard(user: u),
                Gap(16.s),
                _InfoCard(user: u),
              ],
            ),
          ),
          bottomBar: SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.s, 8.s, 16.s, 12.s),
                child: Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        label: 'Chỉnh sửa',
                        variant: AppButtonVariant.outlined,
                        icon: Icons.edit_rounded,
                        onPressed: () => _openEdit(context, cubit),
                      ),
                    ),
                    Gap(12.s),
                    Expanded(
                      child: AppButton(
                        label: 'Đổi mật khẩu',
                        icon: Icons.lock_reset_rounded,
                        onPressed: () => _openChangePassword(context, cubit),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
      },
    );
  }

  Future<void> _openEdit(BuildContext context, UserDetailCubit cubit) {
    return AppBottomSheet.show<void>(
      context,
      title: 'Chỉnh sửa thông tin',
      body: BlocProvider<UserDetailCubit>.value(
        value: cubit,
        child: _EditForm(user: cubit.state.user),
      ),
    );
  }

  Future<void> _openChangePassword(
    BuildContext context,
    UserDetailCubit cubit,
  ) {
    return AppBottomSheet.show<void>(
      context,
      title: 'Đổi mật khẩu',
      body: BlocProvider<UserDetailCubit>.value(
        value: cubit,
        child: const _ChangePasswordForm(),
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    final isAdmin = user.isAdmin;
    final letter = user.fullName.trim().isNotEmpty
        ? user.fullName.trim().substring(0, 1).toUpperCase()
        : '?';

    return AppCard(
      child: Row(
        children: [
          Container(
            width: 60.s,
            height: 60.s,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isAdmin ? AppColors.infoSoft : AppColors.primarySoft,
              shape: BoxShape.circle,
            ),
            child: Text(
              letter,
              style: TextStyle(
                fontSize: 26.s,
                fontWeight: FontWeight.w800,
                color: isAdmin ? AppColors.info : AppColors.primary,
              ),
            ),
          ),
          Gap(16.s),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.fullName.isEmpty ? 'Chưa đặt tên' : user.fullName,
                  style: TextStyle(
                    fontSize: 18.s,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                    height: 1.25,
                  ),
                ),
                Gap(4.s),
                Text(
                  '@${user.username}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13.s, color: AppColors.textSecondary),
                ),
                Gap(10.s),
                AppStatusBadge(
                  label: isAdmin ? 'Quản trị viên' : 'Người dùng',
                  color: isAdmin ? AppColors.info : AppColors.statusIdle,
                  background: isAdmin ? AppColors.infoSoft : AppColors.disabledBg,
                  icon: isAdmin ? Icons.shield_rounded : Icons.person_rounded,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.user});

  final UserEntity user;

  String _orDash(String value) => value.trim().isEmpty ? '—' : value;

  @override
  Widget build(BuildContext context) {
    final isActive = user.isActive;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Thông tin chi tiết',
            style: TextStyle(
              fontSize: 15.s,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          Gap(4.s),
          AppInfoRow(
            label: 'Họ tên',
            value: _orDash(user.fullName),
            icon: Icons.badge_outlined,
          ),
          const Divider(height: 1),
          AppInfoRow(
            label: 'Tài khoản',
            value: _orDash(user.username),
            icon: Icons.alternate_email_rounded,
          ),
          const Divider(height: 1),
          AppInfoRow(
            label: 'Số điện thoại',
            value: _orDash(user.phoneNumber),
            icon: Icons.phone_outlined,
          ),
          const Divider(height: 1),
          _AddressBlock(user: user),
          const Divider(height: 1),
          AppInfoRow(
            label: 'Loại',
            value: user.isAdmin ? 'Quản trị viên' : 'Người dùng',
            icon: Icons.workspace_premium_outlined,
          ),
          const Divider(height: 1),
          AppInfoRow(
            label: 'Ngân hàng',
            value: _orDash(user.bankCode),
            icon: Icons.account_balance_outlined,
          ),
          const Divider(height: 1),
          AppInfoRow(
            label: 'Số tài khoản',
            value: _orDash(user.bankAccountNumber),
            icon: Icons.credit_card_outlined,
          ),
          const Divider(height: 1),
          AppInfoRow(
            label: 'Chủ tài khoản',
            value: _orDash(user.bankAccountName),
            icon: Icons.person_outline_rounded,
          ),
          const Divider(height: 1),
          AppInfoRow(
            label: 'Trạng thái',
            value: isActive ? 'Đang hoạt động' : 'Đã khoá',
            valueColor: isActive ? AppColors.success : AppColors.error,
            icon: Icons.toggle_on_outlined,
          ),
        ],
      ),
    );
  }
}

/// Shows a user's addresses. A user may have several (the `addressNew` list);
/// falls back to the legacy single `address` when the list is empty.
class _AddressBlock extends StatelessWidget {
  const _AddressBlock({required this.user});

  final UserEntity user;

  List<String> get _addresses {
    final list =
        user.addressNew.map((a) => a.trim()).where((a) => a.isNotEmpty).toList();
    if (list.isEmpty && user.address.trim().isNotEmpty) {
      return [user.address.trim()];
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final addresses = _addresses;

    // 0 or 1 address → same compact row as the other info fields.
    if (addresses.length <= 1) {
      return AppInfoRow(
        label: 'Địa chỉ',
        value: addresses.isEmpty ? '—' : addresses.first,
        icon: Icons.location_on_outlined,
      );
    }

    // Multiple addresses → labelled list with a count.
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_on_outlined,
                  size: 16.s, color: AppColors.textTertiary),
              Gap(6.s),
              Text('Địa chỉ',
                  style:
                      TextStyle(fontSize: 14.s, color: AppColors.textSecondary)),
              Gap(6.s),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7.s, vertical: 2.s),
                decoration: BoxDecoration(
                  color: AppColors.primarySoft,
                  borderRadius: BorderRadius.circular(10.s),
                ),
                child: Text(
                  '${addresses.length}',
                  style: TextStyle(
                    fontSize: 11.s,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          Gap(10.s),
          for (int i = 0; i < addresses.length; i++)
            Padding(
              padding:
                  EdgeInsets.only(bottom: i == addresses.length - 1 ? 0 : 10.s),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 22.s,
                    height: 22.s,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColors.primarySoft,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${i + 1}',
                      style: TextStyle(
                        fontSize: 11.s,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  Gap(10.s),
                  Expanded(
                    child: Text(
                      addresses[i],
                      style: TextStyle(
                        fontSize: 14.s,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        height: 1.35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _EditForm extends StatefulWidget {
  const _EditForm({required this.user});

  final UserEntity user;

  @override
  State<_EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<_EditForm> {
  late final TextEditingController _fullName =
      TextEditingController(text: widget.user.fullName);
  late final TextEditingController _phone =
      TextEditingController(text: widget.user.phoneNumber);
  late final TextEditingController _address =
      TextEditingController(text: widget.user.address);
  late final TextEditingController _bankCode =
      TextEditingController(text: widget.user.bankCode);
  late final TextEditingController _bankNumber =
      TextEditingController(text: widget.user.bankAccountNumber);
  late final TextEditingController _bankName =
      TextEditingController(text: widget.user.bankAccountName);

  String? _nameError;

  @override
  void dispose() {
    _fullName.dispose();
    _phone.dispose();
    _address.dispose();
    _bankCode.dispose();
    _bankNumber.dispose();
    _bankName.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_fullName.text.trim().isEmpty) {
      setState(() => _nameError = 'Vui lòng nhập họ tên');
      return;
    }
    setState(() => _nameError = null);

    final ok = await context.read<UserDetailCubit>().updateInfo(
      fullName: _fullName.text.trim(),
      phoneNumber: _phone.text.trim(),
      address: _address.text.trim(),
      bankCode: _bankCode.text.trim(),
      bankAccountNumber: _bankNumber.text.trim(),
      bankAccountName: _bankName.text.trim(),
    );
    if (ok && mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20.s, 8.s, 20.s, 20.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            label: 'Họ tên',
            controller: _fullName,
            isRequired: true,
            hint: 'Nhập họ và tên',
            errorText: _nameError,
            textInputAction: TextInputAction.next,
            prefixIcon: Icon(Icons.badge_outlined,
                size: 20.s, color: AppColors.textTertiary),
          ),
          Gap(14.s),
          AppTextField(
            label: 'Số điện thoại',
            controller: _phone,
            hint: 'Nhập số điện thoại',
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            prefixIcon: Icon(Icons.phone_outlined,
                size: 20.s, color: AppColors.textTertiary),
          ),
          Gap(14.s),
          AppTextField(
            label: 'Địa chỉ',
            controller: _address,
            hint: 'Nhập địa chỉ',
            maxLines: 2,
            textInputAction: TextInputAction.next,
            prefixIcon: Icon(Icons.location_on_outlined,
                size: 20.s, color: AppColors.textTertiary),
          ),
          Gap(14.s),
          AppTextField(
            label: 'Mã ngân hàng',
            controller: _bankCode,
            hint: 'Ví dụ: VCB, TCB...',
            textInputAction: TextInputAction.next,
            prefixIcon: Icon(Icons.account_balance_outlined,
                size: 20.s, color: AppColors.textTertiary),
          ),
          Gap(14.s),
          AppTextField(
            label: 'Số tài khoản',
            controller: _bankNumber,
            hint: 'Nhập số tài khoản',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            prefixIcon: Icon(Icons.credit_card_outlined,
                size: 20.s, color: AppColors.textTertiary),
          ),
          Gap(14.s),
          AppTextField(
            label: 'Chủ tài khoản',
            controller: _bankName,
            hint: 'Nhập tên chủ tài khoản',
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _submit(),
            prefixIcon: Icon(Icons.person_outline_rounded,
                size: 20.s, color: AppColors.textTertiary),
          ),
          Gap(22.s),
          BlocBuilder<UserDetailCubit, UserDetailState>(
            builder: (context, state) => AppButton(
              label: 'Lưu thay đổi',
              icon: Icons.check_rounded,
              loading: state.isSaving,
              onPressed: _submit,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChangePasswordForm extends StatefulWidget {
  const _ChangePasswordForm();

  @override
  State<_ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<_ChangePasswordForm> {
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  String? _newError;
  String? _confirmError;

  @override
  void dispose() {
    _newPassword.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final newPw = _newPassword.text;
    final confirmPw = _confirmPassword.text;

    var hasError = false;
    String? newError;
    String? confirmError;

    if (newPw.trim().isEmpty) {
      newError = 'Vui lòng nhập mật khẩu mới';
      hasError = true;
    } else if (newPw.length < 6) {
      newError = 'Mật khẩu tối thiểu 6 ký tự';
      hasError = true;
    }
    if (!hasError && newPw != confirmPw) {
      confirmError = 'Mật khẩu nhập lại không khớp';
      hasError = true;
    }

    setState(() {
      _newError = newError;
      _confirmError = confirmError;
    });
    if (hasError) return;

    final ok = await context.read<UserDetailCubit>().changePassword(newPw);
    if (ok && mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20.s, 8.s, 20.s, 20.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppPasswordField(
            label: 'Mật khẩu mới',
            controller: _newPassword,
            hint: 'Nhập mật khẩu mới',
            isRequired: true,
            errorText: _newError,
            textInputAction: TextInputAction.next,
          ),
          Gap(14.s),
          AppPasswordField(
            label: 'Nhập lại mật khẩu',
            controller: _confirmPassword,
            hint: 'Nhập lại mật khẩu mới',
            isRequired: true,
            errorText: _confirmError,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _submit(),
          ),
          Gap(22.s),
          BlocBuilder<UserDetailCubit, UserDetailState>(
            builder: (context, state) => AppButton(
              label: 'Cập nhật mật khẩu',
              icon: Icons.lock_reset_rounded,
              loading: state.isSaving,
              onPressed: _submit,
            ),
          ),
        ],
      ),
    );
  }
}
