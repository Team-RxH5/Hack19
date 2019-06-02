import 'dart:io';

import 'package:Fluttery/data/model/gitter_user.dart';
import 'package:dio/dio.dart';
import 'package:Fluttery/data/model/gitter_message.dart';
import 'package:Fluttery/util/config.dart';

class GitterAPI {
  final Dio _dio = Dio();

  static Options _options = new Options(
    headers: {
      "Authorization": "Bearer fb291e0bfda8024a2f0a5eb2f97bc615c8cdfab5"
    },
  );

  static const String ROOM_ID = "576c4d75c2f0db084a1f99ae";

  static const String TOKEN_ENDPOINT = GITTER_AUTH_URL + "token";
  static const String ME_ENDPOINT = GITTER_BASE_URL + "user/me";
  static const String MESSAGE_ENDPOINT =
      GITTER_BASE_URL + "rooms/" + ROOM_ID + "/chatMessages?limit=50";

  Future<dynamic> getToken(code) {
    print("Getting token for code: " + code);
    return _dio.post(TOKEN_ENDPOINT,
        data: {
          "client_id": GITTER_CLIENT_ID,
          "client_secret": GITTER_CLIENT_SECRET,
          "code": code,
          "redirect_uri": GITTER_REDIRECT_URL,
          "grant_type": "authorization_code"
        },
        options: Options(contentType: ContentType.json));
  }

  Future<List<GitterMessage>> getMessages() {
    return _dio.get(MESSAGE_ENDPOINT, options: _options).then((Response res) {
      return (res.data as List).map((item) {
        return GitterMessage.fromJson(item);
      }).toList();
    }).catchError((err) {
      print(err.toString());
    });
  }

  Future<GitterUser> getUser(String token) {
    return _dio
        .get(ME_ENDPOINT,
            options: Options(headers: {
              "Authorization": "Bearer " + token,
            }))
        .then((Response res) {
      return GitterUser.fromJson(res.data);
    }).catchError((err) {
      print(err.toString());
    });
  }
}
