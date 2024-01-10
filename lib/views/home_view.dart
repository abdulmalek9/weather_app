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
        return const HomeViewBuilder();
      }),
    );
  }
}
