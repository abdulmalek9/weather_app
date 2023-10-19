import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_bottom_nav_bar.dart';

// import 'package:weather_app/widgets/custom_bottom_nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomButtomNavigationBar(),
    );
  }
}
