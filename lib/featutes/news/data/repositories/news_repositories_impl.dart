// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_clean/core/error/exceptions.dart';

import 'package:news_clean/core/error/failures.dart';
import 'package:news_clean/core/network/network_info.dart';
import 'package:news_clean/featutes/news/data/models/news_model.dart';
import 'package:news_clean/featutes/news/domain/repositories/news_repositories.dart';

import '../datasources/news_remote_data_sourse.dart';
@LazySingleton(as: NewsRepository)
class NewsRepositoriesImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  NewsRepositoriesImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, NewsModel>> getAllNews() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteNews = await remoteDataSource.getAllNews();
        return Right(remoteNews );
      } on ServerException {
        Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }
}
