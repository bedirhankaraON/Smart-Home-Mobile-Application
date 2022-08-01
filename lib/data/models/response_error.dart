import 'package:json_annotation/json_annotation.dart';

part 'response_error.g.dart';

@JsonSerializable()
class ResponseError {
  ResponseError({
    required this.statusCode,
    required this.isError,
    required this.errorMessage,
  });

  final int statusCode;
  final bool isError;
  final String? errorMessage;

  Map<String, dynamic> toJson() => _$ResponseErrorToJson(this);

  static const fromJsonFactory = _$ResponseErrorFromJson;
}
