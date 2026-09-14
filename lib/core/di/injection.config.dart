// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/data/auth_local_store.dart' as _i1023;
import '../../features/auth/data/auth_session_notifier.dart' as _i640;
import '../../features/auth/data/repositories/auth_repository.dart' as _i573;
import '../../features/auth/data/services/auth_api_service.dart' as _i698;
import '../../features/auth/di/auth_module.dart' as _i433;
import '../../features/auth/presentation/cubit/login_cubit.dart' as _i69;
import '../../features/devices/data/device_settings_store.dart' as _i53;
import '../../features/devices/data/di/devices_module.dart' as _i231;
import '../../features/devices/data/repositories/devices_repository.dart'
    as _i784;
import '../../features/devices/data/services/devices_api_service.dart' as _i636;
import '../../features/devices/domain/entities/device_entity.dart' as _i813;
import '../../features/devices/presentation/cubit/create_device_cubit.dart'
    as _i241;
import '../../features/devices/presentation/cubit/device_detail_cubit.dart'
    as _i633;
import '../../features/devices/presentation/cubit/home_cubit.dart' as _i524;
import '../../features/profile/presentation/cubit/change_password_cubit.dart'
    as _i365;
import '../../features/users/data/di/users_module.dart' as _i418;
import '../../features/users/data/repositories/users_repository.dart' as _i190;
import '../../features/users/data/services/users_api_service.dart' as _i948;
import '../../features/users/domain/entities/user_entity.dart' as _i853;
import '../../features/users/presentation/cubit/create_account_cubit.dart'
    as _i814;
import '../../features/users/presentation/cubit/user_detail_cubit.dart'
    as _i1064;
import '../../features/users/presentation/cubit/user_manage_cubit.dart'
    as _i864;
import '../config/app_config.dart' as _i650;
import '../logging/app_logger.dart' as _i354;
import '../network/dio_client.dart' as _i667;
import '../storage/storage_module.dart' as _i699;
import 'network_module.dart' as _i567;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final storageModule = _$StorageModule();
    final networkModule = _$NetworkModule();
    final authModule = _$AuthModule();
    final devicesModule = _$DevicesModule();
    final usersModule = _$UsersModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => storageModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i354.AppLogger>(() => _i354.AppLogger());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => storageModule.secureStorage,
    );
    gh.lazySingleton<_i640.AuthSessionNotifier>(
      () => _i640.AuthSessionNotifier(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i650.AppConfig>(() => _i650.DefaultAppConfig());
    gh.lazySingleton<_i1023.AuthLocalStore>(
      () => _i1023.AuthLocalStore(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i53.DeviceSettingsStore>(
      () => _i53.DeviceSettingsStore(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i667.DioClient>(
      () => _i667.DioClient(
        gh<_i650.AppConfig>(),
        gh<_i354.AppLogger>(),
        gh<_i1023.AuthLocalStore>(),
        gh<_i640.AuthSessionNotifier>(),
      ),
    );
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio(gh<_i667.DioClient>()));
    gh.lazySingleton<_i698.AuthApiService>(
      () => authModule.authApiService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i636.DevicesApiService>(
      () => devicesModule.devicesApiService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i948.UsersApiService>(
      () => usersModule.usersApiService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i573.AuthRepository>(
      () => _i573.AuthRepositoryImpl(
        gh<_i698.AuthApiService>(),
        gh<_i1023.AuthLocalStore>(),
      ),
    );
    gh.factory<_i69.LoginCubit>(
      () => _i69.LoginCubit(gh<_i573.AuthRepository>()),
    );
    gh.lazySingleton<_i190.UsersRepository>(
      () => _i190.UsersRepositoryImpl(gh<_i948.UsersApiService>()),
    );
    gh.factory<_i814.CreateAccountCubit>(
      () => _i814.CreateAccountCubit(gh<_i190.UsersRepository>()),
    );
    gh.factory<_i864.UserManageCubit>(
      () => _i864.UserManageCubit(gh<_i190.UsersRepository>()),
    );
    gh.lazySingleton<_i784.DevicesRepository>(
      () => _i784.DevicesRepositoryImpl(gh<_i636.DevicesApiService>()),
    );
    gh.factory<_i524.HomeCubit>(
      () => _i524.HomeCubit(
        gh<_i784.DevicesRepository>(),
        gh<_i1023.AuthLocalStore>(),
        gh<_i573.AuthRepository>(),
        gh<_i53.DeviceSettingsStore>(),
      ),
    );
    gh.factoryParam<_i1064.UserDetailCubit, _i853.UserEntity, dynamic>(
      (user, _) => _i1064.UserDetailCubit(gh<_i190.UsersRepository>(), user),
    );
    gh.factory<_i241.CreateDeviceCubit>(
      () => _i241.CreateDeviceCubit(
        gh<_i784.DevicesRepository>(),
        gh<_i190.UsersRepository>(),
      ),
    );
    gh.factoryParam<_i633.DeviceDetailCubit, _i813.DeviceEntity, dynamic>(
      (_device, _) => _i633.DeviceDetailCubit(
        gh<_i784.DevicesRepository>(),
        gh<_i190.UsersRepository>(),
        _device,
      ),
    );
    gh.factory<_i365.ChangePasswordCubit>(
      () => _i365.ChangePasswordCubit(
        gh<_i190.UsersRepository>(),
        gh<_i1023.AuthLocalStore>(),
      ),
    );
    return this;
  }
}

class _$StorageModule extends _i699.StorageModule {}

class _$NetworkModule extends _i567.NetworkModule {}

class _$AuthModule extends _i433.AuthModule {}

class _$DevicesModule extends _i231.DevicesModule {}

class _$UsersModule extends _i418.UsersModule {}
