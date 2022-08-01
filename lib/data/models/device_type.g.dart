// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceType _$DeviceTypeFromJson(Map<String, dynamic> json) => DeviceType(
      iconSize: (json['iconSize'] as num?)?.toDouble(),
      fontFamily: json['fontFamily'] as String,
      icon: json['icon'] as int,
      type: json['type'] as String,
    );

Map<String, dynamic> _$DeviceTypeToJson(DeviceType instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'fontFamily': instance.fontFamily,
      'type': instance.type,
      'iconSize': instance.iconSize,
    };
