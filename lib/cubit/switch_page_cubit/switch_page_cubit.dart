import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/views/setting_view.dart';
import 'package:weather_app/views/home_view.dart';

part 'switch_page_state.dart';

class SwitchPageCubit extends Cubit<SwitchCubitState> {
  SwitchPageCubit() : super(InitialSearchPage());

  final List<Widget> tabs = [
    const HomeView(),
    const CustomSearchView(),
    const SettingView(),
  ];
}
