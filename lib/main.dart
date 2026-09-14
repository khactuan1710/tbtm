import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quanlymaygiat/app_router.dart';
import 'package:quanlymaygiat/core/di/injection.dart';
import 'package:quanlymaygiat/features/auth/data/auth_local_store.dart';
import 'package:quanlymaygiat/shared/session/app_session_lifecycle.dart';
import 'package:quanlymaygiat/shared/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  await getIt<AuthLocalStore>().restore();
  runApp(const MayGiatApp());
}

class MayGiatApp extends StatefulWidget {
  const MayGiatApp({super.key});

  @override
  State<MayGiatApp> createState() => _MayGiatAppState();
}

class _MayGiatAppState extends State<MayGiatApp> {
  final AppRouter _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return AppSessionLifecycle(
      router: _router,
      child: MaterialApp.router(
        title: 'Quản lý máy giặt',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        themeMode: ThemeMode.light,
        routerConfig: _router.config(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('vi'), Locale('en')],
        builder: (context, child) {
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
            ),
          );
          return child ?? const SizedBox.shrink();
        },
      ),
    );
  }
}
