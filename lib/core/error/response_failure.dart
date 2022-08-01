
import 'package:smartix/core/error/failure.dart';

class ResponseFailure extends Failure {
  const ResponseFailure({
    required this.errorStatus,
    required String message,
  }) : super(message: message);

  final int errorStatus;
}