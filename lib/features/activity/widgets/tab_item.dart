import 'package:flutter/material.dart';
import 'package:thread_clone/constants/sizes.dart';

class TabItem extends StatelessWidget {
  final String title;
  final bool isActive;
  const TabItem({
    super.key,
    required this.title,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: Sizes.size96,
      height: Sizes.size36,
      decoration: BoxDecoration(
        border: Border.all(
          width: Sizes.size1,
          color: isActive ? Colors.black : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(
          Sizes.size8,
        ),
        color: isActive ? Colors.black : Colors.white,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
          fontSize: Sizes.size16,
        ),
      ),
    );
  }
}
