import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather_app/cubit/switch_page_cubit/switch_page_cubit.dart';
import 'package:weather_app/widgets/custom_bottom_nav_bar.dart';

// import 'package:weather_app/widgets/custom_bottom_nav_bar.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomButtomNavigationBar(),
    );
  }
}
