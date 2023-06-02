import 'package:flutter/material.dart';
import 'package:instagram/homepage.dart';
import 'package:instagram/widget/sign_up_form.dart';

import '../constants/common_size.dart';

class SignInForm extends StatefulWidget {
  SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(common_gap),
          child: ListView(
            children: [
              const SizedBox(
                height: common_gap,
              ),
              Image.asset('assets/images/insta_text_logo.png'),
              const SizedBox(
                height: common_gap,
              ),
              TextFormField(
                controller: _emailController,
                validator: (text) {
                  if (text != null && text.contains('@')) {
                    return null;
                  } else {
                    return '정확한 이메일 주소 입력해주세요.';
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.lightBlue),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.lightBlue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade300),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                ),
              ),
              const SizedBox(
                height: common_gap,
              ),
              TextFormField(
                controller: _pwController,
                obscureText: true,
                validator: (text) {
                  if (text == null) {
                    return '비밀번호를 입력해주세요.';
                  } else if (text.length < 4) {
                    return '비밀번호를 4자리 이상 입력해주세요.';
                  }
                },
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  hintText: 'Password',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.lightBlue),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.lightBlue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade300),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                ),
              ),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blue,
                    ),
                    onPressed: () {},
                    child: Text('Forgotton Password?'),
                  ),
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                },
                child: const Text('Login'),
              ),
              SizedBox(
                height: common_gap,
              ),
              orDriver(),
              TextButton.icon(
                onPressed: () {},
                icon: const ImageIcon(
                  AssetImage(
                    'assets/images/facebook.png',
                  ),
                ),
                label: const Text('Login with Facebook'),
                style: TextButton.styleFrom(foregroundColor: Colors.blue),
              )
            ],
          ),
        ),
      ),
    );
  }
}
