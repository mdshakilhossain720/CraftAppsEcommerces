
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachNetworkImage extends StatelessWidget {
  const CachNetworkImage({super.key, required this.url,  this.height,this.width});
  final String url;
  final double? height;
  final double? width;


  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:url,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.scaleDown,
              colorFilter:
              ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
