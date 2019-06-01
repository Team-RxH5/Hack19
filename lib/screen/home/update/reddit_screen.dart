import 'package:Fluttery/data/model/gitter_message.dart';
import 'package:Fluttery/data/model/reddit_news.dart';
import 'package:Fluttery/data/remote/reddit_api.dart';
import 'package:Fluttery/screen/common/header.dart';
import 'package:Fluttery/screen/common/loader.dart';
import 'package:Fluttery/screen/home/talk/talk_item.dart';
import 'package:Fluttery/screen/home/update/reddit_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RedditScreen extends StatefulWidget {
  @override
  RedditScreenState createState() => RedditScreenState();
}

class RedditScreenState extends State<RedditScreen> {
  final RedditAPI _api = RedditAPI();
  final TextEditingController _textEditingController =
      new TextEditingController();
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[Header("News")];
        },
        body: ListView(
          children: <Widget>[
            FutureBuilder(
              future: _api.getMessages(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<RedditNews>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Loader(false);
                  default:
                    if (snapshot.hasData) {
                      return Column(
                        children: snapshot.data
                            .map((RedditNews message) => RedditItem(
                                  news: message,
                                ))
                            .toList(),
                      );
                    } else {
                      return Text("Something went wrong!");
                    }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
