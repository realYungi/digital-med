import 'package:flutter/material.dart';
import 'dart:async'; 

import 'loginscreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    Future.delayed(const Duration(seconds: 3), () {
  
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });

    

    return Scaffold(
      backgroundColor: Colors.white, 
      body: Center(
        child: Image.asset(
          'assets/images/logo.png', 
          width: 200, 
          height: 200, 
        ),
      ),
    );
  }
}
