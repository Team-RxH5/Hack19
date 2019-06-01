import 'package:fhack/data/model/stack_question.dart';
import 'package:flutter/material.dart';
import 'qa_web_view.dart';

class StackOverFlowQuestionTile extends StatelessWidget {
  final Question question;

  StackOverFlowQuestionTile({@required this.question});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        child: Card(
          margin: EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  question.title,
                  style: TextStyle(fontSize: 17, color: Colors.blue),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      question.time.toIso8601String(),
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      " . ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      question.owner['display_name'],
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(left: 20, right: 20),
              ),
              Row(
                children: question.tags
                    .map((tag) => Container(
                          margin: EdgeInsets.all(2),
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color(0xffcee0ed),
                          ),
                          child: Text(
                            tag,
                            style: TextStyle(
                              color: Color(0xff33658a),
                            ),
                          ),
                        ))
                    .toList(),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'votes : ${question.score}',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    Text(
                      'answers : ${question.answerCount}',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    Text(
                      'views : ${question.viewCount}',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => QAWebViewScreen(
                    question: question,
                  ))),
    );
  }
}
