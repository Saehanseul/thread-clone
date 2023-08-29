import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/home/widgets/ProfileAdd.dart';
import 'package:thread_clone/features/home/widgets/ProfileCircleImage.dart';

class ThreadItem extends StatelessWidget {
  final String contentText;
  final List<String>? imageUrlList;
  final String nickname;

  const ThreadItem({
    super.key,
    required this.contentText,
    this.imageUrlList,
    required this.nickname,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
      width: MediaQuery.of(context).size.width,
      // decoration: const BoxDecoration(color: Colors.blue),
      child: IntrinsicHeight(
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                // cotainer A
                // decoration: const BoxDecoration(color: Colors.green),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const ProfileAdd(),
                    Expanded(
                      child: VerticalDivider(
                        width: Sizes.size3,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const ProfileCircleImage(
                      url: "assets/images/profile_image1.jpeg",
                      size: Sizes.size16,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                // container B
                // decoration: const BoxDecoration(color: Colors.yellow),
                padding: const EdgeInsets.only(
                  top: Sizes.size5,
                  left: Sizes.size10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          nickname,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: Sizes.size16,
                          ),
                        ),
                        Gaps.h5,
                        const Image(
                          image: AssetImage(
                            "assets/images/badge.png",
                          ),
                          width: Sizes.size16,
                          height: Sizes.size16,
                        ),
                        const Spacer(),
                        Text(
                          "2m",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: Sizes.size16,
                          ),
                        ),
                        Gaps.h16,
                        const FaIcon(
                          FontAwesomeIcons.ellipsis,
                          color: Colors.black,
                          size: Sizes.size20,
                        ),
                      ],
                    ),
                    Gaps.v10,
                    Text(
                      contentText,
                      style: const TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    ),
                    if (imageUrlList != null && imageUrlList!.length == 1)
                      Gaps.v16,
                    if (imageUrlList != null && imageUrlList!.length == 1)
                      Container(
                        width: 300,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.size10),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(imageUrlList![0]),
                          ),
                        ),
                      ),
                    if (imageUrlList != null && imageUrlList!.length > 1)
                      Container(
                        margin: const EdgeInsets.only(top: Sizes.size16),
                        height: 200,
                        child: ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: imageUrlList!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 250,
                                height: 150,
                                margin: const EdgeInsets.only(
                                  right: Sizes.size10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Sizes.size10),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(imageUrlList![index]),
                                  ),
                                ),
                              );
                            }),
                      ),
                    Gaps.v16,
                    const Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.heart,
                          size: Sizes.size20,
                        ),
                        Gaps.h20,
                        FaIcon(
                          FontAwesomeIcons.comment,
                          size: Sizes.size20,
                        ),
                        Gaps.h20,
                        FaIcon(
                          FontAwesomeIcons.rotate,
                          size: Sizes.size20,
                        ),
                        Gaps.h20,
                        FaIcon(
                          FontAwesomeIcons.paperPlane,
                          size: Sizes.size20,
                        ),
                      ],
                    ),
                    Gaps.v16,
                    Row(
                      children: [
                        Text(
                          "36 replies • 391 likes",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
