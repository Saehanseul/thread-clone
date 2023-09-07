import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/common/widgets/ProfileCircleImage.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';

class PostThread extends ConsumerStatefulWidget {
  const PostThread({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostThreadState();
}

class _PostThreadState extends ConsumerState<PostThread> {
  String text = '';
  String? imagePath;

  @override
  Widget build(BuildContext context) {
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
                        // height: 300,
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
                                maxLines: null,
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
                              if (imagePath == null)
                                GestureDetector(
                                  onTap: () async {
                                    XFile? res =
                                        await context.push("/takePicture");
                                    if (res != null) {
                                      setState(() {
                                        imagePath = res.path;
                                      });
                                    }
                                  },
                                  child: const FaIcon(
                                    FontAwesomeIcons.paperclip,
                                    color: Colors.grey,
                                  ),
                                ),
                              if (imagePath != null)
                                Stack(children: [
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(Sizes.size10),
                                    child: Image.file(
                                      File(imagePath!),
                                      height: 200,
                                      width: 300,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                      right: 0,
                                      top: 0,
                                      child: GestureDetector(
                                        onDoubleTap: () {
                                          setState(() {
                                            imagePath = null;
                                          });
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(
                                              Sizes.size10),
                                          padding:
                                              const EdgeInsets.all(Sizes.size6),
                                          decoration: const BoxDecoration(
                                            color: Colors.grey,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const FaIcon(
                                            FontAwesomeIcons.xmark,
                                            color: Colors.white,
                                            size: Sizes.size20,
                                          ),
                                        ),
                                      )),
                                ])
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
  }
}
