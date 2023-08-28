import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/home/widgets/ProfileCircleImage.dart';

class ProfileAdd extends StatelessWidget {
  const ProfileAdd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ProfileCircleImage(
          url: 'assets/images/profile_image1.jpeg',
          size: Sizes.size44,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.all(Sizes.size2),
            decoration: BoxDecoration(
              border: Border.all(
                width: Sizes.size3,
                color: Colors.white,
              ),
              color: Colors.black,
              borderRadius: BorderRadius.circular(Sizes.size20),
            ),
            child: const FaIcon(
              FontAwesomeIcons.plus,
              size: Sizes.size14,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
