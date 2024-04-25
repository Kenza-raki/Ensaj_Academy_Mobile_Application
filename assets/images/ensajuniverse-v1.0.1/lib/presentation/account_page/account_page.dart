import 'package:ensajuniverse/widgets/custom_icon_button.dart';
import 'package:ensajuniverse/widgets/custom_elevated_button.dart';
import 'models/account_model.dart';
import 'package:flutter/material.dart';
import 'package:ensajuniverse/core/app_export.dart';
import 'bloc/account_bloc.dart';

// ignore_for_file: must_be_immutable
class AccountPage extends StatelessWidget {
  const AccountPage({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AccountBloc>(
      create: (context) => AccountBloc(AccountState(
        accountModelObj: AccountModel(),
      ))
        ..add(AccountInitialEvent()),
      child: AccountPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.gray5001,
            body: Container(
              width: double.maxFinite,
              decoration: AppDecoration.outlineGray7000a,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 1.v),
                  Container(
                    height: 42.v,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: appTheme.gray10001,
                    ),
                  ),
                  SizedBox(height: 19.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 22.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgMegaphone,
                            height: 29.v,
                            width: 37.h,
                            margin: EdgeInsets.only(bottom: 9.v),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 43.h),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "lbl_ensaj".tr,
                                    style:
                                        CustomTextStyles.headlineMediumff2b02d0,
                                  ),
                                  TextSpan(
                                    text: "lbl_universe".tr,
                                    style:
                                        CustomTextStyles.headlineMediumff000000,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 13.v),
                  SizedBox(
                    height: 111.v,
                    width: 118.h,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 111.v,
                            width: 118.h,
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 111.v,
                                    width: 118.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        59.h,
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment(0.5, 0.5),
                                        end: Alignment(0.51, 2),
                                        colors: [
                                          appTheme.deepPurple100,
                                          appTheme.green20000,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 5.h),
                                  child: CustomIconButton(
                                    height: 26.v,
                                    width: 28.h,
                                    padding: EdgeInsets.all(6.h),
                                    alignment: Alignment.bottomRight,
                                    child: CustomImageView(
                                      imagePath: ImageConstant.imgEdit,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgImage14,
                          height: 74.v,
                          width: 67.h,
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 10.v),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 23.v),
                  _buildPersonal(context),
                  SizedBox(height: 23.v),
                  _buildContact(context),
                  SizedBox(height: 17.v),
                  CustomElevatedButton(
                    text: "lbl_edit".tr,
                    margin: EdgeInsets.only(
                      left: 41.h,
                      right: 48.h,
                    ),
                  ),
                  SizedBox(height: 32.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 4.v,
                      width: 33.h,
                      margin: EdgeInsets.only(right: 24.h),
                      decoration: BoxDecoration(
                        color: appTheme.deepPurpleA200,
                        borderRadius: BorderRadius.circular(
                          2.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildPersonal(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 12.v,
      ),
      decoration: AppDecoration.outlineGreenA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder9,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "lbl_personal_info".tr,
              style: CustomTextStyles.titleMediumManropePrimaryContainer,
            ),
          ),
          SizedBox(height: 41.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: _buildOccupation(
              context,
              field: "lbl_your_name".tr,
              iSIC: "lbl_kouame_samya".tr,
            ),
          ),
          SizedBox(height: 28.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: _buildOccupation(
              context,
              field: "lbl_field".tr,
              iSIC: "lbl_isic".tr,
            ),
          ),
          SizedBox(height: 29.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: _buildOccupation(
              context,
              field: "lbl_cne".tr,
              iSIC: "lbl_r100125768".tr,
            ),
          ),
          SizedBox(height: 17.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildContact(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      padding: EdgeInsets.symmetric(
        horizontal: 14.h,
        vertical: 12.v,
      ),
      decoration: AppDecoration.outlineGreenA70019.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder9,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "lbl_contact_info".tr,
              style: CustomTextStyles.titleMediumManropePrimaryContainer,
            ),
          ),
          SizedBox(height: 41.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: _buildOccupation(
              context,
              field: "lbl_phone_number".tr,
              iSIC: "lbl_212_660488045".tr,
            ),
          ),
          SizedBox(height: 29.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: _buildOccupation(
              context,
              field: "lbl_email".tr,
              iSIC: "msg_kouamesamia_gmail_com".tr,
            ),
          ),
          SizedBox(height: 15.v),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildOccupation(
    BuildContext context, {
    required String field,
    required String iSIC,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          field,
          style: theme.textTheme.titleSmall!.copyWith(
            color: appTheme.gray800,
          ),
        ),
        Text(
          iSIC,
          style: CustomTextStyles.titleSmallPrimaryContainer.copyWith(
            color: theme.colorScheme.primaryContainer.withOpacity(1),
          ),
        ),
      ],
    );
  }
}
