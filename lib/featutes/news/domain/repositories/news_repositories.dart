import 'package:news_clean/core/error/failures.dart';
import 'package:news_clean/featutes/news/data/models/news_model.dart';
import 'package:dartz/dartz.dart';

abstract class NewsRepository{
  Future<Either<Failure,NewsModel>>getAllNews();
}