abstract class BaseException implements Exception {
  BaseException({this.customKeys});

  final Map<String, dynamic>? customKeys;
}
