import 'package:Fluttery/screen/home/home_screen.dart';
import 'package:Fluttery/state/gitter_auth_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluttery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) {
        return ChangeNotifierProvider<GitterAuthState>(
          builder: (context) => GitterAuthState(),
          child: child,
        );
      },
      home: HomeScreen(),
    );
  }
}
