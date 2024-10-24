import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_clean/core/widgets/loading_widget.dart';
import 'package:news_clean/featutes/news/presentation/blocs/article_v2/article_v2_bloc.dart';
import 'package:news_clean/featutes/news/presentation/widgets/message_display_widget.dart';
import 'package:news_clean/featutes/news/presentation/widgets/news_list_widget.dart';
import 'package:news_clean/injection_injectable_package.dart';
// import 'package:news_clean/injection_container.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    getIt<ArticleV2Bloc>().add(const ArticleV2Event.getAllArticle());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<ArticleV2Bloc, ArticleV2State>(
      bloc: getIt<ArticleV2Bloc>()..add(const ArticleV2Event.getAllArticle()),
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          loading: () => const WelcomeLoadingWidget(),
          loaded: (news) => RefreshIndicator(
              color: Colors.black,
              onRefresh: () => _onRefresh(context),
              child: NewsListWidget(
                article: news,
              )),
          error: (message) => MessageDisplay(message: message),
        );
        // if (state is LoadingArticleState) {
        //   return const LoadingWidget();
        // } else if (state is LoadedArticleState) {
        //   return RefreshIndicator(
        //       onRefresh: () => _onRefresh(context),
        //       child: NewsListWidget(
        //         article: state.news,
        //       ));
        // } else if (state is ErrorArticleState) {
        //   return MessageDisplay(message: state.message);
        // }
        // return const LoadingWidget();
      },
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<ArticleV2Bloc>(context)
        .add(const ArticleV2Event.refreshArticle());
  }
}
