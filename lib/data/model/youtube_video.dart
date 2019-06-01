class YoutubeVideo {
  String id;
  String title;
  String description;
  String thumbnail;
  DateTime timestamp;

  YoutubeVideo.fromJson(Map<String, dynamic> json) {
    this.id = json["id"]["videoId"];
    this.title = json["snippet"]["title"];
    this.description = json["snippet"]["description"];
    this.thumbnail = json["snippet"]["thumbnails"]["high"]["url"];
    this.timestamp = DateTime.parse(json["snippet"]["publishedAt"]);
  }
}
