import 'package:flutter/material.dart';
import 'package:fhack/data/remote/stackoverflow_api.dart';
import 'package:fhack/data/model/stack_question.dart';
import 'qa_list_tile.dart';

class QAScreen extends StatelessWidget {
  StackOverFlowAPI _api = StackOverFlowAPI();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FutureBuilder(
          future: _api.getQuestions(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Question>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Text('Loading...');
              default:
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data
                        .map(
                          (Question question) => StackOverFlowQuestionTile(
                                question: question,
                              ),
                        )
                        .toList(),
                  );
                } else {
                  return Text("Something went wrong!");
                }
            }
          },
        )
      ],
    );
  }
}
