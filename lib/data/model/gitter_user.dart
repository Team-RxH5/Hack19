class GitterUser {
  String id;
  String username;
  String displayName;
  String url;
  String avatarUrl;
  String avatorUrlMedium;

  GitterUser.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.username = json["username"];
    this.displayName = json["displayName"];
    this.avatarUrl = json["avatarUrl"];
    this.avatorUrlMedium = json["avatorUrlMedium"];
  }
}
