import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  Weather(
    this.name,
    this.description,
    this.country,
    this.icon,
    this.temp,
  );
  factory Weather.fromJson(final Map<String, dynamic> json) {
    return _$WeatherFromJson(json);
  }
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'country')
  final String country;
  @JsonKey(name: 'icon')
  final String icon;
  @JsonKey(name: 'temp')
  final String temp;

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
