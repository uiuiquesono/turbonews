import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../state/news_controller.dart';

class ListNews extends StatelessWidget {
  final controller = GetIt.I.get<NewsController>();

  ListNews({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ListView.builder(
        itemCount: controller.news.value.length,
        itemBuilder: (BuildContext context, int index) {
          final list = controller.news.value[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                controller.slug.value = list.slug;
                controller.creatorUsername.value = list.ownerUsername;
                controller.getNewsInfo();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: const BorderRadius.all(Radius.circular(3)),
                ),
                height: 50,
                width: width,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      list.title,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
