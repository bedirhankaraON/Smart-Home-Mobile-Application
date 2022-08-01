import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:smartix/data/models/weather.dart';
import 'package:smartix/domain/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

@lazySingleton
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(const WeatherState.initial()) {
    on<WeatherFetched>(_onweatherFetched);
    on<WeatherStateReseted>(_onWeatherStateReseted);
  }

  Future<void> _onweatherFetched(WeatherFetched event, Emitter<WeatherState> emit) async => emit(
        state.copyWith(
          weather: event.weather,
          weatherStatus: WeatherStatus.filled,
        ),
      );

  Future<void> _onWeatherStateReseted(WeatherStateReseted event, Emitter<WeatherState> emit) async =>
      emit(const WeatherState.initial());

  Future<void> getCurrentWeather() async {
    final response = await WeatherRepository.getCurrentWeather();
    if (response != null) {
      add(WeatherFetched(response));
    }
  }
}
