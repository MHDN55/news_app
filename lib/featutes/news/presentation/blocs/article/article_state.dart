part of 'article_bloc.dart';

class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];

  get news => null;
}

final class ArticleInitial extends ArticleState {}

final class LoadingArticleState extends ArticleState {}

final class LoadedArticleState extends ArticleState {
  @override
  final News news;

  const LoadedArticleState({required this.news});
  @override
  List<Object> get props => [news];
}

final class ErrorArticleState extends ArticleState {
  final String message;

  const ErrorArticleState({required this.message});
  @override
  List<Object> get props => [message];
}
// alieruglaieurghilaeurgliaeug
// abstract class ArticleState implements Built<ArticleState, ArticleStateBuilder> {
//   bool get isLoading;

//   bool get error;

//   String get errorMessage;

//   News get posts;

//   ArticleState._();

//   factory ArticleState([void Function(ArticleStateBuilder b) updates]) = _$ArticleState;

//   factory ArticleState.initial() => ArticleState(
//         (b) => b
//           ..isLoading = false
//           ..error = false
//           ..errorMessage = ''
//           ..posts = ''
//       );
// }
