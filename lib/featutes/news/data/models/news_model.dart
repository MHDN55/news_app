import 'package:json_annotation/json_annotation.dart';
import 'package:news_clean/featutes/news/data/models/article_model.dart';
import 'package:news_clean/featutes/news/domain/entities/news.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel extends News {
  const NewsModel({
    required super.articles,
    required super.status,
    required super.totalResults,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
