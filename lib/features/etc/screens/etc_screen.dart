import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/constants/sizes.dart';

class EtcScreen extends ConsumerStatefulWidget {
  final String title;

  const EtcScreen(this.title, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EtcScreenState();
}

class _EtcScreenState extends ConsumerState<EtcScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          widget.title,
          style: const TextStyle(
            fontSize: Sizes.size32,
          ),
        ),
      ),
    );
  }
}
