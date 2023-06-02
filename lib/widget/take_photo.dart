import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram/models/camera_state.dart';
import 'package:instagram/widget/my_progress_indicator.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({
    super.key,
  });

  @override
  State<TakePhoto> createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CameraState>(
      builder: (context, cameraState, child) {
        return Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: cameraState.readyTakePhoto
                  ? _getPreview(cameraState, context)
                  : const MyProgressIndicator(),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (cameraState.readyTakePhoto) {
                    _attemptTakePhoto(cameraState);
                  }
                },
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _getPreview(CameraState cameraState, BuildContext context) {
    return ClipRRect(
      child: OverflowBox(
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width /
                  cameraState.controller!.value.aspectRatio,
              child: CameraPreview(cameraState.controller!)),
        ),
      ),
    );
  }

  void _attemptTakePhoto(CameraState cameraState) async {
    final String timeMilli = DateTime.now().millisecondsSinceEpoch.toString();

    try {
      final path = join((await getTemporaryDirectory()).path, '$timeMilli.png');
      await cameraState.controller!.takePicture();
    } catch (e) {}
  }
}
