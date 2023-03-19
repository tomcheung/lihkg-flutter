import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lihkg_flutter/core/route/navigator/lihkg_root_navigator.dart';
import 'package:lihkg_flutter/screen/thread_content/image_size_cache_provider.dart';
import 'package:provider/provider.dart';

class CachedSizeImage extends ConsumerStatefulWidget {
  final NetworkImage imageProvider;

  const CachedSizeImage({Key? key, required this.imageProvider})
      : super(key: key);

  @override
  ConsumerState createState() => _CachedSizeImageState();
}

class _CachedSizeImageState extends ConsumerState<CachedSizeImage> {
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
    _imageStream = widget.imageProvider.resolve(const ImageConfiguration());
    if (_imageStream?.key != oldImageStream?.key) {
      final listener = ImageStreamListener(_updateImage);
      _imageStream?.removeListener(listener);
      _imageStream?.addListener(listener);
    }
  }

  void _updateImage(ImageInfo imageInfo, bool synchronousCall) {
    final imageSizeNotifier = ref.read(imageSizeCacheProvider.notifier);
    final info = _imageInfo;
    if (info != null) {
      imageSizeNotifier.updateSize(
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

  Widget _buildImageContent(BuildContext context) {
    final image = Hero(
      tag: widget.imageProvider,
      child: RawImage(
        image: _imageInfo?.image,
        scale: _imageInfo?.scale ?? 0,
        width: 600,
      ),
    );

    final imageInfo = _imageInfo;
    Size? imageSize;

    imageSize = ref.read(imageSizeCacheProvider
        .select((sizeMap) => sizeMap[widget.imageProvider.url]));

    if (imageSize == null && imageInfo != null) {
      imageSize = Size(
        imageInfo.image.width.toDouble(),
        imageInfo.image.height.toDouble(),
      );
    }

    if (imageSize == null) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(),
        ),
      );
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: imageSize.height,
        maxWidth: imageSize.width,
      ),
      child: AspectRatio(
        aspectRatio: imageSize.width / imageSize.height,
        child: image,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<LihkgRootNavigatorProvider>()
            .showFullscreenImage(widget.imageProvider);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildImageContent(context),
      ),
    );
  }
}
