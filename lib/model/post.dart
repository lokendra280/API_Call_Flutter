import 'dart:convert';

class Post {
  final int userId, id;
  final String title, body;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  /// json serilization
  static Post convertJsontoPost(Map json) {
    return Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}
