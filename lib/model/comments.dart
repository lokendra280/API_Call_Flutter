import 'dart:convert';

class Comments {
  final int postId, id;
  final String name, email, body;

  Comments(
      {required this.postId,
      required this.id,
      required this.name,
      required this.email,
      required this.body});

  static Comments convertJsontoComments(Map json) {
    return Comments(
      body: json['body'],
      email: json['email'],
      name: json['name'],
      id: json['id'],
      postId: json['postId'],
    );
  }
}
