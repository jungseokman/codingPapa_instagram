import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {
  const MyProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: Center(
        child: SizedBox(
            height: 60,
            width: 60,
            child: Image.asset('assets/images/loading_img.gif')),
      ),
    );
    ;
  }
}
