// import 'dart:developer';

import 'package:flutter/material.dart';

class WeatherModel {
  final String cityname;
  final String wetherState;
  final String? icon;
  final int maxTmp;
  final int minTmp;
  final int dayTemp; // List<double>
  final String dayHoures; //List<String>

  WeatherModel(
      {required this.cityname,
      required this.wetherState,
      this.icon,
      required this.maxTmp,
      required this.minTmp,
      required this.dayTemp,
      required this.dayHoures});

  factory WeatherModel.fromJson(data, {int dayNumber = 0}) {
    return WeatherModel(
      cityname: data['city']['name'].toString().split(" ")[0],
      wetherState: data['list'][dayNumber]['weather'][0]['main'],
      maxTmp: data['list'][dayNumber]['main']['temp_max'].ceil(),
      minTmp: data['list'][dayNumber]['main']['temp_min'].ceil(),
      dayTemp: data['list'][dayNumber]['main']['temp'].ceil(),
      dayHoures: data['list'][dayNumber]['dt_txt'],
    );
  }
  String getImage() {
    int time = DateTime.parse(dayHoures).hour;
    // log("Time is : ============ ${DateTime.parse(dayHoures).hour}");
    if (wetherState == 'Clear') {
      return ((time >= 12) && (time < 18))
          ? 'assets/Sunny.png'
          : 'assets/Clear.png';
    } else if (wetherState == 'Light Cloud') {
      return 'assets/Partly_cloudy.png';
    } else if (wetherState == 'Sleet') {
      return 'assets/sleet.png';
    } else if (wetherState == 'Snow' || wetherState == 'Hail') {
      return 'assets/heavy_snow.png';
    } else if (wetherState == 'Heavy Cloud') {
      return 'assets/Cloudy.png';
    } else if (wetherState == 'Light Rain' ||
        wetherState == 'Heavy Rain' ||
        wetherState == 'Showers	') {
      return 'assets/rainy.png';
    } else if (wetherState == 'Thunderstorm' || wetherState == 'Thunder') {
      return 'assets/thunder.png';
    } else {
      return ((time >= 12) && (time < 18))
          ? 'assets/Sunny.png'
          : 'assets/Clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (wetherState == 'Clear' || wetherState == 'Light Cloud') {
      return Colors.orange;
    } else if (wetherState == 'Sleet' ||
        wetherState == 'Snow' ||
        wetherState == 'Hail') {
      return Colors.blue;
    } else if (wetherState == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (wetherState == 'Light Rain' ||
        wetherState == 'Heavy Rain' ||
        wetherState == 'Showers	') {
      return Colors.blue;
    } else if (wetherState == 'Thunderstorm' || wetherState == 'Thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
