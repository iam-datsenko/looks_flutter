// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_app/ui/button.dart';
import 'package:my_app/widgets/text_input.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String phone;
  late String password;
  late String confirmPassword;

  @override
  void initState() {
    super.initState();

    email = '';
    phone = '';
    password = '';
    confirmPassword = '';
  }

  @override
  Widget build(BuildContext context) {
    onPress() {
      print(email);
      print(phone);
      print(password);
      print(confirmPassword);

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

    validateEmail(value) {
      final bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value!);

      if (value.isEmpty || !emailValid) {
        return 'Please enter valid email';
      }

      return null;
    }

    validatePhone(value) {
      if (value == null || value.isEmpty) {
        return 'Please enter valid password';
      }

      return null;
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

    validateConfirmPassword(value) {
      if (value == null || value.isEmpty) {
        return 'Please enter valid confirm password';
      }

      if (value != password) {
        return 'Passwords must match';
      }

      return null;
    }

    setEmail(value) {
      setState(() {
        email = value;
      });
    }

    setPhone(value) {
      setState(() {
        phone = value;
      });
    }

    setPassword(value) {
      setState(() {
        password = value;
      });
    }

    setConfirmPassword(value) {
      setState(() {
        confirmPassword = value;
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
              value: phone,
              labelText: 'Phone',
              hintText: 'Enter an phone number',
              validate: validatePhone,
              setState: setPhone),
          const SizedBox(height: 8),
          CustomTextInput(
              value: password,
              labelText: 'Password',
              hintText: 'Enter a password',
              validate: validatePassword,
              setState: setPassword),
          const SizedBox(height: 8),
          CustomTextInput(
              value: confirmPassword,
              labelText: 'Confirm assword',
              hintText: 'Enter a confirm password',
              validate: validateConfirmPassword,
              setState: setConfirmPassword),
          const SizedBox(height: 48),
          getButton(
              Colors.white,
              'Sign up',
              const Color.fromARGB(255, 203, 57, 145),
              380,
              onPress,
              Colors.white.withOpacity(0.1)),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
