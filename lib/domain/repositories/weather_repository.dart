// ignore_for_file: avoid_dynamic_calls

import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smartix/core/util/util.dart';
import 'package:smartix/data/models/api_response_status.dart';
import 'package:smartix/data/models/weather.dart';
import 'package:smartix/domain/client/chopper_client.dart';

abstract class WeatherRepository {
  static Future<Weather?> getCurrentWeather() async {
    final service = ApiService.create(baseUrl: 'https://api.openweathermap.org');

    final response = await service.getCurrentWeather('51.5072', '0.1276', dotenv.get('API_KEY_WEATHER'));
    final status = handleApiStatusWithBaseResponse(response.base);

    if (status == ApiResponseStatus.successful) {
      final body = {
        'description': response.body['weather'].first['description'],
        'icon': 'http://openweathermap.org/img/wn/${response.body['weather'].first['icon']}@4x.png',
        'country': response.body['sys']['country'],
        'name': response.body['name'],
        'temp': (response.body['main']['temp'] - 273.15 as double).round().toString(),
      };
      return Weather.fromJson(body);
    } else {
      return null;
    }
  }
}
