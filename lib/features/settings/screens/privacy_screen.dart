import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';

class PrivacyScreen extends ConsumerStatefulWidget {
  static const String routeURL = "/privacy";

  const PrivacyScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends ConsumerState<PrivacyScreen> {
  bool isPrivateProfile = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy",
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
          SwitchListTile.adaptive(
              title: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.lock,
                    color: Colors.grey.shade800,
                  ),
                  Gaps.h28,
                  const Text("Private profile"),
                ],
              ),
              activeColor: Colors.grey.shade800,
              value: isPrivateProfile,
              onChanged: (value) {
                setState(() {
                  isPrivateProfile = !isPrivateProfile;
                });
              }),
          ListTile(
            title: const Text("Mentions"),
            leading: FaIcon(
              FontAwesomeIcons.at,
              color: Colors.grey.shade800,
            ),
            minLeadingWidth: Sizes.size32,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Everyone",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Gaps.h10,
                FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.grey.shade600,
                  size: Sizes.size16,
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text("Muted"),
            leading: FaIcon(
              FontAwesomeIcons.bellSlash,
              color: Colors.grey.shade800,
            ),
            minLeadingWidth: Sizes.size32,
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey.shade600,
              size: Sizes.size16,
            ),
          ),
          ListTile(
            title: const Text("Hidden Words"),
            leading: FaIcon(
              FontAwesomeIcons.eyeSlash,
              color: Colors.grey.shade800,
            ),
            minLeadingWidth: Sizes.size32,
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey.shade600,
              size: Sizes.size16,
            ),
          ),
          ListTile(
            title: const Text("Profiles you follow"),
            leading: FaIcon(
              FontAwesomeIcons.users,
              color: Colors.grey.shade800,
            ),
            minLeadingWidth: Sizes.size32,
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey.shade600,
              size: Sizes.size16,
            ),
          ),
          const Divider(),
          Column(
            children: [
              ListTile(
                title: const Text(
                  "Other privacy settings",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.arrowUpRightFromSquare,
                  color: Colors.grey.shade600,
                  size: Sizes.size16,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: Sizes.size16,
                  right: Sizes.size20,
                ),
                child: Text(
                  "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            title: const Text(
              "Blocked profiles",
            ),
            leading: FaIcon(
              FontAwesomeIcons.circleXmark,
              color: Colors.grey.shade800,
            ),
            minLeadingWidth: Sizes.size32,
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              color: Colors.grey.shade600,
              size: Sizes.size16,
            ),
          ),
          ListTile(
            title: const Text(
              "Hide likes",
            ),
            leading: FaIcon(
              FontAwesomeIcons.heartCircleXmark,
              color: Colors.grey.shade800,
            ),
            minLeadingWidth: Sizes.size32,
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              color: Colors.grey.shade600,
              size: Sizes.size16,
            ),
          ),
        ],
      ),
    );
  }
}
