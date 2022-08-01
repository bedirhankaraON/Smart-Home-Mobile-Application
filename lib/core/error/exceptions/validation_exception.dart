
import 'package:fluent_validator/results/validation_result.dart';
import 'package:smartix/core/error/exceptions/base_exception.dart';

class ValidationException<T> extends BaseException {
  ValidationException(this.validationResult, {Map<String, dynamic>? customKeys}) : super(customKeys: customKeys);

  final ValidationResult validationResult;
  final type = T.runtimeType;
}
