import 'package:Fluttery/data/gitter_repository.dart';
import 'package:Fluttery/data/model/gitter_message.dart';
import 'package:Fluttery/data/remote/gitter_api.dart';
import 'package:Fluttery/screen/common/loader.dart';
import 'package:Fluttery/screen/home/talk/gitter_auth_screen.dart';
import 'package:Fluttery/screen/home/talk/talk_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TalkScreen extends StatefulWidget {
  @override
  TalkScreenState createState() => TalkScreenState();
}

class TalkScreenState extends State<TalkScreen> {
  final GitterRepository _api = GitterRepository();
  final TextEditingController _textEditingController =
      new TextEditingController();
  bool _isComposing = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ListView(
            reverse: true,
            children: <Widget>[
              SizedBox(
                height: 54,
              ),
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
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildJoin(context),
          ),
        ],
      ),
    );
  }

  Widget _buildJoin(BuildContext context) {
    return Material(
      color: Theme.of(context).accentColor,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.black45,
          child: Icon(Icons.add, color: Theme.of(context).accentColor),
        ),
        title: Text(
          "Join the conversation with Gitter",
          style: TextStyle(color: Colors.black54),
        ),
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => GitterAuthScreen()),
            ),
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
        data: new IconThemeData(color: Theme.of(context).accentColor),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: new Container(
            margin: const EdgeInsets.only(left: 16.0),
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
