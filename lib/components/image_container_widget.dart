import 'package:flutter/material.dart';

class ImageContainerWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color bgColor;
  final String url;

  const ImageContainerWidget({
    Key? key,
    this.width = 50,
    this.height = 50,
    this.bgColor = const Color(0xFFEEEEEE),
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        image: url.contains("http")
            ? DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
                alignment: FractionalOffset.center,
              )
            : null,
      ),
    );
  }
}
