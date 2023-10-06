import 'package:flutter/material.dart';
import 'package:weather_app/widgets/back_ground_widget.dart';
import 'package:weather_app/widgets/home_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackGroundWidget(
        childWidget: HomeViewBuilder(),
      ),
    );
  }
}
