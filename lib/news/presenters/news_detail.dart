import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:turbonews/news/presenters/state/news_controller.dart';
import 'package:markdown_widget/config/highlight_themes.dart' as theme;

class NewsDetailSreen extends StatefulWidget {
  const NewsDetailSreen({super.key});

  @override
  State<NewsDetailSreen> createState() => _NewsDetailSreenState();
}

class _NewsDetailSreenState extends State<NewsDetailSreen> {
  final controller = GetIt.I.get<NewsController>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return RxBuilder(
        builder: ((context) => WillPopScope(
              onWillPop: () async {
                controller.contentBody.value = "";
                return true;
              },
              child: Scaffold(
                backgroundColor: Colors.grey.shade900,
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MarkdownWidget(
                    selectable: true,
                    data: controller.contentBody.value,
                    styleConfig: StyleConfig(
                        preConfig: PreConfig(theme: theme.githubGistTheme),
                        markdownTheme: MarkdownTheme.darkTheme),
                  ),
                ),
              ),
            )));
  }
}
