class Message {
  String id;
  String text;
  String html;
  DateTime sent;

  Message.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.text = json["text"];
    this.html = json["html"];
  }
}