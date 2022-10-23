import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:turbonews/news/presenters/state/news_controller.dart';

class NewsDetailSreen extends StatefulWidget {
  const NewsDetailSreen({super.key});

  @override
  State<NewsDetailSreen> createState() => _NewsDetailSreenState();
}

class _NewsDetailSreenState extends State<NewsDetailSreen> {
  final controller = GetIt.I.get<NewsController>();
  @override
  Widget build(BuildContext context) {
    return RxBuilder(
        builder: ((context) => Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: SingleChildScrollView(
                  child: Html(
                    data: controller.contentBody.value,
                  ),
                ),
              ),
            )));
  }
}
