import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/weather_cubit_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/temp_info_per_dar.dart';
import 'package:weather_app/widgets/weather_day_info.dart';
import 'package:weather_app/widgets/weather_widget.dart';

class HomeViewBuilder extends StatelessWidget {
  const HomeViewBuilder({
    super.key,
    this.weatherModel,
    required this.weatherPerDay,
  });
  // final WeatherModel? weatherModel;
  final List<WeatherModel>? weatherModel;
  final Map<String, List<WeatherModel>> weatherPerDay;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeatherWidget(
          cityTitle: weatherModel![0].cityname, //"Damascuse"
          weatherTitle: weatherModel![0].wetherState, //"Cloudy"
          weatherImage: "assets/Cloudy.png",
          tempr: weatherModel![0].dayTemp.ceil().toString(), //"18"
        ),
        const SizedBox(
          height: 35,
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
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WeatherDayInformation(weatherModel: weatherModel![0]),
            weatherModel!.isEmpty
                ? WeatherDayInformation(weatherModel: weatherModel![1])
                : const SizedBox(),
            weatherModel!.length >= 2
                ? WeatherDayInformation(weatherModel: weatherModel![2])
                : const SizedBox(),
            weatherModel!.length >= 3
                ? WeatherDayInformation(weatherModel: weatherModel![3])
                : const SizedBox(),
          ],
        ),
        const SizedBox(
          height: 18.0,
        ),
        const SectionTitle(),
        const SizedBox(
          height: 6.0,
        ),
        Column(
          children: [
            TempInfoPerDay(
              day: "Today",
              weatherImage: "assets/Cloudy.png",
              tempMorningNum:
                  weatherPerDay["day 1"]![0].minTmp.ceil().toString(), //'13',
              tempNightNum:
                  weatherPerDay["day 1"]![weatherPerDay["day 1"]!.length - 1]
                      .maxTmp
                      .ceil()
                      .toString(),
            ),
            TempInfoPerDay(
                day: BlocProvider.of<WeatherCubitCubit>(context).getDayName(
                    date: weatherPerDay["day 2"]![0].dayHoures), //"Fri",
                weatherImage: "assets/Sunny.png",
                tempMorningNum:
                    weatherPerDay["day 2"]![0].minTmp.ceil().toString(), //'13',
                tempNightNum:
                    weatherPerDay["day 2"]![weatherPerDay["day 2"]!.length - 1]
                        .maxTmp
                        .ceil()
                        .toString()),
            TempInfoPerDay(
                day: BlocProvider.of<WeatherCubitCubit>(context)
                    .getDayName(date: weatherPerDay["day 3"]![0].dayHoures),
                weatherImage: "assets/Partly_cloudy.png",
                tempMorningNum:
                    weatherPerDay["day 3"]![0].minTmp.ceil().toString(), //'13',
                tempNightNum:
                    weatherPerDay["day 3"]![weatherPerDay["day 3"]!.length - 1]
                        .maxTmp
                        .ceil()
                        .toString()),
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
