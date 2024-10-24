part of 'article_v2_bloc.dart';

@freezed
class ArticleV2Event with _$ArticleV2Event {
  const factory ArticleV2Event.getAllArticle() = _GetAllarticle;
  const factory ArticleV2Event.refreshArticle() = _RefreshArticle;
}
