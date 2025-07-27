// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../api/data_sources/photo_offline_data_source_impl.dart' as _i904;
import '../../api/data_sources/photo_online_source_impl.dart' as _i899;
import '../../api/web_services/network_module.dart' as _i166;
import '../../api/web_services/pexels_api_service.dart' as _i379;
import '../../data/datasources/photo_offline_data_source.dart' as _i707;
import '../../data/datasources/photo_online_source.dart' as _i136;
import '../../domain/repository/Photo_epository.dart' as _i407;
import '../../domain/repository/Photo_epository_impl.dart' as _i856;
import '../../ui/cubit/photo_view_model.dart' as _i754;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.singleton<_i361.BaseOptions>(() => networkModule.provideBaseOptions());
    gh.singleton<_i528.PrettyDioLogger>(
        () => networkModule.providePrettyDioLogger());
    gh.lazySingleton<_i707.PhotoOfflineDataSource>(
        () => _i904.PhotoOfflineDataSourceImpl());
    gh.singleton<_i361.Dio>(() => networkModule.provideDio(
          gh<_i361.BaseOptions>(),
          gh<_i528.PrettyDioLogger>(),
        ));
    gh.singleton<_i379.PexelsApiService>(
        () => networkModule.providePexelsApiService(gh<_i361.Dio>()));
    gh.factory<_i136.PhotoOnlineDataSource>(
        () => _i899.PhotoOnlineDataSourceImpl(gh<_i379.PexelsApiService>()));
    gh.factory<_i407.PhotoRepository>(() => _i856.PhotoRepositoryImpl(
          onlineDataSource: gh<_i136.PhotoOnlineDataSource>(),
          offlineDataSource: gh<_i707.PhotoOfflineDataSource>(),
        ));
    gh.factory<_i754.PhotoViewModel>(() =>
        _i754.PhotoViewModel(photoRepository: gh<_i407.PhotoRepository>()));
    return this;
  }
}

class _$NetworkModule extends _i166.NetworkModule {}
