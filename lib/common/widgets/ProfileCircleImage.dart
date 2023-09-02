import 'package:flutter/material.dart';
import 'package:thread_clone/constants/sizes.dart';

class ProfileCircleImage extends StatelessWidget {
  final String url;
  final double size;
  final double margin;
  const ProfileCircleImage({
    super.key,
    required this.url,
    required this.size,
    this.margin = Sizes.size5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(url),
        ),
      ),
    );
  }
}
