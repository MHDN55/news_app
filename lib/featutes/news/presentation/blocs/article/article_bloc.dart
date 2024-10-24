// ignore_for_file: type_literal_in_constant_pattern

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:news_clean/core/Strings/failures.dart';
import 'package:news_clean/core/error/failures.dart';
import 'package:news_clean/featutes/news/domain/entities/news.dart';

import 'package:news_clean/featutes/news/domain/usecases/get_all_news.dart';

part 'article_event.dart';
part 'article_state.dart';

@lazySingleton
class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetAllNewsUsecase getAllNews;
  ArticleBloc({
    required this.getAllNews,
  }) : super(ArticleInitial()) {
    on<ArticleEvent>((event, emit) async {
      if (event is GetAllArticleEvent) {
        emit(LoadingArticleState());

        final failureOrNews = await getAllNews();
        emit(_mapFailureOrPostsToState(failureOrNews));
      } else if (event is RefreshArticleEvent) {
        emit(LoadingArticleState());

        final failureOrNews = await getAllNews();
        emit(_mapFailureOrPostsToState(failureOrNews));
      }
    });
  }
  ArticleState _mapFailureOrPostsToState(Either<Failure, News> either) {
    return either.fold(
      (failure) => ErrorArticleState(message: _mapFailureToMessage(failure)),
      (article) => LoadedArticleState(news: article),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACH_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , please tey again later .";
    }
  }
}
