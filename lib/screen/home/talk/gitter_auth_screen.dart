import 'package:Fluttery/state/gitter_auth_state.dart';
import 'package:Fluttery/util/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:provider/provider.dart';

class GitterAuthScreen extends StatefulWidget {
  GitterAuthScreen({Key key}) : super(key: key);

  _GitterAuthScreenState createState() => _GitterAuthScreenState();
}

class _GitterAuthScreenState extends State<GitterAuthScreen> {
  final FlutterWebviewPlugin _webviewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    _webviewPlugin.onUrlChanged.listen((String url) {
      if (url.contains(GITTER_REDIRECT_URL + "?code=")) {
        final String code = url.split("=")[1];
        // TODO - Set the collected code
        Navigator.pop(context);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _webviewPlugin.close();
    _webviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: GITTER_AUTH_URL +
          "authorize?client_id=" +
          GITTER_CLIENT_ID +
          "&response_type=code&redirect_uri=" +
          GITTER_REDIRECT_URL,
      appBar: AppBar(
        title: Text("Gitter Sign In"),
      ),
    );
  }
}
