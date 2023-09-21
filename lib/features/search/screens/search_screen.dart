import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/common/widgets/ProfileCircleImage.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/search/view_models/search_view_model.dart';

class SearchScreen extends ConsumerStatefulWidget {
  static const String routeURL = "/search";
  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v16,
            const Padding(
              padding: EdgeInsets.only(
                left: Sizes.size16,
              ),
              child: Text(
                'Search',
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                Sizes.size16,
              ),
              child: CupertinoSearchTextField(
                controller: _searchController,
                placeholder: 'Search',
                onSubmitted: (value) {
                  ref.read(searchProvider.notifier).searchUser(query: value);
                },
                onSuffixTap: () {
                  print("onSuffic Tap");
                  ref.read(searchProvider.notifier).searchUser();
                  _searchController.clear();
                },
              ),
            ),
            ref.watch(searchProvider).when(
                  data: (data) {
                    return Column(
                      children: data.map((user) {
                        return Test(
                          title: user.name,
                          description: user.description,
                        );
                      }).toList(),
                    );
                  },
                  error: (error, stackTrace) => Text(error.toString()),
                  loading: () => const CircularProgressIndicator(),
                ),
          ],
        ),
      ),
    );
  }
}

class Test extends StatelessWidget {
  final title;
  final description;

  const Test({
    super.key,
    this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Sizes.size16,
        bottom: Sizes.size16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileCircleImage(
            url: 'assets/images/profile_image1.jpeg',
            size: Sizes.size36,
            margin: Sizes.size1,
          ),
          Gaps.h16,
          Container(
            child: Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  right: Sizes.size16,
                ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text(
                            // Faker().person.firstName(),
                            title,
                            style: const TextStyle(
                              fontSize: Sizes.size16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Gaps.h5,
                          const Image(
                            image: AssetImage(
                              "assets/images/badge.png",
                            ),
                            width: Sizes.size16,
                            height: Sizes.size16,
                          ),
                        ]),
                        Gaps.v4,
                        Text(
                          // Faker().person.name(),
                          description,
                          style: TextStyle(
                            fontSize: Sizes.size14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Gaps.v10,
                        const Text(
                          '26.6k followers',
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gaps.v10,
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size20,
                        vertical: Sizes.size4,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: Sizes.size1,
                          color: Colors.grey.shade400,
                        ),
                        borderRadius: BorderRadius.circular(Sizes.size10),
                      ),
                      child: const Text(
                        'Follow',
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
