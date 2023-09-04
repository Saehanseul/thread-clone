import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/common/widgets/ProfileCircleImage.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/profile/widgets/persistent_tab_bar.dart';
import 'package:thread_clone/features/profile/widgets/profile_reply_item.dart';
import 'package:thread_clone/features/profile/widgets/profile_thread_item.dart';
import 'package:thread_clone/features/settings/screens/settings_screen.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.globe,
                      color: Colors.black,
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.instagram,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () => context.push(SettingsScreen.routeURL),
                      icon: const FaIcon(
                        FontAwesomeIcons.bars,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size16,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Gaps.v16,
                                const Text(
                                  "Jane",
                                  style: TextStyle(
                                    fontSize: Sizes.size24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Gaps.v8,
                                Row(
                                  children: [
                                    const Text("jane mobbin"),
                                    Gaps.h5,
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: Sizes.size8,
                                        vertical: Sizes.size6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(
                                          Sizes.size14,
                                        ),
                                      ),
                                      child: const Text(
                                        "threads.net",
                                        style: TextStyle(
                                          fontSize: Sizes.size12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Gaps.v16,
                                const Text("Plant enthusiast!"),
                                Gaps.v16,
                                Row(
                                  children: [
                                    Text(
                                      "2 followers",
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const ProfileCircleImage(
                              url: 'assets/images/profile_image1.jpeg',
                              size: Sizes.size72,
                            ),
                          ],
                        ),
                        Gaps.v16,
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                  vertical: Sizes.size8,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: Sizes.size1,
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size8,
                                  ),
                                ),
                                child: const Text(
                                  "Edit profile",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Gaps.h10,
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                  vertical: Sizes.size8,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: Sizes.size1,
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size8,
                                  ),
                                ),
                                child: const Text(
                                  "Share profile",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gaps.v10,
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: PersistentTabBar(),
                  pinned: true,
                ),
              ];
            },
            body: const TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Gaps.v16,
                      ProfileThreadItem(
                        contentText:
                            "Give @john_mobbin a follow if you want to see more travel content!",
                        nickname: "jane_mobbin",
                        replayCount: 0,
                        likeCount: 0,
                        time: "2h",
                      ),
                      Divider(),
                      ProfileThreadItem(
                        contentText:
                            "Give @john_mobbin a follow if you want to see more travel content!",
                        nickname: "jane_mobbin",
                        replayCount: 0,
                        likeCount: 0,
                        time: "2h",
                      ),
                      Divider(),
                      ProfileThreadItem(
                        contentText:
                            "Give @john_mobbin a follow if you want to see more travel content!",
                        nickname: "jane_mobbin",
                        replayCount: 0,
                        likeCount: 0,
                        time: "2h",
                      ),
                      Divider(),
                      ProfileThreadItem(
                        contentText:
                            "Give @john_mobbin a follow if you want to see more travel content!",
                        nickname: "jane_mobbin",
                        replayCount: 0,
                        likeCount: 0,
                        time: "2h",
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Gaps.v16,
                      ProfileReplyItem(
                        nickname: "john_mobbin",
                        contentText:
                            "Always a dream to see the Medina in Morocco!",
                        replyText: "See you there!",
                        replayCount: 0,
                        likeCount: 0,
                        time: '2h',
                      ),
                      Divider(),
                      ProfileReplyItem(
                        nickname: "john_mobbin",
                        contentText:
                            "Always a dream to see the Medina in Morocco!",
                        replyText: "See you there!",
                        replayCount: 0,
                        likeCount: 0,
                        time: '2h',
                      ),
                      Divider(),
                      ProfileReplyItem(
                        nickname: "john_mobbin",
                        contentText:
                            "Always a dream to see the Medina in Morocco!",
                        replyText: "See you there!",
                        replayCount: 0,
                        likeCount: 0,
                        time: '2h',
                      ),
                      Divider(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
