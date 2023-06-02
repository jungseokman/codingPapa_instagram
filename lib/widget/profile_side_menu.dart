import 'package:flutter/material.dart';
import 'package:instagram/screens/auth_screen.dart';

class ProfileSideMenu extends StatelessWidget {
  const ProfileSideMenu({Key? key, required this.menuWidth}) : super(key: key);

  final double menuWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: menuWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
            title: Text(
              'Setting',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
              color: Colors.black87,
            ),
            title: Text('Sign out'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const AuthScreen()));
            },
          )
        ],
      ),
    );
  }
}
