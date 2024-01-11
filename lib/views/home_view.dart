import 'package:flutter/material.dart';
import 'package:weather_app/widgets/home_view_body_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/weather_cubit_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: BlocBuilder<WeatherCubitCubit, WeatherCubitState>(
          builder: (BuildContext context, WeatherCubitState state) {
        if (state is WeatherLoadedState) {
          return HomeViewBuilder(
            weatherModel:
                BlocProvider.of<WeatherCubitCubit>(context).weatherInfo,
          );
        } else if (state is WeatherCubitInitial) {
          return const Center(
            child: Text(
              'Make a Search of location To Get Information of Weather',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          );
        } else {
          return const Center(
            child: Text(
              'There is an error Try again, or cheack your internet connection',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          );
        }
      }),
    );
  }
}
