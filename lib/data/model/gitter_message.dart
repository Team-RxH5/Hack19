import 'gitter_user.dart';

class GitterMessage {
  String id;
  String text;
  String html;
  DateTime sent;
  GitterUser user;

  GitterMessage.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.text = json["text"];
    this.html = json["html"];
    this.sent = DateTime.parse(json["sent"]);
    this.user = GitterUser.fromJson(json["fromUser"]);
  }
}
