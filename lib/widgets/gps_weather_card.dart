import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/weather_cubit_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/weather_card_widget.dart';

class GpsWeatherCard extends StatelessWidget {
  const GpsWeatherCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubitCubit, WeatherCubitState>(
      builder: (BuildContext context, WeatherCubitState state) {
        //WeatherModel? weatherModel =
        List<WeatherModel>? weatherModel =
            BlocProvider.of<WeatherCubitCubit>(context).weatherInfo;
        if (state is WeatherLoadedState) {
          return CustomWeatherCard(
            location: "My Location",
            subTitle: weatherModel![0].cityname,
            weatherState: weatherModel[0].wetherState, //"Mostly Cloudy"
            weatherImage: "assets/weather_pic/clouds1.jpg",
            tempValue: weatherModel[0].dayTemp.ceil().toString(), //"18"
            tempH: weatherModel[0].maxTmp.ceil().toString(), //"20",
            tempL: weatherModel[0].minTmp.ceil().toString(), //"13",
          );
        } else if (state is WeatherFailurState) {
          return const CustomWeatherCard(
            location: "Ops...",
            subTitle: "There was an error please try again",
            weatherState: "",
            tempValue: "",
            tempH: "",
            tempL: "",
            weatherImage: "assets/weather_pic/clouds1.jpg",
          );
        } else {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        }
      },
    );
  }
}
