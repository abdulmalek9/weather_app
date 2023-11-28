import 'package:flutter/material.dart';
import 'package:weather_app/widgets/back_ground_widget.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackGroundWidget(
        childWidget: Center(child: Text("Settings here")));
  }
}
