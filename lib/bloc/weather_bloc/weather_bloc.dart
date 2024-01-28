import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<weatherState> {
  WeatherCubit(this.weatherService) : super(weatherInit());
  WeatherService weatherService;
  String? cityName;
  WeatherModel? weatherModel;
  Future<void> getWeather({required String cityName}) async {
    emit(weatherLoading());
    try {
       weatherModel =
          await weatherService.getWeather(cityName: cityName);
      emit(weatherSuccess(weatherModel: weatherModel!));
    } on Exception catch (e) {
      emit(weatherfailure());
    }
  }
}
