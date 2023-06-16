import 'package:flutter/material.dart';
import 'package:my_app/widgets/form.dart';

import '../ui/tab.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  _SignScreenState createState() => _SignScreenState();
}

class _SignScreenState extends State {
  bool signInVisible = true;

  onPressSignIn() {
    setState(() {
      signInVisible = true;
    });
  }

  onPressSignUp() {
    setState(() {
      signInVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 96),
              child: Image.asset(
                'images/logo.png',
                width: 264,
                height: 82,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  height: 60,
                  width: screenWidth,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getTab(
                            signInVisible ? Colors.black : Colors.grey,
                            'Sign in',
                            signInVisible ? Colors.black : Colors.grey,
                            onPressSignIn),
                        getTab(
                            signInVisible ? Colors.grey : Colors.black,
                            'Sign up',
                            signInVisible ? Colors.grey : Colors.black,
                            onPressSignUp),
                      ]),
                ),
                Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  height: 540,
                  width: screenWidth,
                  child: signInVisible
                      ? const CustomForm()
                      : const Text('sign up'),
                ),
              ],
            )
          ],
        ));
  }
}
