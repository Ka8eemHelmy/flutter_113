import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController videoPlayerController = VideoPlayerController.networkUrl(
    Uri.parse(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    ),
  );

  ChewieController? chewieController;

  @override
  void initState() {
    initChewie();
    super.initState();
  }

  void initChewie() async {
    await videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: false,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            if (chewieController == null)
              Shimmer.fromColors(
                baseColor: Colors.grey[400]!,
                highlightColor: Colors.grey[300]!,
                child: Container(
                  height: 250,
                  width: double.infinity,
                  color: Colors.grey[300],
                ),
              ),
            if (chewieController != null)
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Chewie(
                  controller: chewieController!,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }
}
