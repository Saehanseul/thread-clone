import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EtcScreen extends ConsumerStatefulWidget {
  const EtcScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EtcScreenState();
}

class _EtcScreenState extends ConsumerState<EtcScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Text("etc screen"),
      ),
    );
  }
}
