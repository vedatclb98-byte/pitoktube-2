final videos = ref.watch(liveTrendingProvider);

return StreamBuilder(
  stream: videos,
  builder: (context, snapshot) {
    if (!snapshot.hasData) {
      return const Center(child: CircularProgressIndicator());
    }

    final list = snapshot.data!;

    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return VideoCard(video: list[index]);
      },
    );
  },
);