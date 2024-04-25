import 'package:flutter/material.dart';
import '../constants/constantString.dart';
import '../reusableWidgets/Responsive.dart';
import '../reusableWidgets/createColor.dart';
import 'notUserSignup.dart';
import 'submitButton.dart';
import 'textFields.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: pageDecoration(),
        child: SingleChildScrollView(
          child: bodyContainer(),
        ),
      ),
    );
  }

  Widget bodyContainer() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      width: ResponsiveWidget.isSmallScreen(context)
          ? screenWidth(context)
          : screenWidth(context) / 2,
      margin: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logoApp(),
          const SizedBox(height: 0),
          Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: const [
    Text(
      'Ensaj ',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 8, 92, 160), // Blue color for Ensaj
      ),
    ),
    Text(
      'Universe',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black, // Black color for Universe
      ),
    ),
  ],
),


          const SizedBox(height: 20),
          textFieldEmail(),
          const SizedBox(height: 20),
          textFieldPassword(),
          const SizedBox(height: 20),
          submitButton(),
          const SizedBox(height: 20),
          notUserSignup(context),
        ],
      ),
    );
  }

  Widget logoApp() {
    return Container(
      margin: const EdgeInsets.only(bottom: 0),
      width: 300,
      child: Image.asset(
        appLogo,
        height: 200,
        width: 100,
      ),
    );
  }

  BoxDecoration pageDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.white],
        stops: [1],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
    );
  }
}
