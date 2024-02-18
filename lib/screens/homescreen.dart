import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CalendarFormat _calendarFormat = CalendarFormat.month;
  late DateTime _currentDay = DateTime.now();
  late DateTime _focusedDay = DateTime.now();
  int currentPageIndex = 0;

  final todayDayTextStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  );

  final todayBorderColor = Colors.blue;

  final int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Initialize _currentDay and _focusedDay
    _currentDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top section with text and logo
            Container(
              color: Colors.white, // Or your desired background color
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Welcome back,',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    'assets/images/logosolo.png',
                    width: 60, // Adjust as needed
                    height: 60, // Adjust as needed
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200], // Adjust desired grayness
                borderRadius: BorderRadius.circular(20), // Adjust radius
              ),
              padding: const EdgeInsets.all(20),
              child: TableCalendar(
                firstDay: DateTime.now().subtract(const Duration(days: 365)),
                lastDay: DateTime.now().add(const Duration(days: 365)),
                focusedDay: _focusedDay,
                currentDay: _currentDay,
                calendarFormat: _calendarFormat,
                onDaySelected: (currentDay, focusedDay) {
                  if (isSameDay(_currentDay, currentDay)) {
                    // Handle current day selection here
                    print('You current the current day!');
                  }
                  setState(() {
                    _currentDay = currentDay;
                    _focusedDay = focusedDay;
                  });
                },
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                startingDayOfWeek: StartingDayOfWeek.sunday,
                daysOfWeekVisible: true,
                // Highlight today's cell
                selectedDayPredicate: (day) => isSameDay(_currentDay, day),
              ),
            ),
            const SizedBox(height: 30,),
            const Text(
              'Recent Activities',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
