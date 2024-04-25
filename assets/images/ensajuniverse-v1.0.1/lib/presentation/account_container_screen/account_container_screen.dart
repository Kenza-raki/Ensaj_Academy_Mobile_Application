import 'package:ensajuniverse/presentation/account_page/account_page.dart';
import 'package:ensajuniverse/widgets/custom_bottom_bar.dart';
import 'models/account_container_model.dart';
import 'package:flutter/material.dart';
import 'package:ensajuniverse/core/app_export.dart';
import 'bloc/account_container_bloc.dart';

// ignore_for_file: must_be_immutable
class AccountContainerScreen extends StatelessWidget {
  AccountContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<AccountContainerBloc>(
        create: (context) => AccountContainerBloc(AccountContainerState(
            accountContainerModelObj: AccountContainerModel()))
          ..add(AccountContainerInitialEvent()),
        child: AccountContainerScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountContainerBloc, AccountContainerState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: appTheme.gray5001,
              body: Navigator(
                  key: navigatorKey,
                  initialRoute: AppRoutes.accountPage,
                  onGenerateRoute: (routeSetting) => PageRouteBuilder(
                      pageBuilder: (ctx, ani, ani1) =>
                          getCurrentPage(context, routeSetting.name!),
                      transitionDuration: Duration(seconds: 0))),
              bottomNavigationBar: _buildBottomBar(context)));
    });
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.accountPage;
      case BottomBarEnum.Search:
        return "/";
      case BottomBarEnum.Qrscan:
        return "/";
      case BottomBarEnum.Notifications:
        return "/";
      case BottomBarEnum.Account:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.accountPage:
        return AccountPage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
