import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/temp_value_builder.dart';

class WeatherDayInformation extends StatelessWidget {
  const WeatherDayInformation({super.key, required this.weatherModel});
  final WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      width: 74,
      height: 168,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        color: Color(0xff174370),
        border: GradientBoxBorder(
          width: 1.5,
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Color(0xff245181), Color(0xff4076c3)],
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 12,
          ),
          Text(
            weatherModel!.dayHoures.split(" ")[1].substring(0, 5),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Image.asset("assets/Cloudy.png"),
          TempValueBuilder(
            tembNum: weatherModel!.dayTemp.ceil().toString(), //"18",
            tempFormat: "C",
            isforSmall: false,
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
