// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:news_clean/core/error/exceptions.dart';
import 'package:news_clean/featutes/news/data/models/news_model.dart';

abstract class NewsRemoteDataSource {
  Future<NewsModel> getAllNews();
}

// ignore: constant_identifier_names
const API_KEY = "300d41af9e2b4232a6eda2772cbc076a";
const baseUrl =
    "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=$API_KEY";

@LazySingleton(as: NewsRemoteDataSource)
class NewsRemoteDatasourceImpl implements NewsRemoteDataSource {
  final http.Client client;
  NewsRemoteDatasourceImpl({required this.client});

  @override
  Future<NewsModel> getAllNews() async {
    final response = await client.get(
      Uri.parse(baseUrl),
    );
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      final NewsModel newsModel = NewsModel.fromJson(decodedJson);
      return newsModel;
    } else {
      throw ServerException();
    }
  }
}
