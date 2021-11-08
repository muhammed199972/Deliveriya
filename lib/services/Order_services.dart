import 'dart:convert';
import 'dart:io';

import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/constans.dart';
import 'package:delivery_food/model/Order_model.dart';
import 'package:http/http.dart' as http;

class OrderService {
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
  Future<ApiResult> getorderData() async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    List<OrderResponse> calendar = [];
    OrderStatus status;
    Uri url = Uri.http('${statusCode.url1}', '/api/private/user/order');

    try {
      var response = await http.get(url);
      var responsebode = jsonDecode(response.body);

      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = OrderStatus.fromJson(responsebode['status']);

        if (responsebode['response'] != null) {
          for (var item in responsebode['response']) {
            calendar.add(OrderResponse.fromJson(item));
          }
          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = OrderStatus.fromJson(responsebode['status']);

        apiResult.errorMassage = status.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = OrderStatus.fromJson(responsebode['status']);

        apiResult.errorMassage = status.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = OrderStatus.fromJson(responsebode['status']);

        apiResult.errorMassage = status.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = OrderStatus.fromJson(responsebode['status']);

        apiResult.errorMassage = status.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = OrderStatus.fromJson(responsebode['status']);

        apiResult.errorMassage = status.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = OrderStatus.fromJson(responsebode['status']);

        apiResult.errorMassage = status.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = OrderStatus.fromJson(responsebode['status']);

        apiResult.errorMassage = status.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Server error Please try again');
      } else {
        status = OrderStatus.fromJson(responsebode['status']);
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
