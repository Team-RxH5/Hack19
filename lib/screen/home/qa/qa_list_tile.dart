import 'package:Fluttery/data/model/stack_question.dart';
import 'package:flutter/material.dart';
import 'qa_web_view.dart';

class StackOverFlowQuestionTile extends StatelessWidget {
  final Question question;

  StackOverFlowQuestionTile({@required this.question});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 20),
        width: double.infinity,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      question.title,
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .apply(color: Colors.blue),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          '${question.time.year}-${question.time.month}-${question.time.day} ${question.time.hour}:${question.time.minute}:${question.time.second}',
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
                    margin: EdgeInsets.only(
                        left: 20, right: 20, bottom: 20, top: 7),
                  ),
                  Row(
                    children: question.tags
                        .map((tag) => Container(
                              margin: EdgeInsets.all(2),
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
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
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.thumb_up,
                              color: Colors.blue,
                            ),
                            Text(
                              ' . ${question.score}',
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.done_all,
                              color: Colors.green,
                            ),
                            Text(
                              ' . ${question.answerCount}',
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.remove_red_eye,
                              color: Colors.amber,
                            ),
                            Text(
                              ' . ${question.viewCount}',
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
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
