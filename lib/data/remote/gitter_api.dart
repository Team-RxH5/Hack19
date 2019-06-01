import 'package:dio/dio.dart';
import 'package:Fluttery/data/model/gitter_message.dart';
import 'package:Fluttery/util/config.dart';

class GitterAPI {
  Dio _dio;

  static Options _options = new Options(
    headers: {
      "Authorization": "Bearer fb291e0bfda8024a2f0a5eb2f97bc615c8cdfab5"
    },
    // connectTimeout: 5000,
    // receiveTimeout: 3000,
  );

  static const String ROOM_ID = "576c4d75c2f0db084a1f99ae";

  static const String MESSAGE_ENDPOINT =
      GITTER_BASE_URL + "rooms/" + ROOM_ID + "/chatMessages?limit=50";

  Future<List<GitterMessage>> getMessages() {
    return _dio.get(MESSAGE_ENDPOINT, options: _options).then((Response res) {
      return (res.data as List).map((item) {
        return GitterMessage.fromJson(item);
      }).toList();
    }).catchError((err) {
      print(err.toString());
    });
  }

  // Singleton
  static final GitterAPI _gitterApi = GitterAPI._internal();

  factory GitterAPI() {
    return _gitterApi;
  }

  GitterAPI._internal() : _dio = Dio();
}
