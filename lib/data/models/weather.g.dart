// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      json['name'] as String,
      json['description'] as String,
      json['country'] as String,
      json['icon'] as String,
      json['temp'] as String,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'country': instance.country,
      'icon': instance.icon,
      'temp': instance.temp,
    };
