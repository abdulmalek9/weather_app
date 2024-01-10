import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/weather_cubit_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/custom_search_bar.dart';
import 'package:weather_app/widgets/weather_card_widget.dart';

class CustomSearchView extends StatelessWidget {
  const CustomSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Weather",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        const CustomSearchbar(),
        const SizedBox(
          height: 16.0,
        ),
        BlocBuilder<WeatherCubitCubit, WeatherCubitState>(
          builder: (BuildContext context, WeatherCubitState state) {
            WeatherModel? weatherModel =
                BlocProvider.of<WeatherCubitCubit>(context).weatherInfo;
            if (state is WeatherLoadedState) {
              return CustomWeatherCard(
                location: "My Location",
                subTitle: weatherModel!.cityname,
                weatherState: weatherModel.wetherState, //"Mostly Cloudy",
                weatherImage: "assets/weather_pic/clouds1.jpg",
                tempValue: weatherModel.dayTemp.toString(), //"18",
                tempH: weatherModel.maxTmp.toString(), //"20",
                tempL: weatherModel.minTmp.toString(), //"13",
              );
            } else if (state is WeatherFailurState) {
              return const Center(
                child: Text(
                  "there is an error try agian",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text(
                  "Search of city to get weather",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              );
            }
          },
        ),
        const SizedBox(
          height: 16.0,
        ),
        // const CustomWeatherCard(
        //   location: "Homs",
        //   subTitle: "3:36 AM",
        //   weatherState: "Mostly Cloudy",
        //   weatherImage: "assets/weather_pic/clouds0.jpg",
        //   tempValue: "24",
        //   tempH: "28",
        //   tempL: "15",
        // ),
      ],
    );
  }
}
