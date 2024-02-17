import 'package:digitalm/screens/homescreen.dart';
import 'package:digitalm/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:digitalm/screens/mainpage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for JSON decoding

// ignore plz
final String apiUrl = "http://string-db.org/api/json/resolve?identifier=ADD&species=9606";
final String baseUrl = "http://string-db.org/api/json/";

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
    
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
    
      ),

      home: MainPage(),
      
    );
  }
}
