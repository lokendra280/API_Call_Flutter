class Userinfo {
  final int id;
  final String name, username, email;

  Userinfo(
      {required this.id,
      required this.name,
      required this.username,
      required this.email});

  static Userinfo convertJsontoUserinfo(Map json) {
    return Userinfo(
        id: json["id"],
        name: json['name'],
        username: json['username'],
        email: json['email']);
  }
}
