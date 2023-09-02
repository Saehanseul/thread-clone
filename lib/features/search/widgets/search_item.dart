import 'package:flutter/material.dart';
import 'package:thread_clone/common/widgets/ProfileCircleImage.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Sizes.size16,
        bottom: Sizes.size16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileCircleImage(
            url: 'assets/images/profile_image1.jpeg',
            size: Sizes.size36,
            margin: Sizes.size1,
          ),
          Gaps.h16,
          Container(
            child: Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  right: Sizes.size16,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: Sizes.size1,
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(children: [
                          Text(
                            'username',
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Gaps.h5,
                          Image(
                            image: AssetImage(
                              "assets/images/badge.png",
                            ),
                            width: Sizes.size16,
                            height: Sizes.size16,
                          ),
                        ]),
                        Gaps.v4,
                        Text(
                          'nickname',
                          style: TextStyle(
                            fontSize: Sizes.size14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Gaps.v10,
                        const Text(
                          '26.6k followers',
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gaps.v10,
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size20,
                        vertical: Sizes.size4,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: Sizes.size1,
                          color: Colors.grey.shade400,
                        ),
                        borderRadius: BorderRadius.circular(Sizes.size10),
                      ),
                      child: const Text(
                        'Follow',
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
