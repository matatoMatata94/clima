class WeatherData {
  final int conditionID;
  final String cityName;
  final double temperature;

  const WeatherData({
    required this.conditionID,
    required this.cityName,
    required this.temperature,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      conditionID: json['weather'][0]['id'],
      cityName: json['name'],
      temperature: json['main']['temp'],
    );
  }
}
