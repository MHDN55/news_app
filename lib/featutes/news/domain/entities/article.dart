import 'package:equatable/equatable.dart';

class Article extends Equatable{
  final String title;
  final String description;
  final String urlToImage;
  final String content;
  final String author;
  const Article({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.content,
    required this.author,
  });
  
  @override

  List<Object?> get props => [title,description,urlToImage,content,author];
}
