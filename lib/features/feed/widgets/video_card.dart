import 'dart:async';
import 'package:flutter/material.dart';

import '../models/video_model.dart';
import 'animated_heart.dart';
import 'video_actions.dart';
import 'video_info.dart';
import 'cloud_video_player.dart';
import '../../video/video_engagement_service.dart';
import '../video_detail_screen.dart';

class VideoCard extends StatefulWidget {
  final VideoModel video;

  const VideoCard({
    super.key,
    required this.video,
  });

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  bool _showHeart = false;

  final VideoEngagementService _engagement =
      VideoEngagementService();

  void _onDoubleTap() {
    setState(() {
      _showHeart = true;
    });

    Timer(const Duration(milliseconds: 700), () {
      if (!mounted) return;
      setState(() => _showHeart = false);
    });
  }

  void _startWatch() {
    _engagement.addView(widget.video.id);
  }

  void _stopWatch() {
    // burada istersen watchTime eklenir (sonraki adımda bağladık)
  }

  void _openDetail() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => VideoDetailScreen(video: widget.video),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final video = widget.video;

    return GestureDetector(
      onTap: _openDetail,
      onDoubleTap: _onDoubleTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // 🎥 VIDEO PLAYER
          CloudVideoPlayer(
            videoUrl: video.videoUrl,
            onPlay: _startWatch,
            onStop: _stopWatch,
          ),

          // ❤️ HEART
          AnimatedHeart(visible: _showHeart),

          // 📊 ACTIONS
          Positioned(
            right: 16,
            bottom: 110,
            child: VideoActions(
              videoId: video.id,
              likes: video.likes,
              comments: video.comments,
            ),
          ),

          // ℹ️ INFO
          Positioned(
            left: 16,
            right: 90,
            bottom: 30,
            child: VideoInfo(video: video),
          ),
        ],
      ),
    );
  }
}