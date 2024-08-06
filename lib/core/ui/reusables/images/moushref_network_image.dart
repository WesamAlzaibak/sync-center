import 'package:flutter/material.dart';

class SyncNetworkImage extends StatelessWidget {
  const SyncNetworkImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.fit,
  });

  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, _, stacktrace) {
        return Image.asset("assets/images/image_placeholder.png");
      },
      loadingBuilder: (context, widget, chunk) {
        if(chunk?.cumulativeBytesLoaded != chunk?.expectedTotalBytes) {
          return Image.asset("assets/images/loading_image.jpg");
        }
        else {
          return widget;
        }
      },
    );
  }
}
