import 'package:flutter/material.dart';
import '../presentation/log_in_screen/log_in_screen.dart';
import '../presentation/account_container_screen/account_container_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String logInScreen = '/log_in_screen';

  static const String accountPage = '/account_page';

  static const String accountContainerScreen = '/account_container_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        logInScreen: LogInScreen.builder,
        accountContainerScreen: AccountContainerScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: LogInScreen.builder
      };
}
