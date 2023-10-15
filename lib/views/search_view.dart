import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_search_bar.dart';
import 'package:weather_app/widgets/weather_card_widget.dart';

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
        SizedBox(
          height: 16.0,
        ),
        CustomWeatherCard(
          location: "My Location",
          subTitle: "Damascuse",
          weatherState: "Mostly Cloudy",
          weatherImage: "assets/weather_pic/clouds1.jpg",
          tempValue: "18",
          tempH: "20",
          tempL: "13",
        )
      ],
    );
  }
}
