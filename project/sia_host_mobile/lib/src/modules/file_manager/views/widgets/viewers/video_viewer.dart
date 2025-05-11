import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VideoViewer extends StatefulWidget {
  const VideoViewer({required this.filePath, super.key});
  final String filePath;

  @override
  State<VideoViewer> createState() => _VideoViewerState();
}

class _VideoViewerState extends State<VideoViewer> {
  late BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    super.initState();

    // 1) Data source from local file
    final dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.file,
      widget.filePath,
    );

    // 2) Configuration for native‐like controls
    const config = BetterPlayerConfiguration(
      autoPlay: true,
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
      allowedScreenSleep: false,
      autoDetectFullscreenDeviceOrientation: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
      ],
    );

    // 3) Create controller
    _betterPlayerController = BetterPlayerController(config);
    _betterPlayerController.setupDataSource(dataSource);
  }

  @override
  void dispose() {
    _betterPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SafeArea(
        child: BetterPlayer(controller: _betterPlayerController),
      ),
    );
  }
}
