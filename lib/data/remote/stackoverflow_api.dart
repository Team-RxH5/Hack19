import 'dart:io';

import 'package:dio/dio.dart';
import 'package:Fluttery/data/model/stack_question.dart';
import 'package:Fluttery/util/config.dart';

class StackOverFlowAPI {
  Dio _dio;

  static const String QUESTION_ENDPOINT = STACKOVERFLOW_QUESTION_URL;

  Future<List<Question>> getQuestions() {
    return _dio.get(QUESTION_ENDPOINT).then((Response res) {
      return (res.data["items"] as List).map((i) {
        return Question.fromJson(i);
      }).toList();
    }).catchError((err) {
      print(err.toString());
    });
  }

  // Singleton
  static final StackOverFlowAPI _stackOverFlowApi =
      StackOverFlowAPI._internal();

  factory StackOverFlowAPI() {
    return _stackOverFlowApi;
  }

  StackOverFlowAPI._internal() : _dio = Dio();
}
