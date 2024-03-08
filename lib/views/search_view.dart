import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_from_search/get_weather_from_search_cubit.dart';
import 'package:weather_app/widgets/back_ground_widget.dart';
import 'package:weather_app/widgets/custom_search_bar.dart';
import 'package:weather_app/widgets/gps_weather_card.dart';
import 'package:weather_app/widgets/home_view_body_builder.dart';
import 'package:weather_app/widgets/search_weather_card.dart';

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
        const GpsWeatherCard(),
        const SizedBox(
          height: 16.0,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Scaffold(
                    body: BackGroundWidget(
                      childWidget: HomeViewBuilder(
                        weatherModel:
                            BlocProvider.of<GetWeatherFromSearchCubit>(context)
                                .weatherInfo,
                        weatherPerDay:
                            BlocProvider.of<GetWeatherFromSearchCubit>(context)
                                .weatherPerDay,
                      ),
                    ),
                  );
                },
              ),
            );
          },
          child: const SearchWeatherCard(),
        ),
      ],
    );
  }

  onTapCard(BuildContext context) {}
}
