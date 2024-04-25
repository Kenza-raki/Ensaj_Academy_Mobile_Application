import 'package:flutter/material.dart';

import '../../reusableWidgets/Responsive.dart';
import '../../reusableWidgets/drawerHeading.dart';
import 'drawerBody.dart';

Drawer navigationDrawerStudent(context) {
  return Drawer(
    elevation: 20,
    width: screenWidth(context) / 1.6,
    child: SingleChildScrollView(
      child: Column(
        children: [
          drawerHeader(context),
          listTileHome(context),
          listTileqrcode(context),
          listTileCourses(context),
          listTileSchedule(context),
          listTileResults(context),
          listTileMyQuiz(context),
          listTileCheckScore(context),
          
          listTileProfile(context),
          
          
          
        ],
      ),
    ),
  );
}
