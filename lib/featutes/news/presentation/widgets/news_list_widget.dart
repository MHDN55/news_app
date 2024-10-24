import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_clean/featutes/news/domain/entities/news.dart';
import 'package:news_clean/featutes/news/presentation/widgets/appbar_weather_widget.dart';

class NewsListWidget extends StatelessWidget {
  final News article;
  const NewsListWidget({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarWidget(article: article),
        Expanded(
          child: ListView.separated(
            itemCount: article.articles.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  // AppBarWidget(article: article),
                  Text(
                    "${article.articles[index].title} :",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: CachedNetworkImage(
                      imageUrl: article.articles[index].urlToImage,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 200,
                        width: 400,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Container(
                        alignment: Alignment.center,
                        height: 200,
                        width: 400,
                        child: const CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Text(
                          "SOMTHING WENT WRONG",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Description : ${article.articles[index].description}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => const Divider(thickness: 1),
          ),
        )
      ],
    );
  }
}
