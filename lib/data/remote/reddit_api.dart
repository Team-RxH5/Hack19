import 'package:dio/dio.dart';
import 'package:Fluttery/data/model/gitter_message.dart';
import 'package:Fluttery/util/config.dart';

class RedditAPI {
  Dio _dio;

  static const String NEWS_ENDPOINT = REDDIT_BASE_URL;

  Future<List<GitterMessage>> getMessages() {
    return _dio.get(NEWS_ENDPOINT).then((Response res) {
      return (res.data as List).map((item) {
        return GitterMessage.fromJson(item);
      }).toList();
    }).catchError((err) {
      print(err.toString());
    });
  }

  // Singleton
  static final RedditAPI _gitterApi = RedditAPI._internal();

  factory RedditAPI() {
    return _gitterApi;
  }

  RedditAPI._internal() : _dio = Dio();
}
