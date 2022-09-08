import 'dart:convert';

import 'package:api_call/model/video.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as httpClinet;

class VideoFetch extends StatefulWidget {
  const VideoFetch({super.key});

  @override
  State<VideoFetch> createState() => _VideoFetchState();
}

class _VideoFetchState extends State<VideoFetch> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchvideo();
  }

  fetchvideo() async {
    try {
      final endpoint =
          "https://pixabay.com/api/videos/?key=15060366-e9ba4e34932e02c2b9e1d0915&q=yellow+flowers&pretty=true";
      final response = await httpClinet.get(Uri.parse(endpoint));
      print(response.statusCode);
      final body = response.body;
      final Map data = json.decode(body);
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
