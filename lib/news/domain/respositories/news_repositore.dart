import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/news_info_model.dart';
import '../model/news_model.dart';

class NewsRepository {
  static String baseURL = "https://www.tabnews.com.br/api/v1/";
  static Future<List<TurboNewsModel>> getNews() async {
    final response = await http.get(
      Uri.parse('${baseURL}contents?page=1&per_page=20'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<TurboNewsModel> news = [];
      for (var n in jsonData) {
        TurboNewsModel test = TurboNewsModel.fromJson(n);
        news.add(test);
      }
      return news;
    } else {
      throw Exception('Failed to create album.');
    }
  }

  static Future<InfoNewsModel> getNewsInfo(String user, String slug) async {
    final response = await http.get(
      Uri.parse('${baseURL}contents/$user/$slug'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      var jsonData = InfoNewsModel.fromJson(jsonDecode(response.body));
      return jsonData;
    } else {
      throw Exception('Failed to create album.');
    }
  }
}
