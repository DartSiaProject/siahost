import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/shared/extensions/file_ext.dart';
import 'package:video_player/video_player.dart';

import '../../../features/fetch_all_buckets_and_files/domain/entities/file_entity.dart';

class VideoPreviewWidget extends StatefulWidget {
  final FileEntity file;

  const VideoPreviewWidget({super.key, required this.file});

  @override
  State createState() => _VideoPreviewWidgetState();
}

class _VideoPreviewWidgetState extends State<VideoPreviewWidget> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() async {
    // Initialize the video player controller
    _videoPlayerController =
        VideoPlayerController.file(File(widget.file.downloadedPath));

    // Wait for the video to be initialized
    await _videoPlayerController.initialize();

    // Initialize the Chewie controller
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      fullScreenByDefault: true,
      looping: false,
      allowFullScreen: true,
      allowMuting: true,
      showControls: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.white,
        handleColor: Colors.white,
        backgroundColor: Colors.transparent,
        bufferedColor: Colors.grey,
      ),
      placeholder: Container(
        color: Colors.transparent,
      ),
      autoInitialize: true,
    );

    // Update the UI
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_videoPlayerController.value.isInitialized) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Chewie(
      controller: _chewieController,
    );
  }
}

// import 'dart:io';

// import 'package:chewie/chewie.dart';
// import 'package:chewie_example/app/theme.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class ChewieDemo extends StatefulWidget {
//   const ChewieDemo({
//     super.key,
//     this.title = 'Chewie Demo',
//   });

//   final String title;

//   @override
//   State<StatefulWidget> createState() {
//     return _ChewieDemoState();
//   }
// }

// class _ChewieDemoState extends State<ChewieDemo> {
//   TargetPlatform? _platform;
//   late VideoPlayerController _videoPlayerController1;
//   late VideoPlayerController _videoPlayerController2;
//   ChewieController? _chewieController;
//   int? bufferDelay;

//   @override
//   void initState() {
//     super.initState();
//     initializePlayer();
//   }

//   @override
//   void dispose() {
//     _videoPlayerController1.dispose();
//     _videoPlayerController2.dispose();
//     _chewieController?.dispose();
//     super.dispose();
//   }

//   List<String> srcs = [
//     "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
//     "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
//     "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
//   ];

//   Future<void> initializePlayer() async {
//     _videoPlayerController1 =
//         VideoPlayerController.networkUrl(Uri.parse(srcs[currPlayIndex]));
//     _videoPlayerController2 =
//         VideoPlayerController.networkUrl(Uri.parse(srcs[currPlayIndex]));
//     await Future.wait([
//       _videoPlayerController1.initialize(),
//       _videoPlayerController2.initialize()
//     ]);
//     _createChewieController();
//     setState(() {});
//   }

//   void _createChewieController() {
//     // final subtitles = [
//     //     Subtitle(
//     //       index: 0,
//     //       start: Duration.zero,
//     //       end: const Duration(seconds: 10),
//     //       text: 'Hello from subtitles',
//     //     ),
//     //     Subtitle(
//     //       index: 0,
//     //       start: const Duration(seconds: 10),
//     //       end: const Duration(seconds: 20),
//     //       text: 'Whats up? :)',
//     //     ),
//     //   ];

//     final subtitles = [
//       Subtitle(
//         index: 0,
//         start: Duration.zero,
//         end: const Duration(seconds: 10),
//         text: const TextSpan(
//           children: [
//             TextSpan(
//               text: 'Hello',
//               style: TextStyle(color: Colors.red, fontSize: 22),
//             ),
//             TextSpan(
//               text: ' from ',
//               style: TextStyle(color: Colors.green, fontSize: 20),
//             ),
//             TextSpan(
//               text: 'subtitles',
//               style: TextStyle(color: Colors.blue, fontSize: 18),
//             )
//           ],
//         ),
//       ),
//       Subtitle(
//         index: 0,
//         start: const Duration(seconds: 10),
//         end: const Duration(seconds: 20),
//         text: 'Whats up? :)',
//         // text: const TextSpan(
//         //   text: 'Whats up? :)',
//         //   style: TextStyle(color: Colors.amber, fontSize: 22, fontStyle: FontStyle.italic),
//         // ),
//       ),
//     ];

//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController1,
//       autoPlay: true,
//       looping: true,
//       progressIndicatorDelay:
//           bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,

//       additionalOptions: (context) {
//         return <OptionItem>[
//           OptionItem(
//             onTap: (context) => toggleVideo(),
//             iconData: Icons.live_tv_sharp,
//             title: 'Toggle Video Src',
//           ),
//         ];
//       },
//       subtitle: Subtitles(subtitles),
//       showSubtitles: true,
//       subtitleBuilder: (context, dynamic subtitle) => Container(
//         padding: const EdgeInsets.all(10.0),
//         child: subtitle is InlineSpan
//             ? RichText(
//                 text: subtitle,
//               )
//             : Text(
//                 subtitle.toString(),
//                 style: const TextStyle(color: Colors.black),
//               ),
//       ),

