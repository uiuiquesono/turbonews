import 'package:rx_notifier/rx_notifier.dart';

import '../../domain/respositories/news_repositore.dart';

class NewsController {
  final news = RxNotifier<List>([]);
  final isLoading = RxNotifier<bool>(false);
  final slug = RxNotifier<String>("");
  final creatorUsername = RxNotifier<String>("");
  final contentBody = RxNotifier<String>("");

  Future getNews() async {
    isLoading.value = true;
    final response = await NewsRepository.getNews();
    news.value = response;
    isLoading.value = false;
  }

  Future getNewsInfo() async {
    final response =
        await NewsRepository.getNewsInfo(creatorUsername.value, slug.value);
    contentBody.value = response.body!;
  }
}
