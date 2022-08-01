// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chopper_client.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ApiService extends ApiService {
  _$ApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApiService;

  @override
  Future<Response<dynamic>> getCurrentWeather(
      String? lat, String? lon, String? appid) {
    final $url = '/data/2.5/weather';
    final $params = <String, dynamic>{'lat': lat, 'lon': lon, 'appid': appid};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
