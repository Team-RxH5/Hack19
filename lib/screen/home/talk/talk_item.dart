import 'package:Fluttery/data/model/gitter_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:markdown/markdown.dart' as Markdown;

class TalkItem extends StatelessWidget {
  final GitterMessage message;

  const TalkItem({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
          child: Text(message.user.displayName[0]),
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                message.user.displayName,
                style: Theme.of(context).textTheme.title,
              ),
              Spacer(),
              Text(
                '${message.sent.year}-${message.sent.month}-${message.sent.day} ${message.sent.hour}:${message.sent.minute}:${message.sent.second}',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Html(
              data: Markdown.markdownToHtml(message.text),
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
