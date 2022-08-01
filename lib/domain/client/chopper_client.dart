import 'package:chopper/chopper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'chopper_client.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  static ApiService create({String? baseUrl}) {
    final client = ChopperClient(
      baseUrl: baseUrl ?? dotenv.get('BASE_URL'),
      services: [_$ApiService()],
      converter: JsonConverter(),
    );
    return _$ApiService(client);
  }

  @Get(path: '/data/2.5/weather')
  Future<Response> getCurrentWeather(
    @Query('lat') String? lat,
    @Query('lon') String? lon,
    @Query('appid') String? appid,
  );
}
