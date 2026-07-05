import 'package:flutter/material.dart';

class VideoPlayerWidget extends StatelessWidget {
  final String videoUrl;

  const VideoPlayerWidget({
    super.key,
    required this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const Center(
            child: Icon(
              Icons.play_circle_fill,
              color: Colors.white,
              size: 100,
            ),
          ),

          Positioned(
            top: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Demo Video",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
                    Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              children: [
                const Icon(
                  Icons.visibility,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                const Text(
                  "1.2M görüntülenme",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 34,
                  ),
                ),

                const SizedBox(height: 12),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.comment,
                    color: Colors.white,
                    size: 34,
                  ),
                ),

                const SizedBox(height: 12),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                    size: 34,
                  ),
                ),
              ],
            ),
          ),
                  ],
      ),
    );
  }
}