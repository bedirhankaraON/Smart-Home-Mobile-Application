import 'package:equatable/equatable.dart';
import 'package:smartix/core/error/exceptions/internal_exception.dart';
import 'package:smartix/core/error/exceptions/json_type_parser_exception.dart';
import 'package:smartix/core/error/exceptions/response_exception.dart';
import 'package:smartix/core/error/exceptions/validation_exception.dart';
import 'package:smartix/core/error/generic_failure.dart';
import 'package:smartix/core/error/internal_failure.dart';
import 'package:smartix/core/error/invalid_failure.dart';
import 'package:smartix/core/error/response_failure.dart';

abstract class Failure extends Equatable {
  const Failure({
    required this.message,
  });

  factory Failure.fromException(Exception e) {
    switch (e.runtimeType) {
      case ResponseException:
        e as ResponseException;
        return ResponseFailure(
          errorStatus: e.error.statusCode,
          message: e.error.errorMessage ?? '',
        );
      case JsonFactoryNotRegisteredException:
      case InternalException:
        return const InternalFailure();
      case ValidationException:
        return const InvalidValueFailure();
      default:
        return const GenericFailure();
    }
  }

  final String message;

  @override
  String toString() => '$message Failure';

  @override
  List<Object?> get props => [];
}
