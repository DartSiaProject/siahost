import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
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
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: () async {
            if (_isPlaying) {
              await _audioPlayer.pause();
            } else {
              await _audioPlayer
                  .play(DeviceFileSource(widget.file.downloadedPath));
            }
            setState(() {
              _isPlaying = !_isPlaying;
            });
          },
        ),
      ],
    );
  }
}
