import 'package:flutter/material.dart';
import 'package:weather_app/widgets/temp_info_per_dar.dart';
import 'package:weather_app/widgets/weather_day_info.dart';
import 'package:weather_app/widgets/weather_widget.dart';

class HomeViewBuilder extends StatelessWidget {
  const HomeViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        WeatherWidget(
          cityTitle: "Damascuse",
          weatherTitle: "Cloudy",
          weatherImage: "assets/Cloudy.png",
          tempr: "18",
        ),
        SizedBox(
          height: 55,
        ),
        Padding(
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
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WeatherDayInformation(),
            WeatherDayInformation(),
            WeatherDayInformation(),
            WeatherDayInformation(),
          ],
        ),
        SizedBox(
          height: 24.0,
        ),
        Row(
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
        ),
        SizedBox(
          height: 8.0,
        ),
        Column(
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
