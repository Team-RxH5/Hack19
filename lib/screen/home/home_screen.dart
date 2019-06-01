import 'package:fhack/screen/home/news/news_screen.dart';
import 'package:fhack/screen/home/qa/qa_screen.dart';
import 'package:fhack/screen/home/talk/talk_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentScreenIndex = 0;
  final _screens = <Widget>[
    TalkScreen(),
    NewsScreen(),
    QAScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Chat'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed),
            title: Text('News'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            title: Text('Q&A'),
          ),
        ],
        currentIndex: _currentScreenIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
