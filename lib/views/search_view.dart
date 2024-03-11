// import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

// import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:weather_app/cubit/get_weather_cubit/weather_cubit_cubit.dart';
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
            if (BlocProvider.of<GetWeatherFromSearchCubit>(context)
                .isSearched) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Scaffold(
                      body: BackGroundWidget(
                        childWidget: HomeViewBuilder(
                          weatherModel:
                              BlocProvider.of<GetWeatherFromSearchCubit>(
                                      context)
                                  .weatherInfo,
                          weatherPerDay:
                              BlocProvider.of<GetWeatherFromSearchCubit>(
                                      context)
                                  .weatherPerDay,
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 80, // Set the desired height
                    decoration: const BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16))),
                    child: const Center(
                      child: Text(
                        'Make a Search First',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              );
            }
          },
          child: const SearchWeatherCard(),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          "Tap To See More Information",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white54,
            fontSize: 10,
          ),
        )
      ],
    );
  }

  onTapCard(BuildContext context) {}
}
