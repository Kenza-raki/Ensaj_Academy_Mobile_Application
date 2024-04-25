import 'package:flutter/material.dart';

Future<bool?> buildShowDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text('Are you sure?'),
      content: Text('Do you want to permanently delete this?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(ctx).pop(true); // Returning true if 'Yes' is pressed
          },
          child: Text('Yes'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(ctx).pop(false); // Returning false if 'No' is pressed
          },
          child: Text('No'),
        ),
      ],
    ),
  );
}
