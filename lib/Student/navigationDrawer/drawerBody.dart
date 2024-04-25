import 'package:flutter/material.dart';
import 'package:flutter_project/Student/calendar/calendar.dart';
import 'package:flutter_project/Faculty/createCourse/addCourse.dart';
import 'package:flutter_project/Student/courses/courseProvider.dart';
import 'package:flutter_project/Student/courses/coursesPage.dart';
import 'package:flutter_project/Student/homePage/homeScreen.dart';
import 'package:flutter_project/Student/mainScreen.dart';
import 'package:flutter_project/Faculty/addResults/addNote.dart';
import 'package:flutter_project/Student/results/viewResults.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../aboutPage/mainPage.dart';
import '../../constants/constantString.dart';
import '../../reusableWidgets/Responsive.dart';
import '../../reusableWidgets/profileSection/getProfileInfo.dart';
import '../../reusableWidgets/profileSection/mainPage.dart';
import '../../reusableWidgets/profileSection/provider.dart';
import '../checkScores/checkScores.dart';

ListTile listTileHome(context) {
  return ListTile(
    contentPadding: const EdgeInsets.only(left: 20),
    leading:
        const Icon(FontAwesomeIcons.home, size: 20, color: Colors.black),
    title: Text(
      "Home",
      style: TextStyle(
        fontSize: setSize(context, 17),
        fontWeight: FontWeight.w400,
      ),
    ),
    onTap: () {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    },
  );
}

ListTile listTileMyQuiz(context) {
  return ListTile(
    contentPadding: const EdgeInsets.only(left: 20),
    leading:
        const Icon(FontAwesomeIcons.bookOpenReader, size: 20, color: Colors.black),
    title: Text(
      "My Quiz",
      style: TextStyle(
        fontSize: setSize(context, 17),
        fontWeight: FontWeight.w400,
      ),
    ),
    onTap: () {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const StudentHome()));
    },
  );
}

ListTile listTileCheckScore(context) {
  return ListTile(
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading: Icon(FontAwesomeIcons.checkToSlot,
        size: setSize(context, 17), color: Colors.black),
    title: Text(
      "Check My Score",
      style: TextStyle(
        fontSize: setSize(context, 17),
        fontWeight: FontWeight.w400,
      ),
    ),
    onTap: () {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const CheckScore()));
    },
  );
}
ListTile listTileqrcode(context) {
  return ListTile(
    style: ListTileStyle.drawer,
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading:
        const Icon(FontAwesomeIcons.qrcode, size: 20, color: Colors.black),
    title: Text(
      "QR code ",
      style: TextStyle(
          fontSize: setSize(context, 17), fontWeight: FontWeight.w400),
    ),
    onTap: () {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TeacherAddGradePage(),
          ));
    },
  );
}
Container listTileProfile(context) {
  return Container(
    child: Consumer<ProfilePageProvider>(
      builder: (context, providervalue, child) {
        return ListTile(
          contentPadding: const EdgeInsets.only(top: 15, left: 20),
          leading: const Icon(FontAwesomeIcons.userPen,
              size: 20, color: Colors.black),
          title: Text(
            "My Profile",
            style: TextStyle(
                fontSize: setSize(context, 17), fontWeight: FontWeight.w400),
          ),
          onTap: () {
            getProfileInfo(providervalue);
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfilePage()));
          },
        );
      },
    ),
  );
}



listTileResults(context) {
  return ListTile(
    style: ListTileStyle.drawer,
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading:
        const Icon(FontAwesomeIcons.listNumeric, size: 20, color: Colors.black),
    title: Text(
      "Results",
      style: TextStyle(
          fontSize: setSize(context, 17), fontWeight: FontWeight.w400),
    ),
    onTap: () async {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentResultsPage(),
          ));
    },
  );
}

listTileSchedule(context) {
  return ListTile(
    style: ListTileStyle.drawer,
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading: const Icon(FontAwesomeIcons.calendar,
        size: 20, color: Colors.black),
    title: Text(
      "Schedule",
      style: TextStyle(
          fontSize: setSize(context, 17), fontWeight: FontWeight.w400),
    ),
    onTap: () async {
    Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SemesterCalendar(),
          ));
    },
  );
}

ListTile listTileCourses(context) {
  return ListTile(
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading:
        const Icon(FontAwesomeIcons.book, size: 20, color: Colors.black),
    title: Text(
      "Courses",
      style: TextStyle(
          fontSize: setSize(context, 17), fontWeight: FontWeight.w400),
    ),
    onTap: () async {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentCoursesPage(),
          ));
    },
  );
}
