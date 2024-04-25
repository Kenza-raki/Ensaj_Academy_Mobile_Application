// ignore_for_file: must_be_immutable

part of 'log_in_bloc.dart';

/// Represents the state of LogIn in the application.
class LogInState extends Equatable {
  LogInState({
    this.emailController,
    this.passwordController,
    this.isShowPassword = true,
    this.rememberMe = false,
    this.logInModelObj,
  });

  TextEditingController? emailController;

  TextEditingController? passwordController;

  LogInModel? logInModelObj;

  bool isShowPassword;

  bool rememberMe;

  @override
  List<Object?> get props => [
        emailController,
        passwordController,
        isShowPassword,
        rememberMe,
        logInModelObj,
      ];

  LogInState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isShowPassword,
    bool? rememberMe,
    LogInModel? logInModelObj,
  }) {
    return LogInState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      rememberMe: rememberMe ?? this.rememberMe,
      logInModelObj: logInModelObj ?? this.logInModelObj,
    );
  }
}
