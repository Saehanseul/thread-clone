import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/home/screens/comment_screen.dart';
import 'package:thread_clone/common/widgets/ProfileCircleImage.dart';

class ProfileReplyItem extends StatelessWidget {
  final String? contentText;
  final String? replyText;
  final List<String>? imageUrlList;
  final String nickname;
  final int replayCount;
  final int likeCount;
  final String time;

  const ProfileReplyItem({
    super.key,
    this.contentText,
    this.imageUrlList,
    required this.nickname,
    required this.replayCount,
    required this.likeCount,
    required this.time,
    this.replyText,
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
                    const ProfileCircleImage(
                      url: "assets/images/profile_image1.jpeg",
                      size: Sizes.size36,
                    ),
                    Gaps.v10,
                    Expanded(
                      child: VerticalDivider(
                        width: Sizes.size3,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    Gaps.v10,
                    const ProfileCircleImage(
                      url: "assets/images/profile_image1.jpeg",
                      size: Sizes.size40,
                    ),
                    Gaps.v32,
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
                          time,
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
                    if (contentText != null) Gaps.v10,
                    if (contentText != null)
                      Text(
                        contentText!,
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
                    if (replayCount > 0 || likeCount > 0)
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => context.push(CommentScreen.routeURL),
                            child: Text(
                              "$replayCount replies",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: Sizes.size16,
                              ),
                            ),
                          ),
                          Text(
                            " • ",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: Sizes.size16,
                            ),
                          ),
                          Text(
                            "$likeCount likes",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: Sizes.size16,
                            ),
                          ),
                        ],
                      ),
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
                          time,
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
                    if (replyText != null) Gaps.v10,
                    if (replyText != null)
                      Text(
                        replyText!,
                        style: const TextStyle(
                          fontSize: Sizes.size16,
                        ),
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
                    Gaps.v10,
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
