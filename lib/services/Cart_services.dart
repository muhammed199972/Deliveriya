import 'dart:convert';
import 'dart:io';

import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/constans.dart';
import 'package:delivery_food/model/Cart_model.dart';
import 'package:http/http.dart' as http;

class CartService {
<<<<<<< HEAD
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  static Map<String, String> deleteHeaders = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer token'
  };

  static Map<String, String> authHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer token'
  };
=======
>>>>>>> fbed7192a2a2d8dde1dbac291623248f9286d283
  Future<ApiResult> getcartData() async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    List<CartResponse> calendar = [];
    CartStatus status;
    Uri url = Uri.http(
        '${statusCode.url1}', '/api/private/user/favorite?offset=0&limit=8');

    try {
<<<<<<< HEAD
      var response = await http.get(url);
=======
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer ${statusCode.Token}'});
>>>>>>> fbed7192a2a2d8dde1dbac291623248f9286d283
      var responsebode = jsonDecode(response.body);

      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = CartStatus.fromJson(responsebode['status']);

        if (responsebode['response'] != null) {
          for (var item in responsebode['response']) {
            calendar.add(CartResponse.fromJson(item));
          }
          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = CartStatus.fromJson(responsebode['status']);

        apiResult.errorMassage = status.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = CartStatus.fromJson(responsebode['status']);

        apiResult.errorMassage = status.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = CartStatus.fromJson(responsebode['status']);

        apiResult.errorMassage = status.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = CartStatus.fromJson(responsebode['status']);

        apiResult.errorMassage = status.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = CartStatus.fromJson(responsebode['status']);

        apiResult.errorMassage = status.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = CartStatus.fromJson(responsebode['status']);

        apiResult.errorMassage = status.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = CartStatus.fromJson(responsebode['status']);

        apiResult.errorMassage = status.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Server error Please try again');
      } else {
        status = CartStatus.fromJson(responsebode['status']);
        apiResult.errorMassage = status.msg;
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
