import 'package:flutter/foundation.dart';
import 'package:digitalm/medicine.dart';

// Import your Medicine class here if it's defined elsewhere

class TestNotifier extends ChangeNotifier {
  List<Medicine> _Medicines = [];
  
  TestNotifier() : _Medicines = [] {
  // ...
}

  

  List<Medicine> get Medicines => _Medicines;
  bool _isOurListScreen = false;

  
  void addMedicine(Medicine Medicine) {
    _Medicines.add(Medicine);
    notifyListeners(); // Notify listeners about state change
  }

  void updateMedicine(int index, Medicine updatedMedicine) {
    if (index >= 0 && index < _Medicines.length) {
      _Medicines[index] = updatedMedicine;
      notifyListeners();
    } else {
      throw RangeError('Medicine index is out of bounds');
    }
  }

  void deleteMedicine(int index) {
    if (index >= 0 && index < _Medicines.length) {
      _Medicines.removeAt(index);
      notifyListeners();
    } else {
      throw RangeError('Medicine index is out of bounds');
    }
  }
}
