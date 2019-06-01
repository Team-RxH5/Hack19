import 'package:fhack/data/model/youtube_video.dart';
import 'package:fhack/data/remote/youtube_api.dart';
import 'package:fhack/screen/common/header.dart';
import 'package:fhack/screen/common/loader.dart';
import 'package:fhack/screen/home/news/video_item.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  final YoutubeAPI _api = YoutubeAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[Header("News")];
        },
        body: ListView(
          children: <Widget>[
            FutureBuilder(
              future: _api.getVideos(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<YoutubeVideo>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Loader(true);
                  default:
                    if (snapshot.hasData) {
                      return Column(
                        children: snapshot.data
                            .map(
                                (YoutubeVideo video) => VideoItem(video: video))
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
    );
  }
}
