import 'package:flutter/material.dart';
import 'package:digitalm/medicine.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:digitalm/testnotifier.dart';
import 'package:intl/intl.dart';
import 'package:digitalm/screens/addpostscreen.dart';




class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('My Medicines')),
    
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddPostScreen()),
        );
      },
    ),
  );
}


}

class TestListItem extends StatelessWidget {
  final Medicine test;
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd'); // Format for year, month, and day

  TestListItem({Key? key, required this.test}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(test.name),
      subtitle: Text(test.description),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(DateFormat('yyyy-MM-dd').format(test.createdAt)), // Display due date
          IconButton(
            icon: Icon(FontAwesomeIcons.edit),
            onPressed: () {
              // Navigate to a screen to edit the test
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.trash),
            onPressed: () {
              // Delete the test using TestNotifier
            },
          ),
        ],
      ),
    );
  }
}
