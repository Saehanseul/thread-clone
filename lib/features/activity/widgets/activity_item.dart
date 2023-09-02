import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/activity/widgets/profile_action.dart';

class ActivityItem extends StatelessWidget {
  final String hour;
  final String secondText;
  String? thirdText;
  final String type;
  ActivityItem({
    super.key,
    required this.hour,
    required this.secondText,
    this.thirdText = "",
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    if (type == 'mention' || type == 'share') {
      return Padding(
        padding: const EdgeInsets.only(
          top: Sizes.size16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.h16,
            ProfileAction(type: type),
            Gaps.h10,
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          Faker().person.firstName(),
                          style: const TextStyle(
                            fontSize: Sizes.size14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gaps.h5,
                        Text(
                          hour,
                          style: TextStyle(
                            fontSize: Sizes.size14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v4,
                    Text(
                      secondText,
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Gaps.v8,
                    Text(
                      thirdText!,
                      style: const TextStyle(
                        fontSize: Sizes.size14,
                        // fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                    ),
                    Gaps.v10,
                    Divider(
                      thickness: Sizes.size1,
                      color: Colors.grey.shade200,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    if (type == 'follow') {
      return Padding(
        padding: const EdgeInsets.only(
          top: Sizes.size16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.h16,
            ProfileAction(type: type),
            Gaps.h10,
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: Sizes.size1,
                        color: Colors.grey.shade200,
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  Faker().person.firstName(),
                                  style: const TextStyle(
                                    fontSize: Sizes.size14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Gaps.h5,
                                Text(
                                  hour,
                                  style: TextStyle(
                                    fontSize: Sizes.size14,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                            Gaps.v4,
                            Text(
                              secondText,
                              style: TextStyle(
                                fontSize: Sizes.size16,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            Gaps.v16,
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.size16,
                          vertical: Sizes.size8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: Sizes.size1,
                            color: Colors.grey.shade300,
                          ),
                          borderRadius: BorderRadius.circular(Sizes.size10),
                        ),
                        child: Text(
                          'Following',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: Sizes.size14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Gaps.h16,
                    ],
                  )),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(
        top: Sizes.size16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.h16,
          ProfileAction(type: type),
          Gaps.h10,
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        Faker().person.firstName(),
                        style: const TextStyle(
                          fontSize: Sizes.size14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gaps.h5,
                      Text(
                        hour,
                        style: TextStyle(
                          fontSize: Sizes.size14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  Gaps.v4,
                  Text(
                    secondText,
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Gaps.v10,
                  Divider(
                    thickness: Sizes.size1,
                    color: Colors.grey.shade200,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
