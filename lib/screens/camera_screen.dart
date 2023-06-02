import 'package:flutter/material.dart';
import 'package:instagram/models/camera_state.dart';
import 'package:provider/provider.dart';

import '../widget/take_photo.dart';

class CameraScreen extends StatefulWidget {
  CameraScreen({Key? key}) : super(key: key);

  final CameraState _cameraState = CameraState();

  @override
  State<CameraScreen> createState() {
    _cameraState.getReadyToTakePhoto();
    return _CameraScreenState();
  }
}

class _CameraScreenState extends State<CameraScreen> {
  int _selectedBar = 1;
  final PageController _pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    widget._cameraState.cameraDispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CameraState>.value(value: widget._cameraState),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(_selectedBar == 0
              ? 'Gallery'
              : _selectedBar == 1
                  ? 'Photo'
                  : 'Video'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 16,
          unselectedFontSize: 16,
          iconSize: 0,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          onTap: (index) {
            setState(() {
              _selectedBar = index;
              _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn);
            });
          },
          currentIndex: _selectedBar,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.radio_button_checked,
              ),
              label: 'GALLERY',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.radio_button_checked,
              ),
              label: 'PHOTO',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.radio_button_checked,
              ),
              label: 'VIDEO',
            ),
          ],
        ),
        body: PageView(
          onPageChanged: (index) {
            setState(() {
              _selectedBar = index;
            });
          },
          controller: _pageController,
          children: [
            Container(
              color: Colors.yellow,
            ),
            TakePhoto(),
            Container(
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
