import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_search_bar.dart';
import 'package:weather_app/widgets/gps_weather_card.dart';
import 'package:weather_app/widgets/search_weather_card.dart';

class CustomSearchView extends StatelessWidget {
  const CustomSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 40,
        ),
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
        SizedBox(
          height: 16.0,
        ),
        GpsWeatherCard(),
        SizedBox(
          height: 16.0,
        ),
        SearchWeatherCard(),
      ],
    );
  }
}
