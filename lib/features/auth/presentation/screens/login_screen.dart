import 'package:auto_route/auto_route.dart';
import 'package:quanlymaygiat/app_router.dart';
import 'package:quanlymaygiat/features/auth/presentation/cubit/login_cubit.dart';
import 'package:quanlymaygiat/shared/design_system/design_system.dart';

@RoutePage()
class LoginScreen extends BasePage<LoginCubit, LoginState> {
  const LoginScreen({super.key});

  @override
  List<BlocProvider> get providers => [
    BlocProvider<LoginCubit>(create: (_) => getIt<LoginCubit>()),
  ];

  @override
  Widget buildContent(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (p, c) => p.isLoginSuccess != c.isLoginSuccess,
      listener: (context, state) {
        if (state.isLoginSuccess) {
          context.router.replaceAll([const HomeRoute()]);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: AppAuthBackground(
          child: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24.s, vertical: 24.s),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight - 48.s),
                    child: const _LoginBody(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginBody extends StatefulWidget {
  const _LoginBody();

  @override
  State<_LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<_LoginBody> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    context.read<LoginCubit>().login(
      _usernameController.text,
      _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildBranding(),
        Gap(32.s),
        _buildCard(),
        Gap(24.s),
        Text(
          '© Quản lý máy giặt',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 12.s),
        ),
      ],
    );
  }

  Widget _buildBranding() {
    return Column(
      children: [
        Container(
          width: 88.s,
          height: 88.s,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.18),
            borderRadius: BorderRadius.circular(24.s),
          ),
          child: Icon(Icons.local_laundry_service_rounded, size: 48.s, color: Colors.white),
        ),
        Gap(16.s),
        Text(
          'Quản lý máy giặt',
          style: TextStyle(fontSize: 26.s, fontWeight: FontWeight.w800, color: Colors.white),
        ),
        Gap(6.s),
        Text(
          'Đăng nhập để tiếp tục',
          style: TextStyle(fontSize: 14.s, color: Colors.white.withValues(alpha: 0.85)),
        ),
      ],
    );
  }

  Widget _buildCard() {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(22.s),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(24.s),
            boxShadow: const [
              BoxShadow(color: AppColors.shadowStrong, blurRadius: 30, offset: Offset(0, 12)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextField(
                label: 'Tài khoản',
                hint: 'Nhập tên đăng nhập',
                controller: _usernameController,
                prefixIcon: Icon(Icons.person_outline_rounded, size: 20.s, color: AppColors.textTertiary),
                textInputAction: TextInputAction.next,
              ),
              Gap(16.s),
              AppPasswordField(
                label: 'Mật khẩu',
                hint: 'Nhập mật khẩu',
                controller: _passwordController,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _submit(),
              ),
              Gap(24.s),
              AppButton(
                label: 'Đăng nhập',
                loading: state.isSubmitting,
                onPressed: _submit,
              ),
            ],
          ),
        );
      },
    );
  }
}
