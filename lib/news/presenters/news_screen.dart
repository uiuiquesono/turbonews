import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:turbonews/news/presenters/state/news_controller.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final controller = GetIt.I.get<NewsController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return RxBuilder(
        builder: (((context) => Scaffold(
              backgroundColor: Colors.grey.shade800,
              body: SingleChildScrollView(
                child: GestureDetector(
                  onTap: () {
                    controller.teste();
                  },
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          color: Colors.green,
                        ),
                        SizedBox(
                          height: height * 1,
                          width: width,
                          child: ListView.builder(
                              itemCount: controller.news.value.length,
                              itemBuilder: (BuildContext context, int index) {
                                final list = controller.news.value[index];
                                return Text(
                                    "List ${list.title}");
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ))));
  }
}
