import 'package:flutter/material.dart';
import 'package:digitalm/medicine.dart';

class MedicineListScreen extends StatelessWidget {
  final List<Medicine> medicines;
  final void Function(List<Medicine>) updateMedicineList;
  
  MedicineListScreen({
    Key? key,
    required this.medicines,
    required this.updateMedicineList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String _medicineName;
    late String _medicineDescription;

    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine List'),
      ),
      body: ListView.builder(
        itemCount: medicines.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(medicines[index].name),
                Text(
                  medicines[index].description,
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'Created: ${medicines[index].dateTimeCreated.toString()}',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            onTap: () {
              // Toggle the isDone status of the medicine
              final updatedMedicines = List<Medicine>.from(medicines);
              updatedMedicines[index].isDone = !updatedMedicines[index].isDone;
              updateMedicineList(updatedMedicines);
            },
            leading: Checkbox(
              value: medicines[index].isDone,
              onChanged: (bool? value) {
                // Update the isDone status of the medicine
                final updatedMedicines = List<Medicine>.from(medicines);
                updatedMedicines[index].isDone = value ?? false;
                updateMedicineList(updatedMedicines);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addMedicine(context),
        tooltip: 'Add Medicine',
        child: Icon(Icons.add),
      ),
    );
  }

  void _addMedicine(BuildContext context) async {
    late String _medicineName;
    late String _medicineDescription;

    final medicine = await showDialog<Medicine>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('New Medicine'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Medicine Name'),
                onChanged: (value) => _medicineName = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Description'),
                onChanged: (value) => _medicineDescription = value,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_medicineName.isNotEmpty &&
                    _medicineDescription.isNotEmpty) {
                  final newMedicine = Medicine(
                    id: 0,
                    ingredients: [],
                    isDone: false,
                    name: _medicineName,
                    description: _medicineDescription,
                    dateTimeCreated: DateTime.now(),
                  );
                  Navigator.of(context).pop(newMedicine);
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );

    if (medicine != null) {
      // Add the new medicine to the list
      final updatedMedicines = List<Medicine>.from(medicines);
      updatedMedicines.add(medicine);
      updateMedicineList(updatedMedicines);
    }
  }
}
