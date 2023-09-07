import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/common/widgets/nav_tab.dart';
import 'package:thread_clone/constants/breakpoints.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/home/screens/comment_screen.dart';
import 'package:thread_clone/features/home/screens/home_screen.dart';
import 'package:thread_clone/common/widgets/ProfileCircleImage.dart';
import 'package:thread_clone/features/post/views/widgets/post_thread.dart';
import 'package:thread_clone/features/profile/screens/profile_screen.dart';
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
        return const PostThread();
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
            offstage: _selectedIndex != 3,
            // child: const ActivityScreen(),
            child: const CommentScreen(),
          ),
          Offstage(offstage: _selectedIndex != 4, child: const ProfileScreen()),
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
