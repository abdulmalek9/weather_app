import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/temp_info_per_dar.dart';
import 'package:weather_app/widgets/weather_day_info.dart';
import 'package:weather_app/widgets/weather_widget.dart';

class HomeViewBuilder extends StatelessWidget {
  const HomeViewBuilder({
    super.key,
    this.weatherModel,
  });
  final WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeatherWidget(
          cityTitle: weatherModel!.cityname, //"Damascuse"
          weatherTitle: weatherModel!.wetherState, //"Cloudy"
          weatherImage: "assets/Cloudy.png",
          tempr: weatherModel!.dayTemp.toString(), //"18"
        ),
        const SizedBox(
          height: 55,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 6.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Today",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WeatherDayInformation(),
            WeatherDayInformation(),
            WeatherDayInformation(),
            WeatherDayInformation(),
          ],
        ),
        const SizedBox(
          height: 24.0,
        ),
        const SectionTitle(),
        const SizedBox(
          height: 8.0,
        ),
        const Column(
          children: [
            TempInfoPerDay(
              day: "Today",
              weatherImage: "assets/Cloudy.png",
              tempMorningNum: '13',
              tempNightNum: "19",
            ),
            TempInfoPerDay(
              day: "Fri",
              weatherImage: "assets/Sunny.png",
              tempMorningNum: '13',
              tempNightNum: "19",
            ),
            TempInfoPerDay(
              day: "Sat",
              weatherImage: "assets/Partly_cloudy.png",
              tempMorningNum: '14',
              tempNightNum: "18",
            ),
          ],
        )
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.calendar_today_outlined,
          color: Colors.white,
          size: 16,
        ),
        SizedBox(
          width: 6.0,
        ),
        Text(
          "5-Day Forecast",
          style: TextStyle(color: Colors.white, fontSize: 16),
        )
      ],
    );
  }
}
