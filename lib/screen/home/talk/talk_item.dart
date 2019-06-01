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
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                message.user.displayName,
                style: TextStyle(color: Colors.blueAccent, fontSize: 14),
              ),
              Spacer(),
              Text(
                message.sent.toIso8601String(),
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(message.text, style: TextStyle(color: Colors.black87, fontSize: 16),),
          ),
        ),
        Divider(
          height: 1,
        )
      ],
    );
  }
}
