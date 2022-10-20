import 'package:rx_notifier/rx_notifier.dart';

import '../../domain/respositories/news_repositore.dart';

class NewsController {
  final news = RxNotifier<List>([]);

  void teste() async {
    final response = await NewsRepository.getVideoInfo();
    news.value = response;
  }
}
