// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Device _$DeviceFromJson(Map<String, dynamic> json) => Device(
      description: json['description'] as String?,
      id: json['id'] as int,
      status: json['status'] as String?,
      deviceModel: json['deviceModel'] as String?,
      deviceType: json['deviceType'] == null
          ? null
          : DeviceType.fromJson(json['deviceType'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'id': instance.id,
      'deviceType': instance.deviceType?.toJson(),
      'name': instance.name,
      'status': instance.status,
      'description': instance.description,
      'deviceModel': instance.deviceModel,
    };
