import 'package:Fluttery/data/model/reddit_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:markdown/markdown.dart' as Markdown;

class RedditItem extends StatelessWidget {
  final RedditNews news;

  const RedditItem({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            news.text,
            style: Theme.of(context).textTheme.title,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            // child: Text(news.text),
            child: Html(
              data: news.author,
            ),
          ),
        ),
        Divider(
          height: 1,
        )
      ],
    );
  }
}
