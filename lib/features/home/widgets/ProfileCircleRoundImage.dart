import 'package:flutter/material.dart';
import 'package:thread_clone/constants/sizes.dart';

class ProfileCircleRoundImage extends StatelessWidget {
  final String url;
  final double size;
  const ProfileCircleRoundImage({
    super.key,
    required this.url,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size),
        color: Colors.white,
      ),
      child: Container(
        margin: const EdgeInsets.all(Sizes.size3),
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(url),
          ),
        ),
      ),
    );
  }
}
