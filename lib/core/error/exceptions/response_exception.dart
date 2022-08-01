import 'package:smartix/core/error/exceptions/base_exception.dart';
import 'package:smartix/data/models/response_error.dart';

class ResponseException extends BaseException {
  ResponseException(this.error, {Map<String, dynamic>? customKeys}) : super(customKeys: customKeys);

  final ResponseError error;
}
