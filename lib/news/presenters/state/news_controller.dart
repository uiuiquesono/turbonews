import 'package:rx_notifier/rx_notifier.dart';

import '../../domain/respositories/news_repositore.dart';

class NewsController {
  final news = RxNotifier<List>([]);
  final isLoading = RxNotifier<bool>(false);

  Future teste() async {
    isLoading.value = true;
    final response = await NewsRepository.getVideoInfo();
    news.value = response;
    isLoading.value = false;
  }
}
