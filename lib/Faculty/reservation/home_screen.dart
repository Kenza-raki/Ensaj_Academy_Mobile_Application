import 'package:flutter/material.dart';

import 'package:flutter_project/Faculty/reservation/reservtion_list.dart';

import 'reservtion_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservations'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReservationScreen(
                existed: false, // Provide the value for existed
                email: '', // Provide the value for email
                id: '', // Provide the value for id
                name: '', // Provide the value for name
                phone: '', // Provide the value for phone
                pickedTime: DateTime.now(), // Provide the value for pickedTime
              ),
            ),
          );
        },
      ),
      body: ReservationList(),
    );
  }
}
