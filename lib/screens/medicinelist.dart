import 'package:digitalm/screens/postform.dart';
import 'package:flutter/material.dart';
import 'package:digitalm/medicine.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class MedicineList extends StatefulWidget {
  const MedicineList({Key? key}) : super(key: key);

  @override
  State<MedicineList> createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  List<Medicine> _medicines = [];

  @override
  void initState() {
    super.initState();
    // Load medicine data from storage or API
    _loadMedicines();
  }

  Future<void> _loadMedicines() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedMedicines = prefs.getStringList('medicines');

    // Handle potential cases where encodedMedicines might be null or empty
    if (encodedMedicines != null && encodedMedicines.isNotEmpty) {
      for (final encodedMedicine in encodedMedicines) {
        final medicine = Medicine.fromJson(jsonDecode(encodedMedicine));
        _medicines.add(medicine);
      }
    }
  }

  @override
  void didUpdateWidget(covariant MedicineList oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Save medicines to storage on state update
    _saveMedicines();
  }

  Future<void> _saveMedicines() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedMedicines =
        _medicines.map((medicine) => medicine.toJson()).toList();
    prefs.setStringList(
        'medicines', encodedMedicines.map((json) => jsonEncode(json)).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Log'),
      ),
      body: ListView.builder(
        itemCount: _medicines.length,
        itemBuilder: (context, index) {
          final medicine = _medicines[index];
          return Card(
            child: ListTile(
              title: Text(medicine.name),
              subtitle: Text(medicine.description),
              trailing: Text(medicine.date.toString()),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () async {
  // Navigate to post creation screen and wait for results
  final updatedMedicines = await Navigator.push<List<Medicine>>(
    context,
    MaterialPageRoute(builder: (context) => PostForm()),
  );

  // Check if new data was returned
  if (updatedMedicines != null) {
    // Update _medicines state with received data
    setState(() {
      _medicines = updatedMedicines;
    });
  }
},

      ),
    );
  }
}
