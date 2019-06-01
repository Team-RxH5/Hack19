class Question {
  Map<String, dynamic> owner;
  int viewCount;
  int answerCount;
  int score;
  String link;
  String title;
  List<dynamic> tags;
  DateTime time;

  Question.fromJson(Map<String, dynamic> json) {
    this.owner = json['owner'];
    this.viewCount = json['view_count'];
    this.answerCount = json['answer_count'];
    this.link = json['link'];
    this.title = json['title'];
    this.tags = json['tags'];
    this.score = json['score'];
    this.time =
        DateTime.fromMillisecondsSinceEpoch(json['creation_date'] * 1000);
  }
}
