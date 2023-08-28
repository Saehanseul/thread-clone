import 'package:flutter/material.dart';
import 'package:thread_clone/constants/sizes.dart';

class ProfileCircleImage extends StatelessWidget {
  final String url;
  final double size;
  const ProfileCircleImage({
    super.key,
    required this.url,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Sizes.size5),
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
