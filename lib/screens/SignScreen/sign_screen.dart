import 'package:flutter/material.dart';
import 'package:my_app/screens/welcome_screen.dart';

import 'package:my_app/widgets/sign_in_form.dart';
import 'package:my_app/widgets/sign_up_form.dart';
import '../../ui/tab.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  SignScreenState createState() {
    return SignScreenState();
  }
}

class SignScreenState extends State<SignScreen> with RestorationMixin {
  late RestorableBool signInVisible;
  late RestorableBool welcomeScreenVisible;

  @override
  void initState() {
    super.initState();

    signInVisible = RestorableBool(true);
    welcomeScreenVisible = RestorableBool(true);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    onPressSignIn() {
      setState(() {
        signInVisible.value = true;
        welcomeScreenVisible.value = false;
      });
    }

    onPressSignUp() {
      setState(() {
        signInVisible.value = false;
        welcomeScreenVisible.value = false;
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
        getTab(signInVisible.value ? Colors.black : Colors.grey, 'Sign in',
            signInVisible.value ? Colors.black : Colors.grey, onPressSignIn),
        getTab(signInVisible.value ? Colors.grey : Colors.black, 'Sign up',
            signInVisible.value ? Colors.grey : Colors.black, onPressSignUp),
      ]),
    );

    return welcomeScreenVisible.value
        ? WelcomeScreen(
            onPressSignIn: onPressSignIn, onPressSignUp: onPressSignUp)
        : Scaffold(
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
                      child: signInVisible.value
                          ? const SignInForm()
                          : const SignUpForm(),
                    ),
                  ],
                )
              ],
            ));
  }

  @override
  String? get restorationId => "sign_screen";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(signInVisible, "signInVisible");
    registerForRestoration(welcomeScreenVisible, "welcomeScreenVisible");
  }

  @override
  void dispose() {
    super.dispose();

    signInVisible.dispose();
    welcomeScreenVisible.dispose();
  }
}
