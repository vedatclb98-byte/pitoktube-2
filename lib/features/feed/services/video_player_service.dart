class VideoPlayerService {
  bool _isPlaying = false;
  bool _isMuted = false;

  bool get isPlaying => _isPlaying;
  bool get isMuted => _isMuted;

  void play() {
    _isPlaying = true;
  }

  void pause() {
    _isPlaying = false;
  }

  void togglePlay() {
    _isPlaying = !_isPlaying;
  }

  void toggleMute() {
    _isMuted = !_isMuted;
  }
}