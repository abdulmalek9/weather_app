import 'package:flutter/material.dart';
import 'package:weather_app/widgets/back_ground_widget.dart';
import 'package:weather_app/widgets/custom_bottom_nav_bar.dart';
import 'package:weather_app/widgets/home_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: BackGroundWidget(
            childWidget: HomeViewBuilder(),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: CustomButtomNavigationBar()),
      ]),
    );
  }
}
