import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/news_model.dart';

class NewsRepository {
  static Future<List<TurboNewsModel>> getVideoInfo() async {
    final response = await http.get(
      Uri.parse(
          'https://www.tabnews.com.br/api/v1/contents?page=1&per_page=10'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("jsonData: ${jsonDecode(response.body)}");
      List<TurboNewsModel> news = [];
      for (var n in jsonData) {
        TurboNewsModel test = TurboNewsModel.fromJson(n);
        print("result: ${test.title}");
        news.add(test);
      }
      
      return news;
    } else {
      throw Exception('Failed to create album.');
    }
  }
}
