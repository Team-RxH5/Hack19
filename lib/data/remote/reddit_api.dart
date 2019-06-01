import 'package:Fluttery/data/model/reddit_news.dart';
import 'package:dio/dio.dart';
import 'package:Fluttery/util/config.dart';

class RedditAPI {
  Dio _dio;

  static const String NEWS_ENDPOINT = REDDIT_BASE_URL;

  Future<List<RedditNews>> getMessages() {
    return _dio.get(NEWS_ENDPOINT).then((Response res) {
      return (res.data["data"]["children"] as List).map((item) {
        return RedditNews.fromJson(item);
      }).toList();
    }).catchError((err) {
      print(err.toString());
    });
  }

  // Singleton
  static final RedditAPI _reddit_api = RedditAPI._internal();

  factory RedditAPI() {
    return _reddit_api;
  }

  RedditAPI._internal() : _dio = Dio();
}
