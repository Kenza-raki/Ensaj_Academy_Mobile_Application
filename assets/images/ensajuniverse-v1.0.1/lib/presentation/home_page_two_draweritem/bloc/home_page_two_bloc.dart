import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ensajuniverse/presentation/home_page_two_draweritem/models/home_page_two_model.dart';
part 'home_page_two_event.dart';
part 'home_page_two_state.dart';

/// A bloc that manages the state of a HomePageTwo according to the event that is dispatched to it.
class HomePageTwoBloc extends Bloc<HomePageTwoEvent, HomePageTwoState> {
  HomePageTwoBloc(HomePageTwoState initialState) : super(initialState) {
    on<HomePageTwoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HomePageTwoInitialEvent event,
    Emitter<HomePageTwoState> emit,
  ) async {}
}
