import 'package:flutter/material.dart';
import 'package:login_in/screen/home.dart';
import 'package:login_in/screen/spalsh.dart';

const SAVE_KEY_NAME = 'userLoggedIn';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ScreenSplash(),
    );
  }
}
