import 'dart:convert';

import 'package:api_call/model/video_size.dart';

class Video {
  final id, duration, views, downloads, likes, comments, userId;

  final String pageUrl, type, tags, pictureId, user, userImageUrl;
  final VideoSizes videoSizes;

  Video(
      {required this.id,
      required this.duration,
      required this.views,
      required this.downloads,
      required this.likes,
      required this.comments,
      required this.userId,
      required this.pageUrl,
      required this.type,
      required this.tags,
      required this.pictureId,
      required this.user,
      required this.userImageUrl,
      required this.videoSizes});

  static Video fromJson(Map json) {
    return Video(
      id: json['id'],
      duration: json['duration'],
      views: json['views'],
      downloads: json['downloads'],
      likes: json['likes'],
      comments: json['comments'],
      userId: json['userId'],
      pageUrl: json['pageURL'],
      type: json['type'],
      tags: json['tags'],
      pictureId: json['picture_id'],
      user: json['user'],
      userImageUrl: json['userImageURL'],
      videoSizes: VideoSizes.fromJson(json['videos']),
    );
  }
}
