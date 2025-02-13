import 'dart:io';

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
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.file.downloadedPath))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
