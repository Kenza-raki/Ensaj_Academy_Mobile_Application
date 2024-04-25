import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/RegisterPageProvider.dart';

Widget textFieldName() {
  return Consumer<RegisterPageProvider>(
    builder: (context, providerValue, child) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          decoration: textFieldDecoration("Name"),
          onChanged: (value) {
            providerValue.nameController(value);
          },
        ),
      );
    },
  );
}

Widget textFieldEmail() {
  return Consumer<RegisterPageProvider>(
    builder: (context, providerValue, child) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          validator: (value) {
            const pattern = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
            if (value!.trimLeft().length < 3) {
              if (RegExp(r'[\s]').hasMatch(value)) {
                return "Email must not contain spaces";
              }
              return "Please enter a valid Email";
            } else if (!RegExp(pattern).hasMatch(value)) {
              return "Please enter a valid Email";
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.emailAddress,
          decoration: textFieldDecoration("Email"),
          onChanged: (value) {
            providerValue.emailController(value);
          },
        ),
      );
    },
  );
}

Widget textFieldPassword() {
  return Consumer<RegisterPageProvider>(
    builder: (context, providerValue, child) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          obscureText: true,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.visiblePassword,
          decoration: textFieldDecoration("Password"),
          onChanged: (value) {
            providerValue.passwordController(value);
          },
        ),
      );
    },
  );
}

InputDecoration textFieldDecoration(String label) {
  return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black),
      errorBorder: textFieldBorder(),
      focusedErrorBorder: textFieldBorder(),
      errorStyle: TextStyle(fontSize: 14),
      border: textFieldBorder(),
      enabledBorder: textFieldBorder(),
      focusedBorder: textFieldBorder());
}

OutlineInputBorder textFieldBorder() {
  return OutlineInputBorder(
      borderSide: const BorderSide( color: Color.fromARGB(255, 8, 92, 160)),
      borderRadius: BorderRadius.circular(20),
      gapPadding: 5);
}

