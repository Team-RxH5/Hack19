import 'package:fhack/data/model/gitter_message.dart';
import 'package:fhack/data/remote/gitter_api.dart';
import 'package:fhack/screen/common/header.dart';
import 'package:fhack/screen/home/talk/talk_item.dart';
import 'package:flutter/material.dart';

class TalkScreen extends StatelessWidget {
  final GitterAPI _api = GitterAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[Header("Talk")];
        },
        body: ListView(
          children: <Widget>[
            FutureBuilder(
              future: _api.getMessages(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<GitterMessage>> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data
                        .map((GitterMessage message) =>
                            TalkItem(message: message))
                        .toList(),
                  );
                } else {
                  return Text("Crap");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
