import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:multiv/view/pages/globes.dart';
import 'package:video_player/video_player.dart';

class v_k extends StatelessWidget {
  const v_k({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Video Player"),
      ),
      body: ListView(
        children: [
          ...Data_Vidoe.n[Data_Vidoe.i].map(
            (e) => voide_player_flutter(
                url:
                    "${e}"),
          ),
        ],
      ),
    );
  }
}

class voide_player_flutter extends StatefulWidget {
  voide_player_flutter({
    super.key,
    required this.url,
  });

  final String url;

  @override
  State<voide_player_flutter> createState() => _voide_player_flutterState();
}

class _voide_player_flutterState extends State<voide_player_flutter> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  tovideo() async {
    _controller = VideoPlayerController.network(widget.url);
    // await _controller.initialize();
    // setState(() {});
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 16 / 9,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tovideo();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Chewie(controller: _chewieController),
        ),
      ],
    );
  }
}
