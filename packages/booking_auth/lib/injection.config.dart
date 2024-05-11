// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import 'domain/auth/repositories/auth_repository.dart' as _i11;
import 'domain/core/network/network_info.dart' as _i8;
import 'infrastructure/auth/datasources/local/auth/i_login_local_datasource.dart'
    as _i7;
import 'infrastructure/auth/datasources/local/auth/login_local_datasources.dart'
    as _i6;
import 'infrastructure/auth/datasources/remote/api/login_api.dart' as _i10;
import 'infrastructure/auth/datasources/remote/di/register_api.dart' as _i14;
import 'infrastructure/auth/repositories/i_auth_repository.dart' as _i12;
import 'infrastructure/core/i_network_info.dart' as _i9;
import 'infrastructure/core/injection_module.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModules = _$InjectionModules();
    final registerApi = _$RegisterApi();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => injectionModules.sharedPreferences,
      preResolve: true,
    );
    gh.singleton<_i4.Dio>(() => registerApi.dio);
    gh.lazySingleton<_i5.InternetConnectionChecker>(
        () => injectionModules.internetConnectionChecker);
    gh.lazySingleton<_i6.LoginLocalDataSource>(
        () => _i7.ILoginLocalDataSource(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i8.NetworkInfo>(
        () => _i9.INetworkInfo(gh<_i5.InternetConnectionChecker>()));
    gh.lazySingleton<_i10.LoginApi>(
        () => registerApi.getloginApi(gh<_i4.Dio>()));
    gh.lazySingleton<_i11.AuthRepository>(() => _i12.IAuthRepository(
          gh<_i10.LoginApi>(),
          gh<_i8.NetworkInfo>(),
          gh<_i6.LoginLocalDataSource>(),
        ));
    return this;
  }
}

class _$InjectionModules extends _i13.InjectionModules {}

class _$RegisterApi extends _i14.RegisterApi {}
