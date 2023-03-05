import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenImageView extends StatefulWidget {
  final ImageProvider<Object> imageProvider;

  const FullScreenImageView({Key? key, required this.imageProvider})
      : super(key: key);

  @override
  State<FullScreenImageView> createState() => _FullScreenImageViewState();
}

class _FullScreenImageViewState extends State<FullScreenImageView> {
  late PhotoViewController controller;

  @override
  void initState() {
    controller = PhotoViewController();
    super.initState();
  }

  Widget _buildZoomSlider(BuildContext context) {
    return SafeArea(
      child: Align(
        child: SizedBox(
            width: 300,
            height: 50,
            child: StreamBuilder<PhotoViewControllerValue>(
              stream: controller.outputStateStream,
              initialData: controller.value,
              builder: (context, snapshot) {
                if (snapshot.hasError || snapshot.data == null) {
                  return Container();
                }
                return Slider(
                  value: snapshot.data?.scale ?? 1,
                  min: 0.1,
                  max: 5,
                  onChanged: (v) {
                    controller.scale = v;
                  },
                );
              },
            )),
        alignment: Alignment.bottomCenter,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = {
      TargetPlatform.macOS,
      TargetPlatform.linux,
      TargetPlatform.windows
    }.contains(Theme.of(context).platform);

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            PhotoView(
              controller: controller,
              imageProvider: widget.imageProvider,
              heroAttributes:
                  PhotoViewHeroAttributes(tag: widget.imageProvider),
            ),
            SafeArea(
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.clear,
                  color: Colors.white,
                  shadows: [Shadow(color: Colors.black, blurRadius: 5)],
                ),
              ),
            ),
            if (isDesktop)
              _buildZoomSlider(context)
          ],
        ),
      ),
    );
  }
}
