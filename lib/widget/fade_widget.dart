import 'package:flutter/material.dart';
import 'package:instagram/widget/sign_in_form.dart';
import 'package:instagram/widget/sign_up_form.dart';

class FadeWidget extends StatefulWidget {
  const FadeWidget({Key? key, required this.selectedForm}) : super(key: key);

  final int selectedForm;

  @override
  State<FadeWidget> createState() => _FadeWidgetState();
}

class _FadeWidgetState extends State<FadeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  List<Widget> forms = [
    SignUpForm(),
    SignInForm(),
  ];

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animationController.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FadeWidget oldWidget) {
    if (widget.selectedForm != oldWidget.selectedForm)
      _animationController.forward(from: 0.0);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: IndexedStack(
        index: widget.selectedForm,
        children: forms,
      ),
    );
  }
}
