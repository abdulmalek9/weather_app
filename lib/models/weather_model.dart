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

  factory WeatherModel.fromJson(data, {int dayNumber = 0}) {
    return WeatherModel(
      cityname: data['city']['name'].toString().split(" ")[0],
      wetherState: data['list'][dayNumber]['weather'][0]['main'],
      maxTmp: data['list'][dayNumber]['main']['temp_max'],
      minTmp: data['list'][dayNumber]['main']['temp_min'],
      dayTemp: data['list'][dayNumber]['main']['temp'],
      dayHoures: data['list'][dayNumber]['dt_txt'],
    );
  }
}
