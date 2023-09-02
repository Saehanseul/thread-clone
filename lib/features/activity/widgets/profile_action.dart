import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/common/widgets/ProfileCircleImage.dart';

class ProfileAction extends StatelessWidget {
  final String type;
  const ProfileAction({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ProfileCircleImage(
          url: 'assets/images/profile_image1.jpeg',
          size: Sizes.size36,
        ),
        if (type == 'mention')
          Positioned(
            right: 0,
            bottom: 3,
            child: Container(
              padding: const EdgeInsets.all(Sizes.size2),
              decoration: BoxDecoration(
                border: Border.all(
                  width: Sizes.size2,
                  color: Colors.white,
                ),
                color: Colors.green,
                borderRadius: BorderRadius.circular(Sizes.size20),
              ),
              child: const FaIcon(
                FontAwesomeIcons.dribbble,
                size: Sizes.size10,
                color: Colors.white,
              ),
            ),
          ),
        if (type == 'like')
          Positioned(
            right: 0,
            bottom: 3,
            child: Container(
              padding: const EdgeInsets.all(Sizes.size2),
              decoration: BoxDecoration(
                border: Border.all(
                  width: Sizes.size2,
                  color: Colors.white,
                ),
                color: Colors.pink,
                borderRadius: BorderRadius.circular(Sizes.size20),
              ),
              child: const FaIcon(
                FontAwesomeIcons.heart,
                size: Sizes.size10,
                color: Colors.white,
              ),
            ),
          ),
        if (type == 'share')
          Positioned(
            right: 0,
            bottom: 3,
            child: Container(
              padding: const EdgeInsets.all(Sizes.size2),
              decoration: BoxDecoration(
                border: Border.all(
                  width: Sizes.size2,
                  color: Colors.white,
                ),
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(Sizes.size20),
              ),
              child: const FaIcon(
                FontAwesomeIcons.share,
                size: Sizes.size10,
                color: Colors.white,
              ),
            ),
          ),
        if (type == 'follow')
          Positioned(
            right: 0,
            bottom: 3,
            child: Container(
              padding: const EdgeInsets.all(Sizes.size2),
              decoration: BoxDecoration(
                border: Border.all(
                  width: Sizes.size2,
                  color: Colors.white,
                ),
                color: Colors.purple.shade900,
                borderRadius: BorderRadius.circular(Sizes.size20),
              ),
              child: const FaIcon(
                FontAwesomeIcons.user,
                size: Sizes.size10,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}
