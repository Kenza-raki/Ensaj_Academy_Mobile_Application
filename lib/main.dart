import 'package:flutter/material.dart';
import 'package:flutter_project/Student/courses/courseProvider.dart';
import 'package:flutter_project/Student/results/resultProvider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Splash Screen/splashScreen.dart';
import 'providers/RegisterPageProvider.dart';
import 'providers/createQuizProvider.dart';
import 'providers/loginPageProvider.dart';
import 'providers/studentProviders/startQuizProvider.dart';
import 'providers/studentProviders/studentProvider.dart';
import 'providers/studentProviders/studentSnapshotProvider.dart';
import 'providers/studentProviders/timerCountDownProvider.dart';
import 'reusableWidgets/profileSection/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegisterPageProvider()),
        ChangeNotifierProvider(create: (_) => LoginPageProvider()),
        ChangeNotifierProvider(create: (_) => CreateQuizProvider()),
        ChangeNotifierProvider(create: (_) => StudentProvider()),
        ChangeNotifierProvider(create: (_) => ProfilePageProvider()),
        ChangeNotifierProvider(create: (_) => StartQuizProvider()),
        ChangeNotifierProvider(create: (_) => TimerProvider()),
        ChangeNotifierProvider(create: (_) => SnapshotProvider()),
        ChangeNotifierProvider(create: (_) => CourseProvider()), 
        ChangeNotifierProvider(create: (_) => GradeProvider()), 
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Champ Quizz',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
