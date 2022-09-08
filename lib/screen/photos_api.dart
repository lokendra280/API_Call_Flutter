import 'dart:convert';

import 'package:api_call/model/comments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as api;

// import 'model/post.dart';

class PhotosApi extends StatefulWidget {
  const PhotosApi({Key? key}) : super(key: key);

  @override
  State<PhotosApi> createState() => _PhotosApiState();
}

class _PhotosApiState extends State<PhotosApi> {
  //String data = "";
  List<Comments> Comment = [];
  // List posts = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetechdatafromserver();
  }

  fetechdatafromserver() async {
    final endpont = "https://jsonplaceholder.typicode.com/comments";
    final Uri url = Uri.parse(endpont);
    try {
      final response = await api.get(url);
      print(response.body);
      //data = response.body;
      setState(() {});
      final List decodedBody = json.decode(response.body);
      // posts = decodedBody;
      Comment = decodedBody
          .map<Comments>((e) => Comments.convertJsontoComments(e))
          .toList();
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
      ),
      body: ListView.builder(
        itemCount: Comment.length,
        itemBuilder: (context, index) {
          final Comments = Comment[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Id:-"
                  "${index + 1}. ${Comments.name}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(Comments.email),
                SizedBox(
                  height: 10,
                ),
                Text(Comments.body),
              ],
            ),
          );
        },
      ),
    );
  }
}
