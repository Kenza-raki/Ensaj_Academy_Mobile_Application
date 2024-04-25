import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Faculty/reservation/constants.dart';
import 'package:flutter_project/Faculty/reservation/date_picker.dart';
import 'package:flutter_project/Faculty/reservation/firebase_api.dart';
import 'package:flutter_project/Faculty/reservation/reservation.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class ReservationScreen extends StatefulWidget {
  final String id;
  final String name;
  final String phone;
  final String email;
  final DateTime pickedTime;
  final bool existed;

  ReservationScreen({
    required this.id,
    required this.name,
    required this.phone,
    required this.pickedTime,
    required this.email,
    required this.existed,
  });

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String phone;
  late String email;
  late DateTime pickedTime;

  @override
  void initState() {
    super.initState();
    // Initialize form fields with widget data
    name = widget.existed ? widget.name : '';
    phone = widget.existed ? widget.phone : '';
    email = widget.existed ? widget.email : '';
    pickedTime = widget.pickedTime;
  }

  void fetchTime(DateTime selectedTime) {
    setState(() {
      pickedTime = selectedTime;
    });
  }

  Future<void> sendEmail(Reservation reservation) async {
    final smtpServer = gmail('kenzaraki051@gmail.com', 'kenza@raki99');

    final message = Message()
      ..from = Address('kenzaraki051@gmail.com', 'Kenza Raki')
      ..recipients.add(reservation.email)
      ..subject = 'Reservation Details'
      ..text = 'Hello ${reservation.name},\n\n'
          'Your reservation details:\n'
          'Date: ${reservation.date.toString()}\n'
          'Phone: ${reservation.phoneNumber}\n'
          'Email: ${reservation.email}\n\n'
          'Thank you for your reservation!';

    try {
      final sendReport = await send(message, smtpServer);
      if (sendReport != null ) {
        print('Email sent successfully');
      } else {
        print('Failed to send email');
      }
    } catch (e) {
      print('Error sending email: $e');
    }
  }

  Future<void> onFormSubmitted() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

        Reservation newReservation = Reservation(
        id: widget.existed ? widget.id : '',
        name: name,
        phoneNumber: phone,
        email: email,
        date: pickedTime,
        updatedAt: Timestamp.now(), // Ensure Timestamp is properly imported
      );

      if (widget.existed) {
        await FirebaseApi.updateReservation(newReservation);
      } else {
        await FirebaseApi.addReservation(newReservation);
      }

      await sendEmail(newReservation);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  initialValue: name,
                  style: ktitleStyle.copyWith(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 20.0,
                    ),
                  ),
                  validator: nameValidator,
                  onSaved: (value) => name = value!,
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  initialValue: phone,
                  style: ktitleStyle.copyWith(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 20.0,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: phoneNumberValidator,
                  onSaved: (value) => phone = value!,
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  initialValue: email,
                  style: ktitleStyle.copyWith(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 20.0,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: emailValidator,
                  onSaved: (value) => email = value!,
                ),
                SizedBox(height: 20.0),
                DatePicker(
                  fetchTime: fetchTime,
                  initialDateTime: pickedTime,
                ),
                SizedBox(height: 20.0),
                OutlinedButton(
                  onPressed: () {
                    onFormSubmitted();
                  },
                  child: Text(
                    'Submit',
                    style: ktitleStyle.copyWith(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Validators for the form fields
String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Name is required';
  }
  return null;
}

String? phoneNumberValidator(String? value) {
  if (value == null || value.isEmpty || value.length != 10 || double.tryParse(value) == null) {
    return 'Enter a valid 10-digit phone number';
  }
  return null;
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty || !value.contains('@')) {
    return 'Enter a valid email address';
  }
  return null;
}
