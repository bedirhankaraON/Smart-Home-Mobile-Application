import 'package:http/http.dart' as http;
import 'package:smartix/data/models/api_response_status.dart';

ApiResponseStatus handleApiStatusWithBaseResponse(http.BaseResponse response) {
  if (response.statusCode >= 200 && response.statusCode <= 300 && response.statusCode != 204) {
    return ApiResponseStatus.successful;
  } else if (response.statusCode >= 400 && response.statusCode < 404) {
    return ApiResponseStatus.unauthorized;
  } else if (response.statusCode == 404) {
    return ApiResponseStatus.notFound;
  } else if (response.statusCode == 422) {
    return ApiResponseStatus.badRequest;
  } else if (response.statusCode >= 500 && response.statusCode <= 600) {
    return ApiResponseStatus.serverError;
  } else if (response.statusCode == 204) {
    return ApiResponseStatus.noContent;
  } else {
    return ApiResponseStatus.otherError;
  }
}
