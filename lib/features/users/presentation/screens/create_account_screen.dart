import 'package:auto_route/auto_route.dart';
import 'package:quanlymaygiat/features/users/presentation/cubit/create_account_cubit.dart';
import 'package:quanlymaygiat/features/users/presentation/widgets/bank_code_picker.dart';
import 'package:quanlymaygiat/shared/design_system/design_system.dart';

@RoutePage()
class CreateAccountScreen
    extends BasePage<CreateAccountCubit, CreateAccountState> {
  const CreateAccountScreen({super.key});

  @override
  List<BlocProvider> get providers => [
    BlocProvider<CreateAccountCubit>(
      create: (_) => getIt<CreateAccountCubit>()..init(),
    ),
  ];

  @override
  Widget buildContent(BuildContext context) {
    return const _CreateAccountView();
  }
}

class _CreateAccountView extends StatefulWidget {
  const _CreateAccountView();

  @override
  State<_CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<_CreateAccountView> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _percentController = TextEditingController();
  final _bankAccountNumberController = TextEditingController();
  final _bankAccountNameController = TextEditingController();
  final _eWeLinkAccountController = TextEditingController();
  final _eWeLinkPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _percentController.dispose();
    _bankAccountNumberController.dispose();
    _bankAccountNameController.dispose();
    _eWeLinkAccountController.dispose();
    _eWeLinkPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    context.read<CreateAccountCubit>().submit(
      username: _usernameController.text,
      password: _passwordController.text,
      fullName: _fullNameController.text,
      phoneNumber: _phoneController.text,
      address: _addressController.text,
      percentText: _percentController.text,
      bankAccountNumber: _bankAccountNumberController.text,
      bankAccountName: _bankAccountNameController.text,
      eWeLinkAccount: _eWeLinkAccountController.text,
      eWeLinkPassword: _eWeLinkPasswordController.text,
    );
  }

  String _typeLabel(String type) =>
      type == 'admin' ? 'Quản trị' : 'Người dùng';

  Future<void> _pickType() async {
    final cubit = context.read<CreateAccountCubit>();
    final current = cubit.state.type;
    final selected = await AppBottomSheet.show<String>(
      context,
      title: 'Loại tài khoản',
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _typeOption(context, value: 'user', current: current),
          _typeOption(context, value: 'admin', current: current),
          Gap(8.s),
        ],
      ),
    );
    if (selected != null) cubit.setType(selected);
  }

  Widget _typeOption(
    BuildContext context, {
    required String value,
    required String current,
  }) {
    final isSelected = value == current;
    return ListTile(
      onTap: () => Navigator.of(context).pop(value),
      title: Text(
        _typeLabel(value),
        style: TextStyle(
          fontSize: 15.s,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          color: isSelected ? AppColors.primary : AppColors.textPrimary,
        ),
      ),
      trailing: isSelected
          ? Icon(Icons.check_rounded, color: AppColors.primary, size: 22.s)
          : null,
    );
  }

  Future<void> _pickBank() async {
    final cubit = context.read<CreateAccountCubit>();
    final bank = await showBankCodePicker(context, cubit.state.bankCodes);
    if (bank != null) cubit.selectBank(bank);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateAccountCubit, CreateAccountState>(
      listenWhen: (p, c) => p.didCreate != c.didCreate,
      listener: (context, state) {
        if (state.didCreate) context.router.maybePop(true);
      },
      child: AppScaffold(
        appBar: const BaseAppBar(title: 'Tạo tài khoản'),
        body: BlocBuilder<CreateAccountCubit, CreateAccountState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20.s, 16.s, 20.s, 24.s),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppTextField(
                    label: 'Tên đăng nhập',
                    isRequired: true,
                    controller: _usernameController,
                    hint: 'Nhập tên đăng nhập',
                    textInputAction: TextInputAction.next,
                  ),
                  Gap(16.s),
                  AppPasswordField(
                    label: 'Mật khẩu',
                    isRequired: true,
                    controller: _passwordController,
                    hint: 'Nhập mật khẩu',
                    textInputAction: TextInputAction.next,
                  ),
                  Gap(16.s),
                  AppTextField(
                    label: 'Họ tên',
                    isRequired: true,
                    controller: _fullNameController,
                    hint: 'Nhập họ tên',
                    textInputAction: TextInputAction.next,
                  ),
                  Gap(16.s),
                  AppTextField(
                    label: 'Số điện thoại',
                    controller: _phoneController,
                    hint: 'Nhập số điện thoại',
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                  ),
                  Gap(16.s),
                  AppTextField(
                    label: 'Địa chỉ',
                    isRequired: true,
                    controller: _addressController,
                    hint: 'Nhập địa chỉ',
                    textInputAction: TextInputAction.next,
                  ),
                  Gap(16.s),
                  AppTextField(
                    label: 'Tài khoản eWeLink',
                    isRequired: true,
                    controller: _eWeLinkAccountController,
                    hint: 'Nhập tài khoản eWeLink',
                    textInputAction: TextInputAction.next,
                  ),
                  Gap(16.s),
                  AppPasswordField(
                    label: 'Mật khẩu eWeLink',
                    isRequired: true,
                    controller: _eWeLinkPasswordController,
                    hint: 'Nhập mật khẩu eWeLink',
                    textInputAction: TextInputAction.next,
                  ),
                  Gap(16.s),
                  AppTextField(
                    label: 'Phần trăm chiết khấu (%)',
                    controller: _percentController,
                    hint: 'Nhập phần trăm chiết khấu',
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  Gap(16.s),
                  AppDropdownField(
                    label: 'Loại tài khoản',
                    valueLabel: _typeLabel(state.type),
                    hint: 'Chọn loại tài khoản',
                    prefixIcon: Icon(
                      Icons.badge_outlined,
                      size: 20.s,
                      color: AppColors.textTertiary,
                    ),
                    onTap: _pickType,
                  ),
                  Gap(16.s),
                  AppDropdownField(
                    label: 'Ngân hàng',
                    valueLabel: state.selectedBank?.displayName,
                    hint: 'Chọn ngân hàng',
                    prefixIcon: Icon(
                      Icons.account_balance_outlined,
                      size: 20.s,
                      color: AppColors.textTertiary,
                    ),
                    onTap: _pickBank,
                  ),
                  Gap(16.s),
                  AppTextField(
                    label: 'Số tài khoản',
                    controller: _bankAccountNumberController,
                    hint: 'Nhập số tài khoản',
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  Gap(16.s),
                  AppTextField(
                    label: 'Tên chủ tài khoản',
                    controller: _bankAccountNameController,
                    hint: 'Nhập tên chủ tài khoản',
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _submit(),
                  ),
                  Gap(24.s),
                  AppButton(
                    label: 'Tạo tài khoản',
                    loading: state.isSubmitting,
                    onPressed: _submit,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
