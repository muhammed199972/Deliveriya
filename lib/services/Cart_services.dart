import 'dart:convert';
import 'dart:io';

import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/model/Cart_model.dart';
import 'package:delivery_food/model/Delete.dart';
import 'package:delivery_food/model/Error.dart';
import 'package:delivery_food/model/Patch_data.dart';
import 'package:delivery_food/model/Post_data.dart';
import 'package:http/http.dart' as http;

class CartService {
  Future<ApiResult> getcartData() async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    List<CartResponse> calendar = [];
    CartStatus? status;
    ErrorResponse? error;
    Uri url = Uri.http(
        '${statusCode.url1}', '/api/private/user/favorite?offset=0&limit=8');

    try {
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer ${statusCode.Token}'});
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

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Server error Please try again');
      } else {
        status = CartStatus.fromJson(responsebode['status']);
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

  Future<ApiResult> postcartData(Map<String, dynamic> body) async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    PostResponse? calendar;
    CartStatus? status;
    ErrorResponse? error;
    Uri url = Uri.http('${statusCode.url1}', '/api/private/user/cart/:id');

    try {
      var response = await http.post(
        url,
        body: body,
        headers: {'Authorization': 'Bearer ${statusCode.Token}'},
      );
      var responsebode = jsonDecode(response.body);

      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = CartStatus.fromJson(responsebode['status']);

        if (responsebode['response'] != null) {
          calendar = PostResponse.fromJson(responsebode['response']);

          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = CartStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Server error Please try again');
      } else {
        status = CartStatus.fromJson(responsebode['status']);
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

  Future<ApiResult> deletecartData(Map<String, dynamic> body) async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    DeleteResponse? calendar;
    CartStatus? status;
    ErrorResponse? error;
    Uri url = Uri.http('${statusCode.url1}', '/api/private/user/cart/:id');

    try {
      var response = await http.delete(
        url,
        headers: {'Authorization': 'Bearer${statusCode.Token}'},
      );
      var responsebode = jsonDecode(response.body);

      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = CartStatus.fromJson(responsebode['status']);

        if (responsebode['response'] != null) {
          calendar = DeleteResponse.fromJson(responsebode['response']);

          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = CartStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Server error Please try again');
      } else {
        status = CartStatus.fromJson(responsebode['status']);
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

  Future<ApiResult> patchcartData(Map<String, dynamic> body) async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    PatchResponse? calendar;
    CartStatus? status;
    ErrorResponse? error;
    Uri url = Uri.http('${statusCode.url1}', '/api/private/user/cart/:id');

    try {
      var response = await http.delete(
        url,
        headers: {'Authorization': 'Bearer${statusCode.Token}'},
      );
      var responsebode = jsonDecode(response.body);

      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = CartStatus.fromJson(responsebode['status']);

        if (responsebode['response'] != null) {
          calendar = PatchResponse.fromJson(responsebode['response']);

          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = CartStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Server error Please try again');
      } else {
        status = CartStatus.fromJson(responsebode['status']);
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