//       hideControlsTimer: const Duration(seconds: 1),

//       // Try playing around with some of these other options:

//       // showControls: false,
//       // materialProgressColors: ChewieProgressColors(
//       //   playedColor: Colors.red,
//       //   handleColor: Colors.blue,
//       //   backgroundColor: Colors.grey,
//       //   bufferedColor: Colors.lightGreen,
//       // ),
//       // placeholder: Container(
//       //   color: Colors.grey,
//       // ),
//       // autoInitialize: true,
//     );
//   }

//   int currPlayIndex = 0;

//   Future<void> toggleVideo() async {
//     await _videoPlayerController1.pause();
//     currPlayIndex += 1;
//     if (currPlayIndex >= srcs.length) {
//       currPlayIndex = 0;
//     }
//     await initializePlayer();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: widget.title,
//       theme: AppTheme.light.copyWith(
//         platform: _platform ?? Theme.of(context).platform,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Column(
//           children: <Widget>[
//             Expanded(
//               child: Center(
//                 child: _chewieController != null &&
//                         _chewieController!
//                             .videoPlayerController.value.isInitialized
//                     ? Chewie(
//                         controller: _chewieController!,
//                       )
//                     : const Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           CircularProgressIndicator(),
//                           SizedBox(height: 20),
//                           Text('Loading'),
//                         ],
//                       ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 _chewieController?.enterFullScreen();
//               },
//               child: const Text('Fullscreen'),
//             ),
//             Row(
//               children: <Widget>[
//                 Expanded(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         _videoPlayerController1.pause();
//                         _videoPlayerController1.seekTo(Duration.zero);
//                         _createChewieController();
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("Landscape Video"),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         _videoPlayerController2.pause();
//                         _videoPlayerController2.seekTo(Duration.zero);
//                         _chewieController = _chewieController!.copyWith(
//                           videoPlayerController: _videoPlayerController2,
//                           autoPlay: true,
//                           looping: true,
//                           /* subtitle: Subtitles([
//                             Subtitle(
//                               index: 0,
//                               start: Duration.zero,
//                               end: const Duration(seconds: 10),
//                               text: 'Hello from subtitles',
//                             ),
//                             Subtitle(
//                               index: 0,
//                               start: const Duration(seconds: 10),
//                               end: const Duration(seconds: 20),
//                               text: 'Whats up? :)',
//                             ),
//                           ]),
//                           subtitleBuilder: (context, subtitle) => Container(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Text(
//                               subtitle,
//                               style: const TextStyle(color: Colors.white),
//                             ),
//                           ), */
//                         );
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("Portrait Video"),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Row(
//               children: <Widget>[
//                 Expanded(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         _platform = TargetPlatform.android;
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("Android controls"),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         _platform = TargetPlatform.iOS;
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("iOS controls"),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Row(
//               children: <Widget>[
//                 Expanded(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         _platform = TargetPlatform.windows;
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("Desktop controls"),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             if (Platform.isAndroid)
//               ListTile(
//                 title: const Text("Delay"),
//                 subtitle: DelaySlider(
//                   delay:
//                       _chewieController?.progressIndicatorDelay?.inMilliseconds,
//                   onSave: (delay) async {
//                     if (delay != null) {
//                       bufferDelay = delay == 0 ? null : delay;
//                       await initializePlayer();
//                     }
//                   },
//                 ),
//               )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DelaySlider extends StatefulWidget {
//   const DelaySlider({super.key, required this.delay, required this.onSave});

//   final int? delay;
//   final void Function(int?) onSave;
//   @override
//   State<DelaySlider> createState() => _DelaySliderState();
// }

// class _DelaySliderState extends State<DelaySlider> {
//   int? delay;
//   bool saved = false;

//   @override
//   void initState() {
//     super.initState();
//     delay = widget.delay;
//   }

//   @override
//   Widget build(BuildContext context) {
//     const int max = 1000;
//     return ListTile(
//       title: Text(
//         "Progress indicator delay ${delay != null ? "${delay.toString()} MS" : ""}",
//       ),
//       subtitle: Slider(
//         value: delay != null ? (delay! / max) : 0,
//         onChanged: (value) async {
//           delay = (value * max).toInt();
//           setState(() {
//             saved = false;
//           });
//         },
//       ),
//       trailing: IconButton(
//         icon: const Icon(Icons.save),
//         onPressed: saved
//             ? null
//             : () {
//                 widget.onSave(delay);
//                 setState(() {
//                   saved = true;
//                 });
//               },
//       ),
//     );
//   }
// }
