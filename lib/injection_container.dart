import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:news_clean/featutes/news/data/datasources/news_remote_data_sourse.dart';
import 'package:news_clean/featutes/news/data/repositories/news_repositories_impl.dart';
import 'package:news_clean/featutes/news/domain/repositories/news_repositories.dart';
import 'package:news_clean/featutes/news/domain/usecases/get_all_news.dart';
import 'package:news_clean/featutes/news/presentation/blocs/article_v2/article_v2_bloc.dart';

import 'core/network/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts :

  // bloc

  sl.registerFactory(() => ArticleV2Bloc(getAllNews: sl()));

  // usecases

  sl.registerLazySingleton(() => GetAllNewsUsecase(sl()));

  // Repository

  sl.registerLazySingleton<NewsRepository>(
    () => NewsRepositoriesImpl(remoteDataSource: sl(), networkInfo: sl()),
  );

  // datasources

  sl.registerLazySingleton<NewsRemoteDataSource>(
      () => NewsRemoteDatasourceImpl(client: sl()));

//? Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//? External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnection());
}
