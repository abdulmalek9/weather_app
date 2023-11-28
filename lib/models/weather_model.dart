class WeatherModel {
  final String cityname;
  final String wetherState;
  final String? icon;
  final String maxTmp;
  final String minTmp;
  final List<String> dayTemp;
  final List<String> dayHoures;

  WeatherModel(
      {required this.cityname,
      required this.wetherState,
      this.icon,
      required this.maxTmp,
      required this.minTmp,
      required this.dayTemp,
      required this.dayHoures});

  factory WeatherModel.fromjson(data) {
    return WeatherModel(
      cityname: data,
      wetherState: data['list'][0]['weather'][0]['main'],
      maxTmp: data['list'][0]['main']['temp_max'],
      minTmp: data['list'][0]['main']['temp_min'],
      dayTemp: data['list'][0]['main']['temp'],
      dayHoures: data['list'][0]['dt_txt'],
    );
  }
}
