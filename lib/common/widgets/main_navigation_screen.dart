import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/common/widgets/nav_tab.dart';
import 'package:thread_clone/constants/breakpoints.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/activity/screens/activity_screen.dart';
import 'package:thread_clone/features/etc/screens/etc_screen.dart';
import 'package:thread_clone/features/home/screens/home_screen.dart';
import 'package:thread_clone/common/widgets/ProfileCircleImage.dart';
import 'package:thread_clone/features/search/screens/search_screen.dart';
import 'package:thread_clone/utils.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = "mainNavigation";

  final String tab;

  const MainNavigationScreen({super.key, required this.tab});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    "home",
    "discover",
    "write",
    "heart",
    "profile",
  ];

  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  void onWritingTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        String text = '';
        return StatefulBuilder(
          builder: (context, setState) {
            return FractionallySizedBox(
              heightFactor: 0.9,
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(Sizes.size16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(
                                      fontSize: Sizes.size16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'New Thread',
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size16,
                            ),
                            child: Column(
                              children: [
                                const ProfileCircleImage(
                                  url: "assets/images/profile_image1.jpeg",
                                  size: Sizes.size48,
                                ),
                                Gaps.v10,
                                SizedBox(
                                  height: Sizes.size96,
                                  child: VerticalDivider(
                                    thickness: 2,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                Gaps.v10,
                                const Opacity(
                                  opacity: 0.5,
                                  child: ProfileCircleImage(
                                    url: "assets/images/profile_image1.jpeg",
                                    size: Sizes.size24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 300,
                            width: MediaQuery.of(context).size.width - 110,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: Sizes.size16,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "jane_mobbin",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // Gaps.v20,
                                  TextField(
                                    onChanged: (value) {
                                      print(value);
                                      setState(() {
                                        text = value;
                                      });
                                    },
                                    autofocus: true,
                                    decoration: const InputDecoration(
                                      hintText: 'Start a thread...',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                  Gaps.v10,
                                  const FaIcon(
                                    FontAwesomeIcons.paperclip,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(), // Pushes the button to the bottom
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size16,
                            vertical: Sizes.size16,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Anyone can reply",
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "Post",
                                style: TextStyle(
                                  color: text.isNotEmpty
                                      ? Colors.blue
                                      : Colors.blue.shade200,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.size16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드 올라와도 리사이즈 되서 찌그러지는 것 방지
      backgroundColor: _selectedIndex == 0 || isDarkMode(context)
          ? Colors.black
          : Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const SearchScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: const EtcScreen("Write screen"),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const ActivityScreen(),
          ),
          Offstage(
              offstage: _selectedIndex != 4,
              child: const Column(
                children: [CupertinoSearchTextField()],
              )),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.amber,
        constraints: const BoxConstraints(maxWidth: Breakpoints.sm),
        child: BottomAppBar(
          color: isDarkMode(context) ? Colors.black : Colors.white,
          child: Padding(
            padding: const EdgeInsetsDirectional.all(Sizes.size12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavTab(
                  text: "Home",
                  icon: FontAwesomeIcons.house,
                  selectedIcon: FontAwesomeIcons.house,
                  isSelected: _selectedIndex == 0,
                  onTab: () => _onTap(0),
                  selectedIndex: _selectedIndex,
                ),
                NavTab(
                  text: "Discover",
                  icon: FontAwesomeIcons.magnifyingGlass,
                  selectedIcon: FontAwesomeIcons.magnifyingGlass,
                  isSelected: _selectedIndex == 1,
                  onTab: () => _onTap(1),
                  selectedIndex: _selectedIndex,
                ),
                NavTab(
                  text: "write",
                  icon: FontAwesomeIcons.penToSquare,
                  selectedIcon: FontAwesomeIcons.penToSquare,
                  isSelected: _selectedIndex == 2,
                  onTab: () => onWritingTap(context),
                  selectedIndex: _selectedIndex,
                ),
                NavTab(
                  text: "heart",
                  icon: FontAwesomeIcons.heart,
                  selectedIcon: FontAwesomeIcons.solidHeart,
                  isSelected: _selectedIndex == 3,
                  onTab: () => _onTap(3),
                  selectedIndex: _selectedIndex,
                ),
                NavTab(
                  text: "Profile",
                  icon: FontAwesomeIcons.user,
                  selectedIcon: FontAwesomeIcons.solidUser,
                  isSelected: _selectedIndex == 4,
                  onTab: () => _onTap(4),
                  selectedIndex: _selectedIndex,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
