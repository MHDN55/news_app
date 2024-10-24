// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:news_clean/featutes/news/data/models/article_model.dart';

class News extends Equatable {
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;

  const News({
    required this.status,
    required this.totalResults,
    required this.articles,
  });
  
  @override

  List<Object?> get props => [articles,status,totalResults];
}
