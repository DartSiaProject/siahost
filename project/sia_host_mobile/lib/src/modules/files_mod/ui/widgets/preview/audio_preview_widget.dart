// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:sia_host_mobile/src/modules/files_mod/features/fetch_all_buckets_and_files/domain/entities/file_entity.dart';
// import 'package:sia_host_mobile/src/shared/extensions/file_ext.dart';

// class AudioPreviewWidgetWidget extends StatefulWidget {
//   final FileEntity file;

//   const AudioPreviewWidgetWidget({super.key, required this.file});

//   @override
//   State createState() => _AudioPreviewWidgetWidgetState();
// }

// class _AudioPreviewWidgetWidgetState extends State<AudioPreviewWidgetWidget> {
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   bool _isPlaying = false;
//   Duration _duration = Duration.zero;
//   Duration _position = Duration.zero;
//   double _volume = 1.0;

//   @override
//   void initState() {
//     super.initState();
//     _setupAudioPlayer();
//   }

//   void _setupAudioPlayer() async {
//     // Set the audio source
//     await _audioPlayer.setSource(DeviceFileSource(widget.file.downloadedPath));

//     // Listen for duration changes
//     _audioPlayer.onDurationChanged.listen((duration) {
//       setState(() {
//         _duration = duration;
//       });
//     });

//     // Listen for position changes
//     _audioPlayer.onPositionChanged.listen((position) {
//       setState(() {
//         _position = position;
//       });
//     });

//     // Listen for player state changes
//     _audioPlayer.onPlayerStateChanged.listen((state) {
//       setState(() {
//         _isPlaying = state == PlayerState.playing;
//       });
//     });
//   }

//   void _playPause() async {
//     if (_isPlaying) {
//       await _audioPlayer.pause();
//     } else {
//       await _audioPlayer.resume();
//     }
//   }

//   void _seek(Duration position) async {
//     await _audioPlayer.seek(position);
//   }

//   void _setVolume(double volume) async {
//     await _audioPlayer.setVolume(volume);
//     setState(() {
//       _volume = volume;
//     });
//   }

//   String _formatDuration(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final hours = twoDigits(duration.inHours);
//     final minutes = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));
//     return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Ensure the slider value is within the valid range
//     double sliderValue = _position.inSeconds.toDouble();
//     double maxSliderValue = _duration.inSeconds.toDouble();
//     if (maxSliderValue <= 0) {
//       sliderValue = 0;
//       maxSliderValue = 1; // Set a default max value to avoid errors
//     }

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         // Play/Pause Button
//         IconButton(
//           iconSize: 64,
//           icon: Icon(
//             _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
//             color: Colors.white,
//           ),
//           onPressed: _playPause,
//         ),
//         const SizedBox(height: 16),

//         // Seek Bar
//         SliderTheme(
//           data: SliderTheme.of(context).copyWith(
//             activeTrackColor: Colors.white,
//             inactiveTrackColor: Colors.grey[700],
//             thumbColor: Colors.white,
//             overlayColor: Colors.white.withValues(alpha:0.2),
//             valueIndicatorColor: Colors.white,
//           ),
//           child: Slider(
//             value: sliderValue,
//             min: 0,
//             max: maxSliderValue,
//             onChanged: (value) {
//               _seek(Duration(seconds: value.toInt()));
//             },
//           ),
//         ),
//         const SizedBox(height: 8),

//         // Current Position and Duration
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 _formatDuration(_position),
//                 style: const TextStyle(color: Colors.white),
//               ),
//               Text(
//                 _formatDuration(_duration),
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 16),

//         // Volume Control
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.volume_down, color: Colors.white),
//             const SizedBox(width: 8),
//             SliderTheme(
//               data: SliderTheme.of(context).copyWith(
//                 activeTrackColor: Colors.white,
//                 inactiveTrackColor: Colors.grey[700],
//                 thumbColor: Colors.white,
//                 overlayColor: Colors.white.withValues(alpha:0.2),
//               ),
//               child: SizedBox(
//                 width: 150,
//                 child: Slider(
//                   value: _volume,
//                   min: 0,
//                   max: 1,
//                   onChanged: _setVolume,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 8),
//             const Icon(Icons.volume_up, color: Colors.white),
//           ],
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/fetch_all_buckets_and_files/domain/entities/file_entity.dart';
import 'package:sia_host_mobile/src/shared/extensions/file_ext.dart';

class AudioPreviewWidget extends StatefulWidget {
  final FileEntity file;

  const AudioPreviewWidget({super.key, required this.file});

  @override
  State createState() => _AudioPreviewWidgetState();
}

class _AudioPreviewWidgetState extends State<AudioPreviewWidget> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _setupAudioPlayer();
  }

  void _setupAudioPlayer() async {
    try {
      await _audioPlayer
          .setFilePath(widget.file.downloadedPath); // Load the audio file
    } catch (e) {
      print("Error loading audio file: $e");
    }
  }

  void _playPause(isPlaying) async {
    setState(() {
      _isPlaying = !_isPlaying;
    });
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play();
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Play/Pause Button
        IconButton(
          iconSize: 64,
          icon: Icon(
            _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
            color: Colors.white,
          ),
          onPressed: () => _playPause(_isPlaying),
        ),
        const SizedBox(height: 16),

        // Seek Bar and Duration
        StreamBuilder<Duration>(
          stream: _audioPlayer.positionStream,
          builder: (context, snapshot) {
            final position = snapshot.data ?? Duration.zero;
            return StreamBuilder<Duration?>(
              stream: _audioPlayer.durationStream,
              builder: (context, snapshot) {
                final duration = snapshot.data ?? Duration.zero;
                return Column(
                  children: [
                    Slider(
                      value: position.inSeconds.toDouble(),
                      min: 0,
                      max: duration.inSeconds.toDouble(),
                      onChanged: (value) {
                        _audioPlayer.seek(Duration(seconds: value.toInt()));
                      },
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey[700],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDuration(position),
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            _formatDuration(duration),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
        const SizedBox(height: 16),

        // Volume Control
        StreamBuilder<double>(
          stream: _audioPlayer.volumeStream,
          builder: (context, snapshot) {
            final volume = snapshot.data ?? 1.0;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.volume_down, color: Colors.white),
                const SizedBox(width: 8),
                Slider(
                  value: volume,
                  min: 0,
                  max: 1,
                  onChanged: (value) {
                    _audioPlayer.setVolume(value);
                  },
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey[700],
                ),
                const SizedBox(width: 8),
                const Icon(Icons.volume_up, color: Colors.white),
              ],
            );
          },
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [minutes, seconds].join(':');
  }
}
