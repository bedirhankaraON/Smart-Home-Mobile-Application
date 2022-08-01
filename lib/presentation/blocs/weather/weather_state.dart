part of 'weather_bloc.dart';

enum WeatherStatus { initial, filled }

class WeatherState extends Equatable {
  const WeatherState._({
    this.weather,
    this.weatherStatus = WeatherStatus.initial,
  });

  const WeatherState.initial() : this._();

  final Weather? weather;
  final WeatherStatus weatherStatus;

  WeatherState copyWith({
    Weather? weather,
    WeatherStatus? weatherStatus,
  }) =>
      WeatherState._(
        weather: weather ?? this.weather,
        weatherStatus: weatherStatus ?? this.weatherStatus,
      );

  @override
  List<Object?> get props => [
        weather,
        WeatherStatus,
      ];
}
