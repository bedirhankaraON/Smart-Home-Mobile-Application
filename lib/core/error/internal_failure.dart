import 'package:smartix/core/error/failure.dart';

class InternalFailure extends Failure {
  const InternalFailure({String? message})
      : super(message: message ?? 'InternalFailure');
}
