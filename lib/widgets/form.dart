import 'package:flutter/material.dart';
import 'package:my_app/ui/button.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  CustomFormState createState() {
    return CustomFormState();
  }
}

class CustomFormState extends State {
  final _formKey = GlobalKey();
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;

  @override
  void initState() {
    super.initState();

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    onPress() => {
          // ignore: avoid_print
          print('form')
        };

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: screenWidth,
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: TextFormField(
                focusNode: emailFocusNode,
                onTapOutside: (event) => {emailFocusNode.unfocus()},
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  labelText: 'Email',
                  hintText: 'Enter an email address',
                ),
              )),
          Container(
              width: screenWidth,
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: TextFormField(
                focusNode: passwordFocusNode,
                onTapOutside: (event) => {passwordFocusNode.unfocus()},
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  labelText: 'Password',
                  hintText: 'Enter a password',
                ),
              )),
          const SizedBox(height: 48),
          getButton(Colors.white, 'Sign in',
              const Color.fromARGB(255, 203, 57, 145), 358, onPress),
          const SizedBox(height: 24),
          const Text(
            'Recovery password',
            style: TextStyle(
                fontSize: 16, fontFamily: 'Alice', fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
