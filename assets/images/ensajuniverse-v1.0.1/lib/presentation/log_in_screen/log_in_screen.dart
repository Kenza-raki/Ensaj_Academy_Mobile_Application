import 'package:ensajuniverse/core/utils/validation_functions.dart';
import 'package:ensajuniverse/widgets/custom_text_form_field.dart';
import 'package:ensajuniverse/widgets/custom_checkbox_button.dart';
import 'package:ensajuniverse/widgets/custom_outlined_button.dart';
import 'models/log_in_model.dart';
import 'package:flutter/material.dart';
import 'package:ensajuniverse/core/app_export.dart';
import 'bloc/log_in_bloc.dart';
import 'package:ensajuniverse/domain/googleauth/google_auth_helper.dart';

// ignore_for_file: must_be_immutable
class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LogInBloc>(
        create: (context) => LogInBloc(LogInState(logInModelObj: LogInModel()))
          ..add(LogInInitialEvent()),
        child: LogInScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(horizontal: 38.h),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                          height: 167.v,
                                          width: 202.h,
                                          margin: EdgeInsets.only(left: 49.h),
                                          child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: RichText(
                                                        text:
                                                            TextSpan(children: [
                                                          TextSpan(
                                                              text: "lbl_ensaj"
                                                                  .tr,
                                                              style: CustomTextStyles
                                                                  .headlineMediumff2b02d0),
                                                          TextSpan(
                                                              text:
                                                                  "lbl_universe"
                                                                      .tr,
                                                              style: CustomTextStyles
                                                                  .headlineMediumff000000)
                                                        ]),
                                                        textAlign:
                                                            TextAlign.left)),
                                                CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgBlackAndOrange,
                                                    height: 167.v,
                                                    width: 202.h,
                                                    alignment: Alignment.center)
                                              ]))),
                                  SizedBox(height: 31.v),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 6.h),
                                          child: Text("lbl_email".tr,
                                              style: CustomTextStyles
                                                  .titleSmallPoppinsPrimaryContainer))),
                                  SizedBox(height: 6.v),
                                  _buildEmail(context),
                                  SizedBox(height: 19.v),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 6.h),
                                          child: Text("lbl_password".tr,
                                              style: CustomTextStyles
                                                  .titleSmallPoppinsPrimaryContainer))),
                                  SizedBox(height: 5.v),
                                  _buildPassword(context),
                                  SizedBox(height: 25.v),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 6.h),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            _buildRememberMe(context),
                                            Text("msg_forgot_password".tr,
                                                style: CustomTextStyles
                                                    .titleSmallRed500)
                                          ])),
                                  SizedBox(height: 31.v),
                                  _buildLogIn(context),
                                  SizedBox(height: 58.v),
                                  _buildEightySix(context),
                                  SizedBox(height: 32.v),
                                  _buildLoginWithGoogle(context),
                                  SizedBox(height: 20.v),
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 26.h),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 1.v),
                                                child: Text(
                                                    "msg_don_t_have_an_account"
                                                        .tr,
                                                    style: CustomTextStyles
                                                        .bodyLargePoppinsBlack900)),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5.h),
                                                child: Text("lbl_sign_up".tr,
                                                    style: CustomTextStyles
                                                        .bodyLargePoppinsPrimary
                                                        .copyWith(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline)))
                                          ])),
                                  SizedBox(height: 5.v)
                                ])))))));
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return BlocSelector<LogInBloc, LogInState, TextEditingController?>(
        selector: (state) => state.emailController,
        builder: (context, emailController) {
          return CustomTextFormField(
              controller: emailController,
              hintText: "msg_example_gmail_com".tr,
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || (!isValidEmail(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_email".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return BlocBuilder<LogInBloc, LogInState>(builder: (context, state) {
      return CustomTextFormField(
          controller: state.passwordController,
          hintText: "msg_enter_your_password".tr,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          suffix: InkWell(
              onTap: () {
                context.read<LogInBloc>().add(ChangePasswordVisibilityEvent(
                    value: !state.isShowPassword));
              },
              child: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 17.v, 15.h, 13.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgEyeIcon,
                      height: 18.adaptSize,
                      width: 18.adaptSize))),
          suffixConstraints: BoxConstraints(maxHeight: 48.v),
          validator: (value) {
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
          obscureText: state.isShowPassword,
          contentPadding: EdgeInsets.only(left: 17.h, top: 13.v, bottom: 13.v));
    });
  }

  /// Section Widget
  Widget _buildRememberMe(BuildContext context) {
    return BlocSelector<LogInBloc, LogInState, bool?>(
        selector: (state) => state.rememberMe,
        builder: (context, rememberMe) {
          return CustomCheckboxButton(
              text: "lbl_remember_me".tr,
              value: rememberMe,
              onChange: (value) {
                context
                    .read<LogInBloc>()
                    .add(ChangeCheckBoxEvent(value: value));
              });
        });
  }

  /// Section Widget
  Widget _buildLogIn(BuildContext context) {
    return CustomOutlinedButton(text: "lbl_log_in".tr);
  }

  /// Section Widget
  Widget _buildEightySix(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 11.v, bottom: 8.v),
              child: SizedBox(width: 90.h, child: Divider())),
          Text("msg_or_continue_with".tr, style: theme.textTheme.bodyMedium),
          Padding(
              padding: EdgeInsets.only(top: 11.v, bottom: 8.v),
              child: SizedBox(width: 90.h, child: Divider()))
        ]);
  }

  /// Section Widget
  Widget _buildLoginWithGoogle(BuildContext context) {
    return CustomOutlinedButton(
        text: "msg_login_with_google".tr,
        leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.h)),
            child: CustomImageView(
                imagePath: ImageConstant.imgGoogleLogo,
                height: 26.adaptSize,
                width: 26.adaptSize)),
        buttonStyle: CustomButtonStyles.outlinePrimaryContainer,
        buttonTextStyle: CustomTextStyles.titleMediumPoppinsPrimaryContainer,
        onPressed: () {
          onTapLoginWithGoogle(context);
        });
  }

  onTapLoginWithGoogle(BuildContext context) async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('user data is empty')));
      }
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }
}
