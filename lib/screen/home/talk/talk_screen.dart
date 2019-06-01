import 'package:fhack/data/model/gitter_message.dart';
import 'package:fhack/data/remote/gitter_api.dart';
import 'package:fhack/screen/common/header.dart';
import 'package:fhack/screen/common/loader.dart';
import 'package:fhack/screen/home/talk/talk_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TalkScreen extends StatefulWidget {
  @override
  TalkScreenState createState() => TalkScreenState();
}

class TalkScreenState extends State<TalkScreen> {
  final GitterAPI _api = GitterAPI();
  final TextEditingController _textEditingController =
      new TextEditingController();
  bool _isComposing = false;

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
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Loader(false);
                  default:
                    if (snapshot.hasData) {
                      return Column(
                        children: snapshot.data
                            .map((GitterMessage message) =>
                                TalkItem(message: message))
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add),
        onPressed: () {},
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
        data: new IconThemeData(color: Theme.of(context).accentColor),
        child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: _textEditingController,
                  onChanged: (String text) {
                    setState(() {
                      _isComposing = text.length > 0;
                    });
                  },
                  onSubmitted: _handleSubmitted,
                  decoration:
                      InputDecoration.collapsed(hintText: "Send Message"),
                ),
              ),
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: Theme.of(context).platform == TargetPlatform.iOS
                    ? new CupertinoButton(
                        child: new Text("Send"),
                        onPressed: _isComposing
                            ? () =>
                                _handleSubmitted(_textEditingController.text)
                            : null,
                      )
                    : new IconButton(
                        icon: new Icon(Icons.send),
                        onPressed: _isComposing
                            ? () =>
                                _handleSubmitted(_textEditingController.text)
                            : null,
                      ),
              )
            ],
          ),
        ));
  }

  void _handleSubmitted(String text) {
    _textEditingController.clear();
    setState(() {
      _isComposing = false;
    });
    // ChatMessage message = new ChatMessage(
    // text: text,
    // animationController: new AnimationController(
    // duration: new Duration(milliseconds: 400),
    // vsync: this,
    // ),
    // );
    // setState(() {
    // _messages.insert(0, message);
    // });
    // message.animationController.forward();
  }
}
