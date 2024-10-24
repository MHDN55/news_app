// ignore_for_file: public_member_api_docs, sort_constructors_first, type_literal_in_constant_pattern
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_clean/core/Strings/failures.dart';
import 'package:news_clean/core/error/failures.dart';

import 'package:news_clean/featutes/news/domain/entities/news.dart';
import 'package:news_clean/featutes/news/domain/usecases/get_all_news.dart';

part 'article_v2_bloc.freezed.dart';
part 'article_v2_event.dart';
part 'article_v2_state.dart';

@lazySingleton
class ArticleV2Bloc extends Bloc<ArticleV2Event, ArticleV2State> {
  final GetAllNewsUsecase getAllNews;
  ArticleV2Bloc({
    required this.getAllNews,
  }) : super(const ArticleV2State.initial()) {
    on<ArticleV2Event>((event, emit) async {
      await event.when(
        getAllArticle: () async {
          emit(const ArticleV2State.loading());

          final failureOrNews = await getAllNews();
          emit(_mapFailureOrPostsToState(failureOrNews));
        },
        refreshArticle: () async {
          emit(const ArticleV2State.loading());

          final failureOrNews = await getAllNews();
          emit(_mapFailureOrPostsToState(failureOrNews));
        },
      );
    });
  }

  ArticleV2State _mapFailureOrPostsToState(Either<Failure, News> either) {
    return either.fold(
      (failure) => ArticleV2State.error(_mapFailureToMessage(failure)),
      (article) => ArticleV2State.loaded(article),
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
