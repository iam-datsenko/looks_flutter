// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_app/ui/button.dart';
import 'package:my_app/widgets/text_input.dart';

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
  late String email;
  late String password;
  late bool passwordHidden;

  @override
  void initState() {
    super.initState();

    email = '';
    password = '';
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

    Widget textInputTemplate(value, labelText, hintText, validate, setState) {
      return CustomTextInput(
          value: value,
          labelText: labelText,
          hintText: hintText,
          validate: validate,
          setState: setState);
    }

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textInputTemplate(email, 'Email', 'Enter an email address',
              validateEmail, setEmail),
          const SizedBox(height: 8),
          textInputTemplate(password, 'Password', 'Enter a password',
              validatePassword, setPassword),
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
