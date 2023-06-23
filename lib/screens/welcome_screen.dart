import 'package:flutter/material.dart';

import '../ui/button.dart';

class WelcomeScreen extends StatelessWidget {
  final void Function() onPressSignIn;
  final void Function() onPressSignUp;

  const WelcomeScreen(
      {super.key, required this.onPressSignIn, required this.onPressSignUp});

  @override
  Widget build(BuildContext context) {
    Widget buttonSection = Container(
      margin: const EdgeInsets.only(bottom: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          getButton(Colors.white, 'Sign up', Colors.transparent, 164,
              onPressSignUp, Colors.white.withOpacity(0.1)),
          getButton(Colors.black, 'Sign in', Colors.white, 164, onPressSignIn,
              Colors.black.withOpacity(0.1)),
        ],
      ),
    );

    Widget textSection = Container(
      margin: const EdgeInsets.all(32),
      child: const Text(
        textAlign: TextAlign.center,
        'Finds fashionable items to your preferences',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontFamily: 'Alice',
        ),
      ),
    );

    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.jpg'), fit: BoxFit.cover),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black.withOpacity(0.2),
                  Colors.black,
                ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              textSection,
              Align(
                alignment: Alignment.bottomCenter,
                child: buttonSection,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
