import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_from_search/get_weather_from_search_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/weather_card_widget.dart';

class SearchWeatherCard extends StatelessWidget {
  const SearchWeatherCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherFromSearchCubit, GetWeatherFromSearchState>(
      builder: (BuildContext context, GetWeatherFromSearchState state) {
        //WeatherModel? weatherModel =
        List<WeatherModel>? weatherModel =
            BlocProvider.of<GetWeatherFromSearchCubit>(context).weatherInfo;
        if (state is GetWeatherLoadedState) {
          return CustomWeatherCard(
            location: "City Name:",
            subTitle: weatherModel![0].cityname,
            weatherState: weatherModel[0].wetherState, //"Mostly Cloudy"
            weatherImage: "assets/weather_pic/clouds0.jpg",
            tempValue: weatherModel[0].dayTemp.ceil().toString(), //"18"
            tempH: weatherModel[0].maxTmp.ceil().toString(), //"20",
            tempL: weatherModel[0].minTmp.ceil().toString(), //"13",
          );
        } else if (state is GetWeatherFailurState) {
          return const CustomWeatherCard(
            location: "Ops...",
            subTitle: "There was an error please try again",
            weatherState: "",
            tempValue: "",
            tempH: "",
            tempL: "",
            weatherImage: "assets/weather_pic/clouds0.jpg",
          );
        } else {
          return const CustomWeatherCard(
            location: "Search For City",
            subTitle: "To get The Information",
            weatherState: "",
            tempValue: "",
            tempH: "",
            tempL: "",
            weatherImage: "assets/weather_pic/clouds0.jpg",
          );
        }
      },
    );
  }
}
