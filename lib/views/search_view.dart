import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_search_bar.dart';

class CustomSearchView extends StatelessWidget {
  const CustomSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Weather",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        CustomSearchbar(),
      ],
    );
  }
}
