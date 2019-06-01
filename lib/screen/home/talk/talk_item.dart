import 'package:fhack/data/model/gitter_message.dart';
import 'package:flutter/material.dart';

class TalkItem extends StatelessWidget {
  final GitterMessage message;

  const TalkItem({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            message.user.displayName,
          ),
          subtitle: Text(message.text),
        ),
        Divider(
          height: 1,
        )
      ],
    );
  }
}
