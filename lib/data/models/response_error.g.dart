// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseError _$ResponseErrorFromJson(Map<String, dynamic> json) =>
    ResponseError(
      statusCode: json['statusCode'] as int,
      isError: json['isError'] as bool,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$ResponseErrorToJson(ResponseError instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'errorMessage': instance.errorMessage,
    };
