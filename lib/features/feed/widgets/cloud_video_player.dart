import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CloudVideoPlayer extends StatefulWidget {
  final String videoUrl;

  // 👇 WATCH TIME HOOK
  final VoidCallback? onPlay;
  final VoidCallback? onStop;

  const CloudVideoPlayer({
    super.key,
    required this.videoUrl,
    this.onPlay,
    this.onStop,
  });

  @override
  State<CloudVideoPlayer> createState() => _CloudVideoPlayerState();
}

class _CloudVideoPlayerState extends State<CloudVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    )
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);

        // 🎬 video başladı
        widget.onPlay?.call();
      });
  }

  @override
  void dispose() {
    // ⛔ video durdu
    widget.onStop?.call();

    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
        });
      },
      child: SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: _controller.value.size.width,
            height: _controller.value.size.height,
            child: VideoPlayer(_controller),
          ),
        ),
      ),
    );
  }
}