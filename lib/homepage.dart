import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:instagram/constants/common_size.dart';
import 'package:instagram/screens/auth_screen.dart';
import 'package:instagram/screens/camera_screen.dart';
import 'package:instagram/screens/feedScreen.dart';
import 'package:instagram/screens/profile_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> btnNavItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
    const BottomNavigationBarItem(icon: Icon(Icons.add), label: 'add'),
    const BottomNavigationBarItem(icon: Icon(Icons.healing), label: 'heal'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.manage_accounts), label: 'access'),
  ];

  int _selectTab = 0;

  static final List<Widget> _screens = <Widget>[
    const FeedScreen(),
    AuthScreen(),
    Container(
      color: Colors.greenAccent,
    ),
    Container(
      color: Colors.blueGrey,
    ),
    const SafeArea(child: ProfileScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    size ??= MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _screens[_selectTab],
      bottomNavigationBar: BottomNavigationBar(
        items: btnNavItems,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _selectTab,
        onTap: (index) {
          setState(() {
            switch (index) {
              case 2:
                _openCamera();
                break;
              default:
                _selectTab = index;
                break;
            }
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  void _openCamera() async {
    bool checkPermission = await checkPermissionGranted(context);
    if (checkPermission) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CameraScreen(),
        ),
      );
    } else {
      SnackBar snackBar = SnackBar(
        content: Text('접근을 허용해야 카메라가 사용 가능합니다.'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            AppSettings.openAppSettings();
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<bool> checkPermissionGranted(BuildContext context) async {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.camera, Permission.microphone].request();
    bool permitted = true;
    statuses.forEach((permission, permissionStatus) {
      if (!permissionStatus.isGranted) {
        permitted = false;
      }
    });

    return permitted;
  }
}
