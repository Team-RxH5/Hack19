import 'package:flutter/material.dart';
import 'package:fhack/data/remote/stackoverflow_api.dart';
import 'package:fhack/data/model/stack_question.dart';

class QAScreen extends StatelessWidget {
  StackOverFlowAPI _api = StackOverFlowAPI();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Text("QnA"),
        FutureBuilder(
          future: _api.getQuestions(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Question>> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: snapshot.data
                    .map((Question question) => ListTile(
                          title: Text(question.title),
                        ))
                    .toList(),
              );
            } else {
              return Text("Crap");
            }
          },
        )
      ],
    );
  }
}
