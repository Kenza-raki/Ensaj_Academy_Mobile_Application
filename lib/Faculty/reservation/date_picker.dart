import 'package:flutter/material.dart';
import 'package:flutter_project/Faculty/reservation/constants.dart';

class DatePicker extends StatefulWidget {
  final void Function(DateTime time) fetchTime;
  final DateTime initialDateTime;

  DatePicker({required this.fetchTime, required this.initialDateTime});

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton.icon(
          onPressed: () async {
            DateTime? selectedDate = await buildShowDatePicker(context);
            TimeOfDay? selectedTime = await buildShowTimePicker(context);
            if (selectedDate != null && selectedTime != null) {
              setState(() {
                _selectedDate = DateTime(
                  selectedDate.year,
                  selectedDate.month,
                  selectedDate.day,
                  selectedTime.hour,
                  selectedTime.minute,
                );
              });
              widget.fetchTime(_selectedDate);
            }
          },
          icon: Icon(Icons.date_range),
          label: Text(
            dateformat.format(widget.initialDateTime),
            style: ktitleStyle.copyWith(fontSize: 15.0),
          ),
        ),
      ],
    );
  }

  Future<TimeOfDay?> buildShowTimePicker(BuildContext context) {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(widget.initialDateTime),
    );
  }

  Future<DateTime?> buildShowDatePicker(BuildContext context) {
    return showDatePicker(
      context: context,
      initialDate: widget.initialDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
  }
}
