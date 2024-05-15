// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import 'application/login/auth_bloc.dart' as _i14;
import 'domain/auth/repositories/auth_repository.dart' as _i12;
import 'domain/core/network/network_info.dart' as _i9;
import 'infrastructure/auth/datasources/local/auth/i_login_local_datasource.dart'
    as _i8;
import 'infrastructure/auth/datasources/local/auth/login_local_datasources.dart'
    as _i7;
import 'infrastructure/auth/datasources/remote/api/login_api.dart' as _i6;
import 'infrastructure/auth/datasources/remote/di/register_api.dart' as _i16;
import 'infrastructure/auth/datasources/remote/i_auth_remote_datasources.dart'
    as _i11;
import 'infrastructure/auth/repositories/i_auth_repository.dart' as _i13;
import 'infrastructure/core/i_network_info.dart' as _i10;
import 'infrastructure/core/injection_module.dart' as _i15;

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
    gh.lazySingleton<_i4.InternetConnectionChecker>(
        () => injectionModules.internetConnectionChecker);
    gh.lazySingleton<_i5.FirebaseAuth>(() => injectionModules.firebaseAuth);
    gh.lazySingleton<_i6.LoginApi>(() => registerApi.getloginApi());
    gh.lazySingleton<_i7.LoginLocalDataSource>(
        () => _i8.ILoginLocalDataSource(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i9.NetworkInfo>(
        () => _i10.INetworkInfo(gh<_i4.InternetConnectionChecker>()));
    gh.factory<_i11.IAuthRemoteDataSources>(() =>
        _i11.IAuthRemoteDataSources(firebaseAuth: gh<_i5.FirebaseAuth>()));
    gh.lazySingleton<_i12.AuthRepository>(() => _i13.IAuthRepository(
          gh<_i6.LoginApi>(),
          gh<_i9.NetworkInfo>(),
          gh<_i7.LoginLocalDataSource>(),
          gh<_i11.IAuthRemoteDataSources>(),
        ));
    gh.factory<_i14.AuthBloc>(() => _i14.AuthBloc(gh<_i12.AuthRepository>()));
    return this;
  }
}

class _$InjectionModules extends _i15.InjectionModules {}

class _$RegisterApi extends _i16.RegisterApi {}
