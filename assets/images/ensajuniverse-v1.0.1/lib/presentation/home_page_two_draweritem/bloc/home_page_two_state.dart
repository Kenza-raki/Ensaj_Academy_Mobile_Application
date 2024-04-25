// ignore_for_file: must_be_immutable

part of 'home_page_two_bloc.dart';

/// Represents the state of HomePageTwo in the application.
class HomePageTwoState extends Equatable {
  HomePageTwoState({this.homePageTwoModelObj});

  HomePageTwoModel? homePageTwoModelObj;

  @override
  List<Object?> get props => [
        homePageTwoModelObj,
      ];

  HomePageTwoState copyWith({HomePageTwoModel? homePageTwoModelObj}) {
    return HomePageTwoState(
      homePageTwoModelObj: homePageTwoModelObj ?? this.homePageTwoModelObj,
    );
  }
}
