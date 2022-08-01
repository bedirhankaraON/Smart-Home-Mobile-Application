part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class WeatherFetched extends WeatherEvent {
  const WeatherFetched(this.weather);

  final Weather weather;

  @override
  List<Object> get props => [weather];
}

class WeatherStateReseted extends WeatherEvent {}
