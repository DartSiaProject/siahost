import 'package:audio_service/audio_service.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';

/// This module exposes your AudioHandler as a singleton,
/// but waits for AudioService.init() to complete first.
@module
abstract class AudioModule {
  @preResolve
  @singleton
  Future<AudioPlayerHandler> get audioHandler async {
    return AudioService.init<AudioPlayerHandler>(
      builder: AudioPlayerHandler.new,
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.sia.sia_host_mobile.channel.audio',
        androidNotificationChannelName: 'Audio Playback',
        androidNotificationOngoing: true,
      ),
    );
  }
}

class AudioPlayerHandler extends BaseAudioHandler with SeekHandler {
  /// Initialise our audio handler.
  AudioPlayerHandler() {
    // So that our clients (the Flutter UI and the system notification) know
    // what state to display, here we set up our audio handler to broadcast all
    // playback state changes as they happen via playbackState...
    _player.playbackEventStream.map(_transformEvent).pipe(playbackState);
  }

  final _player = AudioPlayer();

  /// Expose the raw positionStream from just_audio for UI updates.
  Stream<Duration> get positionStream => _player.positionStream;

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> stop() => _player.stop();

  /// Transform a just_audio event into an audio_service state.
  ///
  /// This method is used from the constructor. Every event received from the
  /// just_audio player will be transformed into an audio_service state so that
  /// it can be broadcast to audio_service clients.
  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: [
        MediaControl.rewind,
        if (_player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.stop,
        MediaControl.fastForward,
      ],
      systemActions: const {
        MediaAction.seek,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      },
      androidCompactActionIndices: const [0, 1, 3],
      processingState: const {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[_player.processingState]!,
      playing: _player.playing,
      updatePosition: _player.position,
      bufferedPosition: _player.bufferedPosition,
      speed: _player.speed,
      queueIndex: event.currentIndex,
    );
  }

  /// Call this to load a file
  Future<void> setFile(String path) async {
    await _player.setFilePath(path);
    mediaItem.add(
      MediaItem(
        id: path,
        album: '',
        title: path.split('/').last,
        duration: _player.duration,
      ),
    );
  }
}
