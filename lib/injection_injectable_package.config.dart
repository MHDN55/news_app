// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i3;

import 'core/network/network_info.dart' as _i5;
import 'featutes/news/data/datasources/news_remote_data_sourse.dart' as _i6;
import 'featutes/news/data/repositories/news_repositories_impl.dart' as _i8;
import 'featutes/news/domain/repositories/news_repositories.dart' as _i7;
import 'featutes/news/domain/usecases/get_all_news.dart' as _i9;
import 'featutes/news/presentation/blocs/article/article_bloc.dart' as _i10;
import 'featutes/news/presentation/blocs/article_v2/article_v2_bloc.dart'
    as _i11;
import 'injection_injectable_package.dart' as _i12;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.InternetConnection>(
      () => registerModule.internetConnection);
  gh.lazySingleton<_i4.Client>(() => registerModule.client);
  gh.lazySingleton<_i5.NetworkInfo>(
      () => _i5.NetworkInfoImpl(gh<_i3.InternetConnection>()));
  gh.lazySingleton<_i6.NewsRemoteDataSource>(
      () => _i6.NewsRemoteDatasourceImpl(client: gh<_i4.Client>()));
  gh.lazySingleton<_i7.NewsRepository>(() => _i8.NewsRepositoriesImpl(
        remoteDataSource: gh<_i6.NewsRemoteDataSource>(),
        networkInfo: gh<_i5.NetworkInfo>(),
      ));
  gh.lazySingleton<_i9.GetAllNewsUsecase>(
      () => _i9.GetAllNewsUsecase(gh<_i7.NewsRepository>()));
  gh.lazySingleton<_i10.ArticleBloc>(
      () => _i10.ArticleBloc(getAllNews: gh<_i9.GetAllNewsUsecase>()));
  gh.lazySingleton<_i11.ArticleV2Bloc>(
      () => _i11.ArticleV2Bloc(getAllNews: gh<_i9.GetAllNewsUsecase>()));
  return getIt;
}

class _$RegisterModule extends _i12.RegisterModule {}
