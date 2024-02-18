import 'package:flutter/material.dart';
import 'package:digitalm/screens/mainpage.dart';
import 'dart:convert'; // for JSON decoding
import 'package:provider/provider.dart';
import 'package:digitalm/testnotifier.dart';
import 'package:flutter/services.dart' show rootBundle;

// ignore plz
final String apiUrl = "http://string-db.org/api/json/resolve?identifier=ADD&species=9606";
final String baseUrl = "http://string-db.org/api/json/";

Future<void> readJson() async {
  final String response = await rootBundle.loadString('assets/data/meds.json');
  final data = await json.decode(response);

}

void main() => runApp(MyApp(),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    readJson();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
    
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
    
      ),

      home: const MainPage(),
      
    );
  }
}
