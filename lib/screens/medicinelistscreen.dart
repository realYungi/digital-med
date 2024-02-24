import 'package:flutter/material.dart';
import 'package:digitalm/medicine.dart';

class MedicineListScreen extends StatelessWidget {
  final List<Medicine> medicines;
  final void Function(List<Medicine>) updateMedicineList;
  
  const MedicineListScreen({
    super.key,
    required this.medicines,
    required this.updateMedicineList,
  });

  @override
  Widget build(BuildContext context) {
    late String medicineName;
    late String medicineDescription;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine List'),
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
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  'Created: ${medicines[index].dateTimeCreated.toString()}',
                  style: const TextStyle(color: Colors.grey),
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
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addMedicine(BuildContext context) async {
    late String medicineName;
    late String medicineDescription;

    final medicine = await showDialog<Medicine>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('New Medicine'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Medicine Name'),
                onChanged: (value) => medicineName = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Description'),
                onChanged: (value) => medicineDescription = value,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (medicineName.isNotEmpty &&
                    medicineDescription.isNotEmpty) {
                  final newMedicine = Medicine(
                    name: medicineName,
                    description: medicineDescription,
                    dateTimeCreated: DateTime.now(),
                  );
                  Navigator.of(context).pop(newMedicine);
                }
              },
              child: const Text('Add'),
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
