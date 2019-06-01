import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fhack/data/model/message.dart';
import 'package:fhack/util/config.dart';

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

  Future<List<Message>> getMessages() {
    return _dio.get(MESSAGE_ENDPOINT, options: _options).then((Response res) {
      return (res.data as List).map((i) {
        return Message.fromJson(i);
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
