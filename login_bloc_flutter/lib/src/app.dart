import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // this line of code disable banner DEBUG in Screen when the app is executed on mobile 
      title: 'Log Me In',
      home: Scaffold(
        body: SafeArea(
          child: LoginScreen(),
        ),
      ),
    );
  }
}