import 'package:flutter/material.dart';
import 'package:lihkg_flutter/screen/thread_content/image_size_cache_provider.dart';
import 'package:provider/provider.dart';

class CachedSizeImage extends StatefulWidget {
  final NetworkImage imageProvider;

  const CachedSizeImage({Key? key, required this.imageProvider})
      : super(key: key);

  @override
  _CachedSizeImageState createState() => _CachedSizeImageState();
}

class _CachedSizeImageState extends State<CachedSizeImage> {
  ImageStream? _imageStream;
  ImageInfo? _imageInfo;

  @override
  void didUpdateWidget(covariant CachedSizeImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.imageProvider != oldWidget.imageProvider) {
      _getImage();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getImage();
  }

  void _getImage() {
    final oldImageStream = _imageStream;
    _imageStream = widget.imageProvider.resolve(new ImageConfiguration());
    if (_imageStream?.key != oldImageStream?.key) {
      final listener = ImageStreamListener(_updateImage);
      _imageStream?.removeListener(listener);
      _imageStream?.addListener(listener);
    }
  }

  void _updateImage(ImageInfo imageInfo, bool synchronousCall) {
    final imageSizeProvider = context.read<ImageSizeCacheProvider>();
    final info = _imageInfo;
    if (info != null) {
      imageSizeProvider.updateSize(
        widget.imageProvider.url,
        Size(info.image.width.toDouble(), info.image.height.toDouble()),
      );
    }
    setState(() {
      _imageInfo?.dispose();
      _imageInfo = imageInfo;
    });
  }

  @override
  void dispose() {
    _imageStream?.removeListener(ImageStreamListener(_updateImage));
    _imageInfo?.dispose();
    _imageInfo = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final image = RawImage(
      image: _imageInfo?.image,
      scale: _imageInfo?.scale ?? 0,
      width: 600,
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(builder: (context, constraints) {
        final imageInfo = _imageInfo;
        Size? size;

        if (imageInfo != null) {
          size = Size(
            imageInfo.image.width.toDouble(),
            imageInfo.image.height.toDouble(),
          );
        } else {
          final imageSizeProvider = context.read<ImageSizeCacheProvider>();
          size = imageSizeProvider.getSize(widget.imageProvider.url);
        }

        if (size == null) {
          return const Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (size.width > constraints.maxWidth) {
          size = Size(
            constraints.maxWidth,
            constraints.maxWidth / size.width * size.height,
          );
        }

        return SizedBox(
          width: size.width,
          height: size.height,
          child: image,
        );
      }),
    );
  }
}
