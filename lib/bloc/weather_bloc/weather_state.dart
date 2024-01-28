import '../../models/weather_model.dart';

abstract class weatherState {}

class weatherInit extends weatherState {}

class weatherLoading extends weatherState {}

class weatherSuccess extends weatherState {
  WeatherModel weatherModel;
  weatherSuccess({required this.weatherModel});
}

class weatherfailure extends weatherState {}
