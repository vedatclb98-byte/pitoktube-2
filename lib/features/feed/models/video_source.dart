enum VideoSourceType {
  asset,
  network,
  file,
}

class VideoSource {
  final String url;
  final VideoSourceType type;

  const VideoSource({
    required this.url,
    required this.type,
  });
}