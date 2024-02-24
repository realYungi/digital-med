import 'package:digitalm/screens/homescreen.dart';
import 'package:digitalm/screens/medicinelistscreen.dart';
import 'package:flutter/material.dart';
import 'package:digitalm/medicine.dart';
// Import from flutter_navigator

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarExample(),
    );
  }
}


class MedicineListStateContainer extends StatefulWidget {
  final List<Medicine> medicines;
  
  const MedicineListStateContainer({
    super.key,
    required this.medicines,
  });

  @override
  _MedicineListStateContainerState createState() =>
      _MedicineListStateContainerState();
}

class _MedicineListStateContainerState
    extends State<MedicineListStateContainer> {
  late List<Medicine> _medicines;

  @override
  void initState() {
    super.initState();
    _medicines = widget.medicines;
  }

  @override
  Widget build(BuildContext context) {
    return MedicineListScreen(
      medicines: _medicines,
      updateMedicineList: _updateMedicineList,
    );
  }

  void _updateMedicineList(List<Medicine> updatedMedicines) {
    setState(() {
      _medicines = updatedMedicines;
    });
  }
}




class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const Text(
      'Index 1: Search',
      style: optionStyle,
    ),
    // Use MedicineListStateContainer instead of directly MedicineListScreen
    const MedicineListStateContainer( medicines: [],),
   
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
         
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
        backgroundColor: Colors.black,
      ),
    );
  }
}




