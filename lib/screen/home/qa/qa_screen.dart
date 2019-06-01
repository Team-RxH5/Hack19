import 'package:Fluttery/screen/common/header.dart';
import 'package:Fluttery/screen/common/loader.dart';
import 'package:flutter/material.dart';
import 'package:Fluttery/data/remote/stackoverflow_api.dart';
import 'package:Fluttery/data/model/stack_question.dart';
import 'qa_list_tile.dart';

class QAScreen extends StatelessWidget {
  StackOverFlowAPI _api = StackOverFlowAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[Header("Q&A")];
        },
        body: ListView(
          children: <Widget>[
            FutureBuilder(
              future: _api.getQuestions(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Question>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Loader(true);
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
        ),
      ),
    );
  }
}
