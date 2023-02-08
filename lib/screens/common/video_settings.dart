import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  final VideoPlayerController videoPlayerController;

  const VideoPlayer({Key? key, required this.videoPlayerController})
      : super(key: key);

  @override
  _VideoPlayerState createState() {
    return _VideoPlayerState();
  }
}

class _VideoPlayerState extends State<VideoPlayer> {
  ChewieController? chewieController;

  @override
  void initState() {
    chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        looping: false,
        aspectRatio: 1,
        autoInitialize: true);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    chewieController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: chewieController!,
    );
  }
}

class VideoDisplay extends StatefulWidget {
  final String filePath;
  final String urlPath;
  const VideoDisplay({Key? key, this.filePath = '', this.urlPath = ''})
      : super(key: key);
  @override
  _VideoDisplayState createState() => _VideoDisplayState();
}

class _VideoDisplayState extends State<VideoDisplay> {
  @override
  Widget build(BuildContext context) {
    return VideoPlayer(
        key: UniqueKey(),
        videoPlayerController: widget.filePath.isNotEmpty
            ? VideoPlayerController.file(File(widget.filePath))
            : VideoPlayerController.network(widget.urlPath));
  }
}
