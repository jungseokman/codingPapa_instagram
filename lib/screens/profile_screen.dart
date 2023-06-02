import 'package:flutter/material.dart';
import 'package:instagram/constants/common_size.dart';
import 'package:instagram/widget/profile_body.dart';
import 'package:instagram/widget/profile_side_menu.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  MenuStatus _menuStatus = MenuStatus.close;
  double bodyX = 0;
  double menuX = size!.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          AnimatedContainer(
            curve: Curves.fastOutSlowIn,
            transform: Matrix4.translationValues(bodyX, 0, 0),
            duration: const Duration(milliseconds: 300),
            child: ProfileBody(
              onMenuChange: () {
                setState(() {
                  _menuStatus = (_menuStatus == MenuStatus.open)
                      ? MenuStatus.close
                      : MenuStatus.open;
                  switch (_menuStatus) {
                    case MenuStatus.open:
                      bodyX = -size!.width / 3 * 2;
                      menuX = size!.width / 3;
                      break;
                    case MenuStatus.close:
                      bodyX = 0;
                      menuX = size!.width;
                      break;
                  }
                });
              },
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            width: size!.width / 2,
            child: AnimatedContainer(
              curve: Curves.fastOutSlowIn,
              transform: Matrix4.translationValues(menuX, 0, 0),
              duration: const Duration(milliseconds: 300),
              child: ProfileSideMenu(menuWidth: size!.width / 3 * 2),
            ),
          ),
        ],
      ),
    );
  }
}

enum MenuStatus {
  open,
  close,
}
