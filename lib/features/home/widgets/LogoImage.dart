import 'package:flutter/material.dart';
import 'package:thread_clone/constants/sizes.dart';

class LogoImage extends StatelessWidget {
  final double size;
  const LogoImage({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Sizes.size5),
      width: size,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            "assets/images/logo.png",
          ),
        ),
      ),
    );
  }
}
