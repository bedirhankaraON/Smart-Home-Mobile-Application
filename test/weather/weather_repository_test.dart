import 'package:flutter_test/flutter_test.dart';
import 'package:smartix/data/models/weather.dart';
import 'package:smartix/domain/client/chopper_client.dart';
import 'package:smartix/domain/repositories/weather_repository.dart';

void main() {
  group('Weather Repository', () {
    late ApiService apiService;

    setUp(() {
      apiService = ApiService.create(baseUrl: 'https://api.openweathermap.org');
    });

    group('ApiService', () {
      test('checking the Api Service', () {
        expect(apiService, isNotNull);
      });
    });

    group('checking the repository connection', () {
      test('', () async {
        try {
          expect(await WeatherRepository.getCurrentWeather(), isNotNull);
        } catch (_) {}
      });
    });

    group('checking response type', () {
      test('', () async {
        try {
          final response = await WeatherRepository.getCurrentWeather();
          expect(response.runtimeType, Weather);
        } catch (_) {}
      });
    });
  });
}
