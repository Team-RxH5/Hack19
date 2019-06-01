import 'package:Fluttery/data/model/stack_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class QAWebViewScreen extends StatelessWidget {
  final Question question;

  QAWebViewScreen({@required this.question});

  @override
  Widget build(BuildContext context) {
    print(question.link);
    return WebviewScaffold(
      url: question.link,
      appBar: AppBar(
        title: Text("Question"),
      ),
    );
  }
}
