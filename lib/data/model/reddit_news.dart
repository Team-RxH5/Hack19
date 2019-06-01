class RedditNews {
  String title;
  String text;
  String textHtml;
  String author;

  RedditNews.fromJson(Map<String, dynamic> json) {
    this.title = json["data"]["title"];
    this.text = json["data"]["selftext"];
    this.textHtml = json["data"]["selftext_html"];
    this.author = json["data"]["author_fullname"];
  }
}
