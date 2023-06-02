import 'package:flutter/material.dart';
import 'package:instagram/constants/common_size.dart';
import 'package:instagram/homepage.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _pwAgainController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwAgainController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(common_gap),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: common_gap,
              ),
              Image.asset('assets/images/insta_text_logo.png'),
              _email(),
              const SizedBox(
                height: common_l_gap,
              ),
              _PW(),
              const SizedBox(
                height: common_l_gap,
              ),
              _confirmPW(),
              const SizedBox(
                height: common_gap,
              ),
              _submitBtn(context),
              const SizedBox(
                height: common_gap,
              ),
              // Stack(
              //   alignment: Alignment.center,
              //   children: [
              //     Container(
              //       color: Colors.grey.shade300,
              //       height: 1,
              //     ),
              //     Container(
              //       color: Colors.grey.shade50,
              //       height: 3,
              //       width: 60,
              //     ),
              //     Text(
              //       'OR',
              //       style: TextStyle(
              //           color: Colors.grey.shade500,
              //           fontWeight: FontWeight.bold),
              //     )
              //   ],
              // )
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

  TextFormField _email() {
    return TextFormField(
      cursorColor: Colors.grey,
      controller: _emailController,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey.shade500),
        hintText: 'Email',
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
      validator: (text) {
        if (text != null && text.contains('@')) {
          return null;
        } else {
          return '정확한 이메일 주소 입력해주세요.';
        }
      },
    );
  }

  TextFormField _PW() {
    return TextFormField(
      obscureText: true,
      cursorColor: Colors.grey,
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
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade300),
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          fillColor: Colors.grey.shade100),
      validator: (text) {
        if (text == null) {
          return '비밀번호를 입력해주세요.';
        } else if (text.length < 4) {
          return '비밀번호를 4자리 이상 입력해주세요.';
        }
      },
      controller: _pwController,
    );
  }

  TextFormField _confirmPW() {
    return TextFormField(
      cursorColor: Colors.grey,
      obscureText: true,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey.shade500),
        hintText: 'Confirm Password',
        focusedBorder: OutlineInputBorder(
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
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.lightBlue),
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
      controller: _pwAgainController,
      validator: (text) {
        if (text == null) {
          return '비밀번호를 입력해주세요.';
        } else if (text.length < 4) {
          return '비밀번호를 4자리 이상 입력해주세요.';
        } else if (text != _pwController.text) {
          return '입력한 비밀번호와 일치하지 않습니다.';
        }
      },
    );
  }

  TextButton _submitBtn(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const HomePage()));
        }
      },
      style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15.0)),
      child: const Text('Join'),
    );
  }
}

Row orDriver() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Container(
          height: 1,
          color: Colors.grey.shade300,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          'OR',
          style: TextStyle(
              color: Colors.grey.shade500, fontWeight: FontWeight.bold),
        ),
      ),
      Expanded(
        child: Container(
          height: 1,
          color: Colors.grey.shade300,
        ),
      ),
    ],
  );
}
