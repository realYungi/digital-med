import 'package:digitalm/screens/homescreen.dart';
import 'package:digitalm/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for JSON decoding

final String apiUrl = "http://string-db.org/api/json/resolve?identifier=ADD&species=9606";
final String baseUrl = "http://string-db.org/api/json/";

class User {
  final String name;
  final String email;
  final String picture;

  User({required this.name, required this.email, required this.picture});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name']['first'] + " " + json['name']['last'],
      email: json['email'],
      picture: json['picture']['large'],
    );
  }
}

Future<List<User>> fetchUsers() async {
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    // Parse the JSON response
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> results = data['results'];

    // Map the JSON data to a list of User objects
    return results.map((item) => User.fromJson(item)).toList();
  } else {
    // Handle error
    throw Exception('Failed to load users');
  }
}

void main() async{
  final users = await fetchUsers();

  // Use the users in your app
  for (User user in users) {
    print("Name: ${user.name}");
    print("Email: ${user.email}");
    print("Picture URL: ${user.picture}");
    print("--------");
  }

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

      home: HomeScreen(),
      
    );
  }
}
