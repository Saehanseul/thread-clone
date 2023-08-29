import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/common/widgets/nav_tab.dart';
import 'package:thread_clone/constants/breakpoints.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/etc/screens/etc_screen.dart';
import 'package:thread_clone/features/home/screens/home_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드 올라와도 리사이즈 되서 찌그러지는 것 방지
      backgroundColor: Colors.white,
      body: Stack(children: [
        Offstage(
          offstage: _selectedIndex != 0,
          child: const HomeScreen(),
        ),
        Offstage(
          offstage: _selectedIndex != 1,
          child: const EtcScreen("Search screen"),
        ),
        Offstage(
          offstage: _selectedIndex != 2,
          child: const EtcScreen("Write screen"),
        ),
        Offstage(
          offstage: _selectedIndex != 3,
          child: const EtcScreen("Like screen"),
        ),
        Offstage(
          offstage: _selectedIndex != 4,
          child: const EtcScreen("Profile screen"),
        ),
      ]),
      bottomNavigationBar: Container(
        color: Colors.amber,
        constraints: const BoxConstraints(maxWidth: Breakpoints.sm),
        child: BottomAppBar(
          color: Colors.white,
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
                  onTab: () => _onTap(2),
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
