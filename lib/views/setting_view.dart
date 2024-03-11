import 'package:flutter/material.dart';
import 'package:weather_app/widgets/back_ground_widget.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackGroundWidget(
        childWidget: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 165,
        ),
        Text(
          "We will add some Settings in Future",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ],
    ));
  }
}
