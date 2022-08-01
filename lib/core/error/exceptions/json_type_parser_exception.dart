import 'package:smartix/core/error/exceptions/internal_exception.dart';

class JsonFactoryNotRegisteredException extends InternalException {
  JsonFactoryNotRegisteredException({this.message = ''});

  final String message;
}
