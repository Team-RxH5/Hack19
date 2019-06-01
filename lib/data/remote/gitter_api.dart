import 'package:dio/dio.dart';
import 'package:fhack/data/model/message.dart';
import 'package:fhack/util/config.dart';

class GitterAPI {
  Dio _dio;

  static BaseOptions options = new BaseOptions(
    baseUrl: GITTER_BASE_URL,
    // connectTimeout: 5000,
    // receiveTimeout: 3000,
  );

  static const String ROOM_ID = "576c4d75c2f0db084a1f99ae";

  static const String MESSAGE_ENDPOINT =
      "rooms/" + ROOM_ID + "/chatMessages?limit=50";

  Future<String> getMessages() {
    return _dio.get(MESSAGE_ENDPOINT).then((Response res) {
      return res.data.toString();
    });
  }

  // Singleton
  static final GitterAPI _gitterApi = GitterAPI._internal();

  factory GitterAPI() {
    return _gitterApi;
  }

  GitterAPI._internal() : _dio = Dio(options);
}
