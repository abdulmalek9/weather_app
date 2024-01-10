class WeatherModel {
  final String cityname;
  final String wetherState;
  final String? icon;
  final double maxTmp;
  final double minTmp;
  final double dayTemp; // List<double>
  final String dayHoures; //List<String>

  WeatherModel(
      {required this.cityname,
      required this.wetherState,
      this.icon,
      required this.maxTmp,
      required this.minTmp,
      required this.dayTemp,
      required this.dayHoures});

  factory WeatherModel.fromJson(data, String cityName) {
    return WeatherModel(
      cityname: cityName,
      wetherState: data['list'][0]['weather'][0]['main'],
      maxTmp: data['list'][0]['main']['temp_max'],
      minTmp: data['list'][0]['main']['temp_min'],
      dayTemp: data['list'][0]['main']['temp'],
      dayHoures: data['list'][0]['dt_txt'],
    );
  }
}
