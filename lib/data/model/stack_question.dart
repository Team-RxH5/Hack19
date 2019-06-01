class Question {
  Map<String, dynamic> owner;
  int viewCount;
  int answerCount;
  String link;
  String title;
  List<dynamic> tags;

  Question.fromJson(Map<String, dynamic> json) {
    this.owner = json['owner'];
    this.viewCount = json['view_count'];
    this.answerCount = json['answer_count'];
    this.link = json['link'];
    this.title = json['title'];
    this.tags = json['tags'];
  }
}
