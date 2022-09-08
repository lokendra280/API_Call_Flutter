import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as api;

import '../model/post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String data = "";
  List<Post> posts = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDataFromServer();
  }

  fetchDataFromServer() async {
    final endpoint = "https://jsonplaceholder.typicode.com/posts";
    final Uri url = Uri.parse(endpoint);

    try {
      final response = await api.get(url);
      print(response.statusCode);
      data = response.body;
      setState(() {});
      // print(response.body);
      final List decodedBody = json.decode(response.body);
      //posts = decodedBody;
      // decodedBody.map<Post>((e) {
      //   final converted = Post.convertJsontoPost(e);
      //   return converted;
      // }).toList();
      posts = decodedBody.map<Post>((e) => Post.convertJsontoPost(e)).toList();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${index + 1}. ${post.title}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(post.body),
              ],
            ),
          );
        },
      ),
    );
  }
}
