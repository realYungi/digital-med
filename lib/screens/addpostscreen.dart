import 'package:flutter/material.dart';
import 'package:digitalm/medicine.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:digitalm/testnotifier.dart';
import 'listscreen.dart';

class AddPostScreen extends StatefulWidget {
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _formKey = GlobalKey<FormState>();

  // Text editing controllers for input fields
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TestNotifier>(
      create: (context) =>
          Provider.of<TestNotifier>(context), // Access existing provider
      child: Scaffold(
        appBar: AppBar(title: Text('Add Test')),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              // Text fields for title and description
              TextFormField(
                controller: _titleController,
                // ...
              ),
              TextFormField(
                controller: _descriptionController,
                // ...
              ),
              // Date picker for due date
              TextButton(
                onPressed: () {
                  // Show date picker and update _selectedDate
                },
                child: Text('Select Due Date'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate input
                  if (_formKey.currentState!.validate()) {
                    // Access TestNotifier using Provider
                    final testNotifier =
                        Provider.of<TestNotifier>(context, listen: false);
                    // Create Test object and add it
                    testNotifier.addMedicine(Medicine(
                      id: 0,
                      name: _titleController.text,
                      description: _descriptionController.text,
                      createdAt: _selectedDate,
                      ingredients: [],
                    ));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ListScreen()),
                    );
// Go back to previous screen
                  }
                },
                child: Text('Add Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
