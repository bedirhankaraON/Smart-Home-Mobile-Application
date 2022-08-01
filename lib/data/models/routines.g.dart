// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routines.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Routines _$RoutinesFromJson(Map<String, dynamic> json) => Routines(
      shortDescription: json['shortDescription'] as String?,
      id: json['id'] as int,
      status: json['status'] as String?,
      days: (json['days'] as List<dynamic>?)?.map((e) => e as String).toList(),
      hour:
          json['hour'] == null ? null : DateTime.parse(json['hour'] as String),
      event: json['event'] as String?,
      deviceId: json['deviceId'] as int,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$RoutinesToJson(Routines instance) => <String, dynamic>{
      'id': instance.id,
      'deviceId': instance.deviceId,
      'name': instance.name,
      'status': instance.status,
      'shortDescription': instance.shortDescription,
      'days': instance.days,
      'hour': instance.hour?.toIso8601String(),
      'event': instance.event,
    };
