import 'package:flutter/material.dart';

class SemesterCalendar extends StatefulWidget {
  const SemesterCalendar({Key? key}) : super(key: key);

  @override
  _SemesterCalendarState createState() => _SemesterCalendarState();
}

class _SemesterCalendarState extends State<SemesterCalendar> {
  int _selectedIndex = 0;
  static const List<String> semesters = ['Semester 1', 'Semester 2'];

  Widget _buildCalendar(int semesterIndex) {
    String imagePath;
    if (semesterIndex == 0) {
      imagePath = 'assets/images/sem1.jpg';
    } else if (semesterIndex == 1) {
      imagePath = 'assets/images/sem2.jpg';
    } else {
      imagePath = ''; // Handle other cases if needed
    }

    return Expanded(
      child: Center(
        child: imagePath.isNotEmpty
            ? Image.asset(
                imagePath,
                width: double.infinity, // Full width
                fit: BoxFit.cover,
              )
            : Text(
                'Calendar not available',
                style: TextStyle(fontSize: 20.0),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semester Calendar'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16.0),
          Center(
            child: ToggleButtons(
              children: [
                Text('Semester 1'),
                Text('Semester 2'),
              ],
              isSelected: [for (int i = 0; i < semesters.length; i++) i == _selectedIndex],
              onPressed: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              selectedColor: Colors.blue,
              fillColor: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          SizedBox(height: 16.0),
          _buildCalendar(_selectedIndex),
        ],
      ),
    );
  }
}
