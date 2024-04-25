import 'package:flutter/material.dart';

import '../../reusableWidgets/Responsive.dart';
import '../../reusableWidgets/appBar.dart';
import '../../reusableWidgets/topBar/topBarStudent.dart';
import '../navigationDrawer/drawerMain.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'widgets.dart';
import 'sports.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _StudentHomeState();
}


int _currentIndex = 0;
ScrollController _scrollController = ScrollController();

class _StudentHomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: ResponsiveWidget.isLargeScreen(context)
          ? PreferredSize(preferredSize: Size(screenWidth(context), 70), child: const TopBarStudent())
          : appBarWithLogout(context, "Ensaj UniVerse"),
      drawer: navigationDrawerStudent(context),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SportCenterListView(key: UniqueKey(), size: _size),
            ],
          ),
        ),
      ),
    );
  }
}