import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/shared/handler/audio_player_handler.dart';
import 'package:sia_host_mobile/src/shared/utils/constants.dart';

class AudioViewer extends StatefulWidget {
  const AudioViewer({required this.filePath, super.key});
  final String filePath;

  @override
  State<AudioViewer> createState() => _AudioViewerState();
}

class _AudioViewerState extends State<AudioViewer> {
  final AudioPlayerHandler _handler = di.get<AudioPlayerHandler>();
  late final Stream<PlaybackState> _playbackState;
  late final Stream<MediaItem?> _mediaItem;
  late final Stream<Duration> _positionStream;

  @override
  void initState() {
    super.initState();
    _playbackState = _handler.playbackState;
    _mediaItem = _handler.mediaItem;
    _positionStream = _handler.positionStream;
// _handler.mediaItem.value?
    // _handler.stp
    // _handler.setFile(widget.filePath).then((_) {
    //   // if finished to play already restart
    //   if (_handler.playbackState.value.processingState ==
    //       AudioProcessingState.completed) {
    //     _handler.seek(Duration.zero);
    //   }
    // });

    final currentId = _handler.mediaItem.value?.id;
    if (currentId == widget.filePath) {
      // same track: if not playing, resume
      if (!_handler.playbackState.value.playing) {
        _handler.play();
      }
    } else {
      // new track: load & play
      _handler.setFile(widget.filePath).then((_) => _handler.play());
    }
  }

  String _format(Duration d) {
    final mm = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final ss = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$mm:$ss';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgoundColor,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: StreamBuilder<MediaItem?>(
            stream: _mediaItem,
            builder: (ctx, msnap) {
              final item = msnap.data;
              final title = item?.title ?? widget.filePath.split('/').last;
              return Column(
                children: [
                  const SizedBox(height: 24),

                  // Album art placeholder
                  Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(8),
                      image: item?.artUri != null
                          ? DecorationImage(
                              image: NetworkImage(item!.artUri!.toString()),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: item?.artUri == null
                        ? const Icon(
                            Icons.music_note,
                            size: 80,
                            color: Colors.white24,
                          )
                        : null,
                  ),

                  const SizedBox(height: 32),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (item?.album != null)
                    Text(
                      item!.album!,
                      style:
                          const TextStyle(color: Colors.white60, fontSize: 16),
                    ),

                  const Spacer(),

                  // Position slider
                  // StreamBuilder<PlaybackState>(
                  //   stream: _playbackState,
                  //   builder: (c, snap) {
                  //     final state = snap.data;
                  //     final pos = state?.position ?? Duration.zero;
                  //     final total = item?.duration ?? Duration.zero;

                  //     log('AudioViewer: $pos / $total');
                  //     return Column(
                  //       children: [
                  //         SliderTheme(
                  //           data: SliderTheme.of(context).copyWith(
                  //             thumbShape: const RoundSliderThumbShape(
                  //               enabledThumbRadius: 6,
                  //             ),
                  //             overlayShape: const RoundSliderOverlayShape(
                  //               overlayRadius: 12,
                  //             ),
                  //             activeTrackColor: AppTheme.primaryColor,
                  //             inactiveTrackColor: Colors.white24,
                  //           ),
                  //           child: Slider(
                  //             max: total.inMilliseconds.toDouble(),
                  //             value: pos.inMilliseconds
                  //                 .clamp(0, total.inMilliseconds)
                  //                 .toDouble(),
                  //             onChanged: (v) {
                  //               _handler.seek(
                  //                 Duration(milliseconds: v.toInt()),
                  //               );
                  //             },
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.symmetric(horizontal: 16),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Text(
                  //                 _format(pos),
                  //                 style: const TextStyle(color: Colors.white70),
                  //               ),
                  //               Text(
                  //                 _format(total),
                  //                 style: const TextStyle(color: Colors.white70),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // ),
                  StreamBuilder<Duration>(
                    stream: _positionStream,
                    builder: (context, snap) {
                      final pos = snap.data ?? Duration.zero;
                      final total = item?.duration ?? Duration.zero;
                      return Column(
                        children: [
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 6,
                              ),
                              overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 12,
                              ),
                              activeTrackColor: AppTheme.primaryColor,
                              inactiveTrackColor: Colors.white24,
                            ),
                            child: Slider(
                              max: total.inMilliseconds.toDouble(),
                              value: pos.inMilliseconds
                                  .clamp(0, total.inMilliseconds)
                                  .toDouble(),
                              onChanged: (v) => _handler
                                  .seek(Duration(milliseconds: v.toInt())),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _format(pos),
                                  style: const TextStyle(color: Colors.white70),
                                ),
                                Text(
                                  _format(total),
                                  style: const TextStyle(color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  // Playback controls
                  StreamBuilder<PlaybackState>(
                    stream: _playbackState,
                    builder: (c, snap) {
                      final playing = snap.data?.playing ?? false;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            iconSize: 32,
                            color: Colors.white,
                            icon: const Icon(Icons.replay_10),
                            onPressed: () {
                              final pos = snap.data?.position ?? Duration.zero;
                              _handler.seek(pos - const Duration(seconds: 10));
                            },
                          ),
                          const SizedBox(width: 16),
                          IconButton(
                            iconSize: 64,
                            color: Colors.white,
                            icon: Icon(
                              playing
                                  ? Icons.pause_circle_filled
                                  : Icons.play_circle_filled,
                              size: 64,
                            ),
                            onPressed: () =>
                                playing ? _handler.pause() : _handler.play(),
                          ),
                          const SizedBox(width: 16),
                          IconButton(
                            iconSize: 32,
                            color: Colors.white,
                            icon: const Icon(Icons.forward_10),
                            onPressed: () {
                              final pos = snap.data?.position ?? Duration.zero;
                              _handler.seek(pos + const Duration(seconds: 10));
                            },
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  // Playback speed selector
                  StreamBuilder<PlaybackState>(
                    stream: _playbackState,
                    builder: (c, snap) {
                      final speed = snap.data?.speed ?? 1.0;
                      return PopupMenuButton<double>(
                        initialValue: speed,
                        tooltip: 'Playback speed',
                        icon: const Icon(Icons.speed, color: Colors.white),
                        onSelected: _handler.setSpeed,
                        itemBuilder: (_) => [0.5, 1.0, 1.5, 2.0]
                            .map(
                              (v) => PopupMenuItem(
                                value: v,
                                child: Text('$v×'),
                              ),
                            )
                            .toList(),
                      );
                    },
                  ),

                  const Spacer(flex: 2),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
