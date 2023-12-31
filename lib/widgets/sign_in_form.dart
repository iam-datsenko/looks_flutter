// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_app/ui/button.dart';
import 'package:my_app/widgets/text_input.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

class SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;

  @override
  void initState() {
    super.initState();

    email = '';
    password = '';
  }

  @override
  Widget build(BuildContext context) {
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

    validatePassword(value) {
      if (value == null || value.isEmpty) {
        return 'Please enter valid password';
      }

      if (value.length < 6) {
        return 'Password too short';
      }

      return null;
    }

    validateEmail(value) {
      final bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value!);

      if (value.isEmpty || !emailValid) {
        return 'Please enter valid email';
      }

      return null;
    }

    setEmail(value) {
      setState(() {
        email = value;
      });
    }

    setPassword(value) {
      setState(() {
        password = value;
      });
    }

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextInput(
              value: email,
              labelText: 'Email',
              hintText: 'Enter an email address',
              validate: validateEmail,
              setState: setEmail),
          const SizedBox(height: 8),
          CustomTextInput(
              value: password,
              labelText: 'Password',
              hintText: 'Enter a password',
              validate: validatePassword,
              setState: setPassword),
          const SizedBox(height: 48),
          getButton(
              Colors.white,
              'Sign in',
              const Color.fromARGB(255, 203, 57, 145),
              380,
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
