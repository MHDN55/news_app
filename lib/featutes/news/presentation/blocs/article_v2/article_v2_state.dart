part of 'article_v2_bloc.dart';

@freezed
class ArticleV2State with _$ArticleV2State {
  const factory ArticleV2State.initial() = _Initial;
  const factory ArticleV2State.loading() = _Loading;
  const factory ArticleV2State.loaded(News news) = _Loaded;
  const factory ArticleV2State.error(String message) = _Error;
}
