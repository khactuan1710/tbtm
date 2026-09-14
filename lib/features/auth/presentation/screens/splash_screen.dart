import 'package:auto_route/auto_route.dart';
import 'package:quanlymaygiat/app_router.dart';
import 'package:quanlymaygiat/features/auth/data/auth_local_store.dart';
import 'package:quanlymaygiat/shared/design_system/design_system.dart';

/// Decides the entry route based on the restored session, showing a brief
/// branded splash. Session restore runs in `main` before `runApp`, so the store
/// is populated by the time this builds.
@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _decideRoute());
  }

  Future<void> _decideRoute() async {
    await Future<void>.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;
    final loggedIn = getIt<AuthLocalStore>().isLoggedIn;
    context.router.replaceAll([loggedIn ? const HomeRoute() : const LoginRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppAuthBackground(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100.s,
                height: 100.s,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(28.s),
                ),
                child: Icon(Icons.local_laundry_service_rounded, size: 56.s, color: Colors.white),
              ),
              Gap(20.s),
              Text(
                'Quản lý máy giặt',
                style: TextStyle(fontSize: 24.s, fontWeight: FontWeight.w800, color: Colors.white),
              ),
              Gap(24.s),
              SizedBox(
                width: 26.s,
                height: 26.s,
                child: const CircularProgressIndicator(
                  strokeWidth: 2.6,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
