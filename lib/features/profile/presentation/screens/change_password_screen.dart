import 'package:auto_route/auto_route.dart';
import 'package:quanlymaygiat/features/profile/presentation/cubit/change_password_cubit.dart';
import 'package:quanlymaygiat/shared/design_system/design_system.dart';

@RoutePage()
class ChangePasswordScreen
    extends BasePage<ChangePasswordCubit, ChangePasswordState> {
  const ChangePasswordScreen({super.key});

  @override
  List<BlocProvider> get providers => [
    BlocProvider<ChangePasswordCubit>(
      create: (_) => getIt<ChangePasswordCubit>(),
    ),
  ];

  @override
  Widget buildContent(BuildContext context) {
    return AppScaffold(
      appBar: const BaseAppBar(title: 'Đổi mật khẩu'),
      body: BlocListener<ChangePasswordCubit, ChangePasswordState>(
        listenWhen: (p, c) => p.didSucceed != c.didSucceed,
        listener: (context, state) {
          if (state.didSucceed) {
            context.router.maybePop(true);
          }
        },
        child: const _ChangePasswordBody(),
      ),
    );
  }
}

class _ChangePasswordBody extends StatefulWidget {
  const _ChangePasswordBody();

  @override
  State<_ChangePasswordBody> createState() => _ChangePasswordBodyState();
}

class _ChangePasswordBodyState extends State<_ChangePasswordBody> {
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _submit() {
    context.read<ChangePasswordCubit>().submit(
      _passwordController.text,
      _confirmController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.s),
      child: Center(
        child: AppCard(
          padding: EdgeInsets.all(20.s),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 72.s,
                  height: 72.s,
                  decoration: const BoxDecoration(
                    color: AppColors.primarySoft,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.lock_outline_rounded,
                    size: 36.s,
                    color: AppColors.primary,
                  ),
                ),
              ),
              Gap(16.s),
              Text(
                'Nhập mật khẩu mới cho tài khoản của bạn. '
                'Mật khẩu cần tối thiểu 6 ký tự.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.s, color: AppColors.textSecondary),
              ),
              Gap(24.s),
              AppPasswordField(
                label: 'Mật khẩu mới',
                hint: 'Nhập mật khẩu mới',
                controller: _passwordController,
                isRequired: true,
                textInputAction: TextInputAction.next,
              ),
              Gap(16.s),
              AppPasswordField(
                label: 'Xác nhận mật khẩu',
                hint: 'Nhập lại mật khẩu mới',
                controller: _confirmController,
                isRequired: true,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _submit(),
              ),
              Gap(24.s),
              BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                builder: (context, state) {
                  return AppButton(
                    label: 'Cập nhật',
                    loading: state.isSubmitting,
                    onPressed: _submit,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
