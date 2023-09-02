import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/activity/widgets/activity_item.dart';
import 'package:thread_clone/features/activity/widgets/tab_item.dart';

class ActivityScreen extends ConsumerStatefulWidget {
  const ActivityScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends ConsumerState<ActivityScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v16,
            const Padding(
              padding: EdgeInsets.only(
                left: Sizes.size16,
              ),
              child: Text(
                'Activity',
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Gaps.v16,
            TabBar(
              onTap: (index) {
                setState(() {
                  currentTabIndex = index;
                });
              },
              labelPadding: const EdgeInsets.symmetric(
                horizontal: Sizes.size4,
              ),
              isScrollable: true,
              controller: _tabController,
              indicator: null,
              indicatorSize: null,
              indicatorColor: Colors.transparent,
              tabs: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: Sizes.size16,
                  ),
                  child: TabItem(
                    title: 'All',
                    isActive: currentTabIndex == 0,
                  ),
                ),
                TabItem(
                  title: 'Replies',
                  isActive: currentTabIndex == 1,
                ),
                TabItem(
                  title: 'Mentions',
                  isActive: currentTabIndex == 2,
                ),
                TabItem(
                  title: 'Verifies',
                  isActive: currentTabIndex == 3,
                ),
                TabItem(
                  title: 'Reposts',
                  isActive: currentTabIndex == 4,
                ),
                TabItem(
                  title: 'Follows',
                  isActive: currentTabIndex == 5,
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  Column(
                    children: [
                      Gaps.v10,
                      ActivityItem(
                        hour: "4h",
                        secondText: "Metioned you",
                        thirdText:
                            "Here's a thread you should follow if you love botany @jane_mobbin",
                        type: 'mention',
                      ),
                      ActivityItem(
                        hour: "4h",
                        secondText:
                            "Starting out my gardening club with thr...",
                        thirdText: "Count me in!",
                        type: 'share',
                      ),
                      ActivityItem(
                        hour: "4h",
                        secondText: "Followed you",
                        type: 'follow',
                      ),
                      ActivityItem(
                        hour: "5h",
                        secondText: "Definitely broken!💚",
                        type: 'like',
                      ),
                      ActivityItem(
                        hour: "5h",
                        secondText: "💚",
                        type: 'like',
                      ),
                    ],
                  ),
                  const Text('Replies'),
                  const Text('Mentions'),
                  const Text('Verifies'),
                  const Text('Reposts'),
                  const Text('Follows'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
