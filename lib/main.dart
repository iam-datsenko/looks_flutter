import 'package:flutter/material.dart';
// import '../screens/welcome_screen.dart';
import '../screens/sign_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SignScreen());
  }
}
