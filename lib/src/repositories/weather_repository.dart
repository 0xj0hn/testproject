class WeatherRepository {
  Future<double> getWeatherTemp() async {
    final double temp = 20.2;
    await Future.delayed(Duration(seconds: 3));
    return temp;
  }
}
