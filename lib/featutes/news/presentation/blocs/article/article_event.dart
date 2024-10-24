part of 'article_bloc.dart';

class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class GetAllArticleEvent extends ArticleEvent {}

class RefreshArticleEvent extends ArticleEvent {}

//;oaewrjg;aoirjg;aojei
// abstract class ArticleEvent {}

// abstract class ArticleEven extends ArticleEvent
//     implements Built<ArticleEven, ArticleEvensBuilder> {
//   ArticleEven._();

//   factory ArticleEven([void Function(ArticleEvenBuilder b) updates]) = _$ArticleEven;
// }
