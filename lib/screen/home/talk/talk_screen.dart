import 'package:fhack/data/model/message.dart';
import 'package:fhack/data/remote/gitter_api.dart';
import 'package:flutter/material.dart';

class TalkScreen extends StatelessWidget {
  GitterAPI _api = GitterAPI();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Text("Talk"),
        FutureBuilder(
          future: _api.getMessages(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Message>> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: snapshot.data
                    .map((Message message) => ListTile(
                          title: Text(message.text),
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
