import 'dart:convert';
import 'dart:io';

import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Auth_controller.dart';
import 'package:http/http.dart' as http;

class ReturnResponse {
  AuthController authController = AuthController();

  returnResponse(http.Response response) async {
    StatusCode statusCode = StatusCode();
    print(response.statusCode);
    if (response.statusCode == statusCode.OK ||
        response.statusCode == statusCode.CREATED) {
      var responsebode = jsonDecode(response.body);
      return responsebode;
    } else if (response.statusCode == statusCode.BAD_REQUEST) {
      print('A bad request Please try again');
    } else if (response.statusCode == statusCode.UNAUTHORIZED) {
      await authController.postrefreshToken();
      print('A bad request Please try again');
      throw ('no token');
    } else if (response.statusCode == statusCode.FORBIDDEN) {
      print('A bad request Please try again');
    } else if (response.statusCode == statusCode.NOT_FOUND) {
      print('Endpoint not found Please try again');
    } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
      print('Input error Please try again');
    } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
      print('Input error Please try again');
    } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
      print('Server error Please try again');
    } else {
      print(' error Please try again');
    }
  }
}
