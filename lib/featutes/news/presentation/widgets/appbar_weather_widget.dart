// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:news_clean/featutes/news/domain/entities/news.dart';

class AppBarWidget extends StatelessWidget {
  final News article;
  const AppBarWidget({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        article.articles[0].author,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 33,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
    );
  }
}
