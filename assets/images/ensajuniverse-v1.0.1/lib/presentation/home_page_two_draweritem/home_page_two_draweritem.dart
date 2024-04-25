import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:ensajuniverse/core/app_export.dart';
import 'bloc/home_page_two_bloc.dart';

// ignore_for_file: must_be_immutable
class HomePageTwoDraweritem extends StatelessWidget {
  const HomePageTwoDraweritem({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: OutlineGradientButton(
        padding: EdgeInsets.only(
          left: 1.h,
          top: 1.v,
          right: 1.h,
          bottom: 1.v,
        ),
        strokeWidth: 1.h,
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.primaryContainer.withOpacity(0.2),
            theme.colorScheme.primaryContainer.withOpacity(0.2),
          ],
        ),
        corners: Corners(
          topLeft: Radius.circular(9),
          topRight: Radius.circular(9),
          bottomLeft: Radius.circular(9),
          bottomRight: Radius.circular(9),
        ),
        child: Container(
          width: 169.h,
          padding: EdgeInsets.symmetric(
            horizontal: 8.h,
            vertical: 19.v,
          ),
          decoration: AppDecoration.outline.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder9,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgBlackAndOrange58x140,
                height: 58.v,
                width: 140.h,
                alignment: Alignment.centerRight,
              ),
              SizedBox(height: 23.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 23.h,
                  right: 20.h,
                ),
                child: _buildContent(
                  context,
                  uCalender: ImageConstant.imgUCreateDashboard,
                  label: "lbl_resultats".tr,
                ),
              ),
              SizedBox(height: 35.v),
              Padding(
                padding: EdgeInsets.only(left: 23.h),
                child: _buildContent1(
                  context,
                  uSetting: ImageConstant.imgUBox,
                  label: "lbl_courses".tr,
                ),
              ),
              SizedBox(height: 35.v),
              Padding(
                padding: EdgeInsets.only(left: 23.h),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgUAnalysis,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.h),
                      child: Text(
                        "lbl_quizs".tr,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 23.h,
                  right: 20.h,
                ),
                child: _buildContent(
                  context,
                  uCalender: ImageConstant.imgUCalender,
                  label: "lbl_schedule".tr,
                ),
              ),
              Spacer(
                flex: 54,
              ),
              Padding(
                padding: EdgeInsets.only(left: 23.h),
                child: _buildContent1(
                  context,
                  uSetting: ImageConstant.imgUSetting,
                  label: "lbl_settings".tr,
                ),
              ),
              SizedBox(height: 34.v),
              Padding(
                padding: EdgeInsets.only(left: 23.h),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgUSignOutAlt,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.h),
                      child: Text(
                        "lbl_about".tr,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35.v),
              Padding(
                padding: EdgeInsets.only(left: 23.h),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgUSignOutAlt,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      margin: EdgeInsets.only(bottom: 1.v),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.h),
                      child: Text(
                        "lbl_logout".tr,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 45,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildContent(
    BuildContext context, {
    required String uCalender,
    required String label,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: uCalender,
          height: 20.adaptSize,
          width: 20.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text(
            label,
            style: theme.textTheme.titleMedium!.copyWith(
              color: appTheme.blueGray800,
            ),
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildContent1(
    BuildContext context, {
    required String uSetting,
    required String label,
  }) {
    return Row(
      children: [
        CustomImageView(
          imagePath: uSetting,
          height: 20.adaptSize,
          width: 20.adaptSize,
          margin: EdgeInsets.only(bottom: 1.v),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text(
            label,
            style: theme.textTheme.titleMedium!.copyWith(
              color: appTheme.blueGray800,
            ),
          ),
        ),
      ],
    );
  }
}
