import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/model/Auth_model.dart';
import 'package:delivery_food/model/Error.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<ApiResult> getauthCode(String phone) async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    AuthResponse? calendar;
    ErrorResponse? error;
    AuthStatus? status;
    Uri url = Uri.http(
        '${statusCode.url1}', '/api/public/auth/get-code', {'phone': phone});

    try {
      var response = await http.get(url);
      log('${response.body}', name: 'response body auth ');
      var responsebode = jsonDecode(response.body);

      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = AuthStatus.fromJson(responsebode['status']);
        if (responsebode['response'] != null) {
          calendar = AuthResponse.fromJson(responsebode['response']);

          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Server error Please try again');
      } else {
        status = AuthStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print(' error Please try again');
      }
    } on SocketException {
      apiResult.errorMassage = 'Make sure you are connected to the internet';
      apiResult.codeError = statusCode.connection;
      apiResult.hasError = true;
      print('Make sure you are connected to the internet');
    } on FormatException {
      apiResult.errorMassage = 'There is a problem with the admin';
      apiResult.codeError = statusCode.parsing;
      apiResult.hasError = true;
      print('There is a problem with the admin');
    } catch (e) {
      apiResult.errorMassage = '${e}';
      apiResult.codeError = statusCode.connection;
      apiResult.hasError = true;
      print('${e}');
    }
    return apiResult;
  }
}
