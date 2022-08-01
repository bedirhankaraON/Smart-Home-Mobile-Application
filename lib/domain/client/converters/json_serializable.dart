import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'json_serializable.g.dart';
part 'json_serializable.chopper.dart';

@JsonSerializable()
class Resource {
  Resource(this.id, this.name);
  final String id;
  final String name;

  static const fromJsonFactory = _$ResourceFromJson;

  Map<String, dynamic> toJson() => _$ResourceToJson(this);

  @override
  String toString() => 'Resource{id: $id, name: $name}';
}

@JsonSerializable()
class ResourceError {
  ResourceError(this.type, this.message);
  final String type;
  final String message;

  static const fromJsonFactory = _$ResourceErrorFromJson;

  Map<String, dynamic> toJson() => _$ResourceErrorToJson(this);
}

@ChopperApi(baseUrl: '/resources')
abstract class MyService extends ChopperService {
  static MyService create([ChopperClient? client]) => _$MyService(client);

  @Get(path: '/{id}/')
  Future<Response> getResource(@Path() String id);

  @Get(path: '/all', headers: {'test': 'list'})
  Future<Response<List<Resource>>> getResources();

  @Get(path: '/')
  Future<Response<Map>> getMapResource(@Query() String id);

  @Get(path: '/', headers: {'foo': 'bar'})
  Future<Response<Resource>> getTypedResource();

  @Post()
  Future<Response<Resource>> newResource(@Body() Resource resource, {@Header() String? name});
}
