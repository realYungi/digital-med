import 'package:flutter/material.dart';
import 'package:digitalm/screens/mainpage.dart';
import 'package:provider/provider.dart';



void main() => runApp(MyApp(),
);

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

      home: const MainPage(),
      
    );
  }
}
