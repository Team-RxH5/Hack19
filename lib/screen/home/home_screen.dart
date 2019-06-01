import 'package:Fluttery/screen/home/news/video_screen.dart';
import 'package:Fluttery/screen/home/qa/qa_screen.dart';
import 'package:Fluttery/screen/home/talk/talk_screen.dart';
import 'package:Fluttery/screen/home/update/reddit_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentScreenIndex = 0;
  final _screens = <Widget>[
    TalkScreen(),
    VideoScreen(),
    QAScreen(),
    RedditScreen(),
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
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Talk'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed),
            title: Text('Video'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            title: Text('Q&A'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.new_releases),
            title: Text('News'),
          ),
        ],
        currentIndex: _currentScreenIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
