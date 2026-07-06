class VideoActions extends ConsumerWidget {
  final String videoId;
  final int likes;
  final int comments;

  const VideoActions({
    super.key,
    required this.videoId,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liked = ref.watch(likedVideosProvider).contains(videoId);

    return Column(
      children: [
        const CircleAvatar(
          radius: 26,
          child: Icon(Icons.person),
        ),

        const SizedBox(height: 16),

        IconButton(
          onPressed: () {
            ref
                .read(likedVideosProvider.notifier)
                .toggleLike(videoId, likes);
          },
          icon: Icon(
            liked ? Icons.favorite : Icons.favorite_border,
            size: 36,
            color: liked ? Colors.red : Colors.white,
          ),
        ),

        Text(
          liked ? "${likes + 1}" : "$likes",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 18),

        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => const CommentsBottomSheet(),
            );
          },
          icon: const Icon(
            Icons.chat_bubble_outline,
            size: 36,
          ),
        ),

        Text(
          "$comments",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 18),

        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (_) => const ShareBottomSheet(),
            );
          },
          icon: const Icon(
            Icons.share,
            size: 36,
          ),
        ),

        const SizedBox(height: 18),

        const BookmarkButton(),
      ],
    );
  }
}