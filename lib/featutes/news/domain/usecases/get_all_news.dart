import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_clean/core/error/failures.dart';
import 'package:news_clean/featutes/news/data/models/news_model.dart';
import 'package:news_clean/featutes/news/domain/repositories/news_repositories.dart';

@lazySingleton
class GetAllNewsUsecase {
  final NewsRepository repository;
  GetAllNewsUsecase(this.repository);
  Future<Either<Failure, NewsModel>> call() async {
    return await repository.getAllNews();
  }
}
