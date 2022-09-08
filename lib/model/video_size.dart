class VideoSizes {
  final Resolution large, medium, small, tiny;

  VideoSizes(
      {required this.large,
      required this.medium,
      required this.small,
      required this.tiny});

  static VideoSizes fromJson(Map json) {
    return VideoSizes(
        large: json['large'],
        medium: json['medium'],
        small: json['small'],
        tiny: json['tiny']);
  }
}

class Resolution {
  final int width, height, size;
  final String url;

  Resolution(
      {required this.width,
      required this.height,
      required this.size,
      required this.url});

  static Resolution fromJson(Map json) {
    return Resolution(
        width: json['width'],
        height: json['height'],
        size: json['size'],
        url: json['url']);
  }
}
