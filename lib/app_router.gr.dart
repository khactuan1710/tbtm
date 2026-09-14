// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ChangePasswordScreen]
class ChangePasswordRoute extends PageRouteInfo<void> {
  const ChangePasswordRoute({List<PageRouteInfo>? children})
    : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const ChangePasswordScreen());
    },
  );
}

/// generated route for
/// [CreateAccountScreen]
class CreateAccountRoute extends PageRouteInfo<void> {
  const CreateAccountRoute({List<PageRouteInfo>? children})
    : super(CreateAccountRoute.name, initialChildren: children);

  static const String name = 'CreateAccountRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const CreateAccountScreen());
    },
  );
}

/// generated route for
/// [CreateDeviceScreen]
class CreateDeviceRoute extends PageRouteInfo<void> {
  const CreateDeviceRoute({List<PageRouteInfo>? children})
    : super(CreateDeviceRoute.name, initialChildren: children);

  static const String name = 'CreateDeviceRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const CreateDeviceScreen());
    },
  );
}

/// generated route for
/// [DeviceDetailScreen]
class DeviceDetailRoute extends PageRouteInfo<DeviceDetailRouteArgs> {
  DeviceDetailRoute({
    Key? key,
    required DeviceEntity device,
    List<PageRouteInfo>? children,
  }) : super(
         DeviceDetailRoute.name,
         args: DeviceDetailRouteArgs(key: key, device: device),
         initialChildren: children,
       );

  static const String name = 'DeviceDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DeviceDetailRouteArgs>();
      return WrappedRoute(
        child: DeviceDetailScreen(key: args.key, device: args.device),
      );
    },
  );
}

class DeviceDetailRouteArgs {
  const DeviceDetailRouteArgs({this.key, required this.device});

  final Key? key;

  final DeviceEntity device;

  @override
  String toString() {
    return 'DeviceDetailRouteArgs{key: $key, device: $device}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DeviceDetailRouteArgs) return false;
    return key == other.key && device == other.device;
  }

  @override
  int get hashCode => key.hashCode ^ device.hashCode;
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const HomeScreen());
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const LoginScreen());
    },
  );
}

/// generated route for
/// [ReportScreen]
class ReportRoute extends PageRouteInfo<ReportRouteArgs> {
  ReportRoute({
    Key? key,
    required String url,
    required String title,
    required String token,
    List<PageRouteInfo>? children,
  }) : super(
         ReportRoute.name,
         args: ReportRouteArgs(key: key, url: url, title: title, token: token),
         initialChildren: children,
       );

  static const String name = 'ReportRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReportRouteArgs>();
      return ReportScreen(
        key: args.key,
        url: args.url,
        title: args.title,
        token: args.token,
      );
    },
  );
}

class ReportRouteArgs {
  const ReportRouteArgs({
    this.key,
    required this.url,
    required this.title,
    required this.token,
  });

  final Key? key;

  final String url;

  final String title;

  final String token;

  @override
  String toString() {
    return 'ReportRouteArgs{key: $key, url: $url, title: $title, token: $token}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReportRouteArgs) return false;
    return key == other.key &&
        url == other.url &&
        title == other.title &&
        token == other.token;
  }

  @override
  int get hashCode =>
      key.hashCode ^ url.hashCode ^ title.hashCode ^ token.hashCode;
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [UserDetailScreen]
class UserDetailRoute extends PageRouteInfo<UserDetailRouteArgs> {
  UserDetailRoute({
    Key? key,
    required UserEntity user,
    List<PageRouteInfo>? children,
  }) : super(
         UserDetailRoute.name,
         args: UserDetailRouteArgs(key: key, user: user),
         initialChildren: children,
       );

  static const String name = 'UserDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UserDetailRouteArgs>();
      return WrappedRoute(
        child: UserDetailScreen(key: args.key, user: args.user),
      );
    },
  );
}

class UserDetailRouteArgs {
  const UserDetailRouteArgs({this.key, required this.user});

  final Key? key;

  final UserEntity user;

  @override
  String toString() {
    return 'UserDetailRouteArgs{key: $key, user: $user}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UserDetailRouteArgs) return false;
    return key == other.key && user == other.user;
  }

  @override
  int get hashCode => key.hashCode ^ user.hashCode;
}

/// generated route for
/// [UserManageScreen]
class UserManageRoute extends PageRouteInfo<void> {
  const UserManageRoute({List<PageRouteInfo>? children})
    : super(UserManageRoute.name, initialChildren: children);

  static const String name = 'UserManageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const UserManageScreen());
    },
  );
}
