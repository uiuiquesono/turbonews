import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:turbonews/news/presenters/state/news_controller.dart';

import 'components/list_news.dart';
import 'components/shimmer_news.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final controller = GetIt.I.get<NewsController>();
  @override
  void initState() {
    controller.getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return RxBuilder(
        builder: (((context) => Scaffold(
              backgroundColor: Colors.grey.shade900,
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 1,
                        width: width,
                        child: RefreshIndicator(
                            backgroundColor: Colors.grey.shade700,
                            onRefresh: () async {
                              controller.isLoading.value = true;
                              await controller.getNews();
                              controller.isLoading.value = false;
                            },
                            child: Container(
                                child: !controller.isLoading.value
                                    ? ListNews()
                                    : const ShimmerNews())),
                      ),
                    ],
                  ),
                ),
              ),
            ))));
  }
}
