import 'package:flutter/material.dart';
import 'package:instagram/widget/fade_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  int selectedForm = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FadeWidget(selectedForm: selectedForm),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey),
                  ),
                  color: Colors.white,
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      selectedForm == 0 ? selectedForm = 1 : selectedForm = 0;
                    });
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: selectedForm == 1
                              ? 'Don\'t have an account? '
                              : 'Already have an account? ',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                            text: selectedForm == 1 ? 'Sign up' : 'Sign In',
                            style: const TextStyle(
                                color: Colors.lightBlueAccent,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
