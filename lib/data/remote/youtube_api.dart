import 'package:dio/dio.dart';
import 'package:Fluttery/data/model/youtube_video.dart';
import 'package:Fluttery/util/config.dart';

class YoutubeAPI {
  Dio _dio;

  static const String CHANNEL_ID = "UCwXdFgeE9KYzlDdR7TG9cMw";

  static const String VIDEO_ENDPOINT = YOUTUBE_BASE_URL +
      "search?part=snippet&channelId=" +
      CHANNEL_ID +
      "&maxResults=25&key=AIzaSyC74XlyMXGlwBJLLUPwHFcCAlgvB0nIXSA";

  Future<List<YoutubeVideo>> getVideos() {
    return _dio.get(VIDEO_ENDPOINT).then((Response res) {
      return (res.data["items"] as List).map((item) {
        return YoutubeVideo.fromJson(item);
      }).toList();
    }).catchError((err) {
      print(err.toString());
    });
  }

  // Singleton
  static final YoutubeAPI _youtubeApi = YoutubeAPI._internal();

  factory YoutubeAPI() {
    return _youtubeApi;
  }

  YoutubeAPI._internal() : _dio = Dio();
}
