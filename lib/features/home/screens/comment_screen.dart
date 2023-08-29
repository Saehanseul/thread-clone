import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/home/widgets/CommentItem.dart';

class CommentScreen extends ConsumerStatefulWidget {
  static const String routeURL = "/comment";

  const CommentScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommentScreenState();
}

class _CommentScreenState extends ConsumerState<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "스레드",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leadingWidth: 65,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Container(
            width: 65,
            padding: const EdgeInsets.only(
              left: Sizes.size20,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  color: Colors.black,
                  size: Sizes.size16,
                ),
                Text(
                  "뒤로",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Sizes.size16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Divider(),
            Gaps.v5,
            CommentItem(
              contentText: "Drop a comment here to test things out.",
              nickname: "tropicalseductions",
              likeCount: 4,
              replayCount: 2,
              time: "2m",
            ),
            Gaps.v10,
            Divider(),
            Gaps.v5,
            CommentItem(
              contentText:
                  "my phone feels like a vibrator with all these notifications rn",
              nickname: "shityoushouldcareabout",
              likeCount: 631,
              replayCount: 64,
              time: "4m",
            ),
            Gaps.v10,
            Divider(),
            Gaps.v5,
            CommentItem(
              contentText:
                  "If you're reading this, go water that thirsty plant. You're welcome",
              nickname: "_plantswithkrystal_",
              likeCount: 74,
              replayCount: 8,
              time: "2h",
            ),
            Gaps.v10,
            Divider(),
            Gaps.v5,
            CommentItem(
              nickname: "terracottacoco",
              likeCount: 74,
              replayCount: 8,
              time: "2h",
              imageUrlList: ["assets/images/image1.jpeg"],
            ),
            Gaps.v44,
          ],
        ),
      ),
    );
  }
}
