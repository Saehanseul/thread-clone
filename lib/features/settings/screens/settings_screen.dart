import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/settings/screens/privacy_screen.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  static const String routeURL = "/settings";

  const SettingsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leadingWidth: 70,
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
                  "Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Sizes.size16,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.shade200,
            height: 1.0,
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Follow and invite friends"),
            leading: FaIcon(
              FontAwesomeIcons.userPlus,
              color: Colors.grey.shade800,
            ),
            minLeadingWidth: Sizes.size28 + Sizes.size2,
          ),
          ListTile(
            title: const Text("Notifications"),
            leading: FaIcon(
              FontAwesomeIcons.bell,
              color: Colors.grey.shade800,
            ),
            minLeadingWidth: Sizes.size28 + Sizes.size2,
          ),
          ListTile(
            onTap: () => context.push(PrivacyScreen.routeURL),
            title: const Text("Privacy"),
            leading: FaIcon(
              FontAwesomeIcons.lock,
              color: Colors.grey.shade800,
            ),
            minLeadingWidth: Sizes.size28 + Sizes.size2,
          ),
          ListTile(
            title: const Text("Account"),
            leading: FaIcon(
              FontAwesomeIcons.circleUser,
              color: Colors.grey.shade800,
            ),
            minLeadingWidth: Sizes.size28 + Sizes.size2,
          ),
          ListTile(
            title: const Text("Help"),
            leading: FaIcon(
              FontAwesomeIcons.circleQuestion,
              color: Colors.grey.shade800,
            ),
            minLeadingWidth: Sizes.size28 + Sizes.size2,
          ),
          ListTile(
            title: const Text("About"),
            leading: FaIcon(
              FontAwesomeIcons.circleInfo,
              color: Colors.grey.shade800,
            ),
            minLeadingWidth: Sizes.size28 + Sizes.size2,
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Log out(ios - cupertino)',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onTap: () => showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: const Text('Log out'),
                content: const Text('Are you sure you want to log out?'),
                actions: [
                  CupertinoDialogAction(
                    child: const Text('Cancel'),
                    onPressed: () => context.pop(),
                  ),
                  CupertinoDialogAction(
                    child: const Text('Log out'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Log out(android - alert)',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onTap: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Log out'),
                content: const Text('Are you sure you want to log out?'),
                actions: [
                  TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Log out'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
