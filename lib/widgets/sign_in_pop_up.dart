import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.only(top: 40),
          child: Image.asset(
            'images/logo.png',
            width: 264,
            height: 82,
            fit: BoxFit.cover,
          ),
        ));
  }
}
