import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:quanlymaygiat/features/devices/domain/entities/device_entity.dart';
import 'package:quanlymaygiat/features/users/domain/entities/user_entity.dart';
import 'package:quanlymaygiat/features/auth/presentation/screens/login_screen.dart';
import 'package:quanlymaygiat/features/auth/presentation/screens/splash_screen.dart';
import 'package:quanlymaygiat/features/devices/presentation/screens/create_device_screen.dart';
import 'package:quanlymaygiat/features/devices/presentation/screens/device_detail_screen.dart';
import 'package:quanlymaygiat/features/devices/presentation/screens/home_screen.dart';
import 'package:quanlymaygiat/features/profile/presentation/screens/change_password_screen.dart';
import 'package:quanlymaygiat/features/reports/presentation/screens/report_screen.dart';
import 'package:quanlymaygiat/features/users/presentation/screens/create_account_screen.dart';
import 'package:quanlymaygiat/features/users/presentation/screens/user_detail_screen.dart';
import 'package:quanlymaygiat/features/users/presentation/screens/user_manage_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: DeviceDetailRoute.page),
    AutoRoute(page: CreateDeviceRoute.page),
    AutoRoute(page: UserManageRoute.page),
    AutoRoute(page: UserDetailRoute.page),
    AutoRoute(page: CreateAccountRoute.page),
    AutoRoute(page: ReportRoute.page),
    AutoRoute(page: ChangePasswordRoute.page),
  ];
}
