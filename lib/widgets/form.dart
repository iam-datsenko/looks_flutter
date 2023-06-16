// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_app/ui/button.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  CustomFormState createState() {
    return CustomFormState();
  }
}

class CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  String email = '';
  String password = '';
  late bool passwordHidden;

  @override
  void initState() {
    super.initState();

    passwordHidden = true;
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

    onPress() {
      print(email);
      print(password);

      if (_formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.grey[400],
              content: const Center(
                child: Text(
                  'Processing data...',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )),
        );

        _formKey.currentState?.reset();
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: screenWidth,
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: TextFormField(
                onChanged: (value) => {
                  setState(() {
                    email = value;
                  }),
                },
                validator: (value) {
                  final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!);

                  if (value.isEmpty || !emailValid) {
                    return 'Please enter valid email';
                  }

                  return null;
                },
                focusNode: emailFocusNode,
                onTapOutside: (event) => {emailFocusNode.unfocus()},
                decoration: InputDecoration(
                  // contentPadding: const EdgeInsets.all(18),
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: const BorderSide(color: Colors.grey)),
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
                onChanged: (value) => setState(() {
                  password = value;
                }),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter valid password';
                  }

                  if (value.length < 6) {
                    return 'Password too short';
                  }

                  return null;
                },
                focusNode: passwordFocusNode,
                onTapOutside: (event) => {passwordFocusNode.unfocus()},
                obscureText: passwordHidden,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(18),
                  suffixIcon: IconButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                      ),
                      onPressed: () {
                        setState(() {
                          passwordHidden = !passwordHidden;
                        });
                      },
                      icon: Icon(
                        passwordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      )),
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: const BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  labelText: 'Password',
                  hintText: 'Enter a password',
                ),
              )),
          const SizedBox(height: 48),
          getButton(
              Colors.white,
              'Sign in',
              const Color.fromARGB(255, 203, 57, 145),
              358,
              onPress,
              Colors.white.withOpacity(0.1)),
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
