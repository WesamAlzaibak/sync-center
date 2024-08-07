
import 'package:flutter/material.dart';

class SyncNetworkImageWithoutWidth extends StatelessWidget {
  const SyncNetworkImageWithoutWidth({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.fit,
  });

  final String imageUrl;
  final double height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
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
