import 'package:flutter/material.dart';
import 'package:my_app/widgets/sign_in_form.dart';
import 'package:my_app/widgets/sign_up_form.dart';

import '../ui/tab.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  SignScreenState createState() {
    return SignScreenState();
  }
}

class SignScreenState extends State {
  bool signInVisible = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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

    Widget logo = Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 96),
      child: Image.asset(
        'images/logo.png',
        width: 264,
        height: 82,
        fit: BoxFit.cover,
      ),
    );

    Widget tabBarSection = Container(
      alignment: Alignment.topCenter,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      height: 60,
      width: screenWidth,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        getTab(signInVisible ? Colors.black : Colors.grey, 'Sign in',
            signInVisible ? Colors.black : Colors.grey, onPressSignIn),
        getTab(signInVisible ? Colors.grey : Colors.black, 'Sign up',
            signInVisible ? Colors.grey : Colors.black, onPressSignUp),
      ]),
    );

    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            logo,
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                tabBarSection,
                Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  height: 540,
                  width: screenWidth,
                  child:
                      signInVisible ? const SignInForm() : const SignUpForm(),
                ),
              ],
            )
          ],
        ));
  }
}
