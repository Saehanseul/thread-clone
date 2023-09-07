import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thread_clone/constants/sizes.dart';

class TakePictureScreen extends ConsumerStatefulWidget {
  static const String routeURL = "/takePicture";

  const TakePictureScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TakePictureScreenState();
}

class _TakePictureScreenState extends ConsumerState<TakePictureScreen> {
  late final bool _noCamera = kDebugMode && Platform.isIOS;

  late CameraController _controller;

  Future<void> initCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      return;
    }

    _controller = CameraController(
      cameras[0],
      ResolutionPreset.max,
    );

    await _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            print("CameraAccessDenied Error: ${e.code}");
            break;
          default:
            print("Error: ${e.code}");
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();

    if (!_noCamera) {
      initCamera();
    }
  }

  @override
  void dispose() {
    if (!_noCamera) _controller.dispose();

    super.dispose();
  }

  Future<void> _onPickImagePressed() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;
    print('image: ${image.path}');
    context.pop(image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Stack(
          children: [
            if (!_noCamera && _controller.value.isInitialized)
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: CameraPreview(_controller)),
            Positioned(
              top: Sizes.size36,
              left: Sizes.size20,
              child: BackButton(
                onPressed: () => context.pop(),
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: Sizes.size40,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      _controller.takePicture().then((value) {
                        context.pop(value.path);
                      });
                    },
                    icon: const Icon(
                      Icons.flash_off_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: Sizes.size72 + Sizes.size14,
                        height: Sizes.size72 + Sizes.size14,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: Sizes.size4,
                            color: Colors.white,
                          ),
                          color: Colors.transparent,
                        ),
                      ),
                      Container(
                        width: Sizes.size72,
                        height: Sizes.size72,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.cameraswitch,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: Sizes.size96,
          decoration: const BoxDecoration(
              // color: Colors.yellow,
              ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      // color: Colors.blue,
                      ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      // color: Colors.green,
                      ),
                  child: const Text(
                    "Camera",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      // color: Colors.purple,
                      ),
                  child: GestureDetector(
                    onTap: _onPickImagePressed,
                    child: const Text(
                      "Library",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
