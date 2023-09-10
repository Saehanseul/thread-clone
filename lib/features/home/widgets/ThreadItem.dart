import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/home/screens/comment_screen.dart';
import 'package:thread_clone/features/home/widgets/ProfileAdd.dart';
import 'package:thread_clone/features/home/widgets/ProfileCircleRoundImage.dart';
import 'package:thread_clone/utils.dart';

class ThreadItem extends StatelessWidget {
  final String contentText;
  final List<String>? imageUrlList;
  final String nickname;
  final int replayCount;
  final int likeCount;
  final String time;
  final int commentProfileCount;

  const ThreadItem({
    super.key,
    required this.contentText,
    this.imageUrlList,
    required this.nickname,
    required this.replayCount,
    required this.likeCount,
    required this.time,
    this.commentProfileCount = 1,
  });

  /// onReportTap
  /// 신고하기를 눌렀을 때
  /// drag되는 showbottomSheet을 띄운다.
  void _onReportTap(BuildContext context) {
    Navigator.pop(context);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.size16),
          topRight: Radius.circular(Sizes.size16),
        ),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          maxChildSize: 0.9,
          initialChildSize: 0.6,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  expandedHeight: 230.0,
                  pinned: true,
                  floating: false,
                  leading: null,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size10,
                              ),
                              child: Container(
                                width: Sizes.size40,
                                height: Sizes.size4,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius:
                                      BorderRadius.circular(Sizes.size2),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Sizes.size16,
                            ),
                            child: Text(
                              "Report",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: Sizes.size18,
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey.shade400,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: Sizes.size16,
                            left: Sizes.size16,
                            right: Sizes.size16,
                            bottom: Sizes.size10,
                          ),
                          child: Text(
                            "Why are you reporting this thread?",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size16,
                          ),
                          child: Text(
                            "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: Sizes.size16,
                            ),
                          ),
                        ),
                        Gaps.v16,
                      ],
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) => const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      ListTile(
                        title: Text(
                          "I just don't like it",
                          style: TextStyle(),
                        ),
                        trailing: FaIcon(
                          FontAwesomeIcons.chevronRight,
                          size: Sizes.size16,
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      ListTile(
                        title: Text(
                          "It's unlawful content under NetzDG",
                          style: TextStyle(),
                        ),
                        trailing: FaIcon(
                          FontAwesomeIcons.chevronRight,
                          size: Sizes.size16,
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      ListTile(
                        title: Text(
                          "It's spam",
                          style: TextStyle(),
                        ),
                        trailing: FaIcon(
                          FontAwesomeIcons.chevronRight,
                          size: Sizes.size16,
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      ListTile(
                        title: Text(
                          "Hate speech or symbols",
                          style: TextStyle(),
                        ),
                        trailing: FaIcon(
                          FontAwesomeIcons.chevronRight,
                          size: Sizes.size16,
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            );
          },
        );
      },
    );
  }

  /// bottomSheet을 여는 함수
  void onOptionTap(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.size16),
          topRight: Radius.circular(Sizes.size16),
        ),
      ),
      builder: (context) {
        return SizedBox(
          height: 350,
          child: Padding(
            padding: const EdgeInsets.only(
              left: Sizes.size16,
              right: Sizes.size16,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size10,
                      ),
                      child: Container(
                        width: Sizes.size40,
                        height: Sizes.size4,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(Sizes.size2),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(Sizes.size20),
                  ),
                  child: const Column(
                    children: [
                      ListTile(
                        title: Text(
                          "Unfollow",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Divider(height: 1),
                      ListTile(
                        title: Text(
                          "Mute",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gaps.v16,
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(Sizes.size20),
                  ),
                  child: Column(
                    children: [
                      const ListTile(
                        title: Text(
                          "Hide",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Divider(height: 1),
                      GestureDetector(
                        onTap: () => _onReportTap(context),
                        child: const ListTile(
                          title: Text(
                            "Report",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
                    Gaps.v10,
                    Expanded(
                      child: VerticalDivider(
                        width: Sizes.size3,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    Gaps.v10,
                    if (commentProfileCount == 1)
                      Container(
                        width: Sizes.size48,
                        height: Sizes.size24,
                        decoration: const BoxDecoration(),
                        child: const Align(
                          alignment: Alignment.bottomCenter,
                          child: ProfileCircleRoundImage(
                            url: "assets/images/profile_image1.jpeg",
                            size: Sizes.size18,
                          ),
                        ),
                      ),
                    if (commentProfileCount == 2)
                      Container(
                        width: Sizes.size48,
                        height: Sizes.size24,
                        decoration: const BoxDecoration(),
                        child: const Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 5,
                              child: ProfileCircleRoundImage(
                                url: "assets/images/profile_image1.jpeg",
                                size: Sizes.size18,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 20,
                              child: ProfileCircleRoundImage(
                                url: "assets/images/profile_image1.jpeg",
                                size: Sizes.size18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (commentProfileCount >= 3)
                      Container(
                        width: Sizes.size56,
                        height: Sizes.size56,
                        decoration: const BoxDecoration(),
                        child: const Stack(
                          children: [
                            Positioned(
                              top: 0,
                              right: 0,
                              child: ProfileCircleRoundImage(
                                url: "assets/images/profile_image1.jpeg",
                                size: Sizes.size24,
                              ),
                            ),
                            Positioned(
                              top: 15,
                              left: 0,
                              child: ProfileCircleRoundImage(
                                url: "assets/images/profile_image1.jpeg",
                                size: Sizes.size18,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 20,
                              child: ProfileCircleRoundImage(
                                url: "assets/images/profile_image1.jpeg",
                                size: Sizes.size14,
                              ),
                            ),
                          ],
                        ),
                      )
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
                        GestureDetector(
                          onTap: () => onOptionTap(context),
                          child: FaIcon(
                            FontAwesomeIcons.ellipsis,
                            color: isDarkMode(context)
                                ? Colors.white
                                : Colors.black,
                            size: Sizes.size20,
                          ),
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
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.heart,
                          size: Sizes.size20,
                          color:
                              isDarkMode(context) ? Colors.white : Colors.black,
                        ),
                        Gaps.h20,
                        FaIcon(
                          FontAwesomeIcons.comment,
                          size: Sizes.size20,
                          color:
                              isDarkMode(context) ? Colors.white : Colors.black,
                        ),
                        Gaps.h20,
                        FaIcon(
                          FontAwesomeIcons.rotate,
                          size: Sizes.size20,
                          color:
                              isDarkMode(context) ? Colors.white : Colors.black,
                        ),
                        Gaps.h20,
                        FaIcon(
                          FontAwesomeIcons.paperPlane,
                          size: Sizes.size20,
                          color:
                              isDarkMode(context) ? Colors.white : Colors.black,
                        ),
                      ],
                    ),
                    Gaps.v16,
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
