import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Auth_controller.dart';
import 'package:delivery_food/model/Cart_model.dart';
import 'package:delivery_food/model/DeletePutPost.dart';
import 'package:delivery_food/model/Error.dart';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class CartService {
  AuthController authController = AuthController();
  Future<ApiResult> getcartData() async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    List<CartResponse> calendar = [];

    CartStatus? status;
    ErrorResponse? error;
    Uri url = Uri.http('${statusCode.url1}', '/api/private/user/cart',
        {'lang': statusCode.Lang, 'sum': 'true'});

    try {
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer ${statusCode.Token}'});
      var responsebode = jsonDecode(response.body);
      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = CartStatus.fromJson(responsebode['status']);

        if (responsebode['response']['data'] != []) {
          for (var item in responsebode['response']['data']['item']) {
            calendar.add(CartResponse.fromJson(item));
          }
          apiResult.totalprice = responsebode['response']['data']['total'];
          apiResult.isEmpty = false;

          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        } else {
          calendar = [];
          apiResult.isEmpty = false;

          apiResult.hasError = false;
        }
        if (responsebode['response']['data'].isEmpty) {
          apiResult.isEmpty = true;
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = CartStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = CartStatus.fromJson(responsebode['status']);
        print('A bad request Please try Token Muhammed');
        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.rfreshToken = false;
        await authController.postrefreshToken();

        print('A bad request Please try Token Muhammed');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        print('Server error Please try again');
      } else {
        status = CartStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        print(' error Please try again');
      }
    } on SocketException {
      apiResult.errorMassage = 'Make sure you are connected to the internet';
      apiResult.codeError = statusCode.connection;
      print('Make sure you are connected to the internet');
    } on FormatException {
      apiResult.errorMassage = 'There is a problem with the admin';
      apiResult.codeError = statusCode.parsing;
      print('There is a problem with the admin');
    } catch (e) {
      apiResult.errorMassage = 'حدث خطأ غير متوقع';
      apiResult.codeError = statusCode.connection;
      print('${e}');
    }
    return apiResult;
  }

  Future<ApiResult> postcartData(int quantity, String id) async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    DeletePutPostResponse? calendar;
    CartStatus? status;
    ErrorResponse? error;
    Uri url = Uri.http(
      '${statusCode.url1}',
      '/api/private/user/cart/$id',
    );

    try {
      var response = await http.post(
        url,
        body: {"quantity": quantity.toString()},
        headers: {'Authorization': 'Bearer ${statusCode.Token}'},
      );
      log('${response.body}', name: 'postcart response body');
      var responsebode = jsonDecode(response.body);
      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = CartStatus.fromJson(responsebode['status']);

        if (responsebode['response'] != null) {
          calendar = DeletePutPostResponse.fromJson(responsebode);

          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = CartStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        apiResult.rfreshToken = false;
        await authController.postrefreshToken();
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = CartStatus.fromJson(responsebode['status']);

        // error = ErrorResponse.fromJson(responsebode['errors'][0]);
        // apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Server error Please try again');
      } else {
        status = CartStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print(' error Please try again');
      }
    } on SocketException {
      apiResult.errorMassage = 'Make sure you are connected to the internet';
      apiResult.codeError = statusCode.connection;

      print('Make sure you are connected to the internet');
    } on FormatException {
      apiResult.errorMassage = 'There is a problem with the admin';
      apiResult.codeError = statusCode.parsing;

      print('There is a problem with the admin');
    } catch (e) {
      apiResult.errorMassage = 'حدث خطأ غير متوقع';
      apiResult.codeError = statusCode.connection;
      apiResult.hasError = true;
      print('${e}');
    }
    return apiResult;
  }

  Future<ApiResult> deletecartData(String id) async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    DeletePutPostResponse? calendar;
    CartStatus? status;
    ErrorResponse? error;
    Uri url = Uri.http('${statusCode.url1}', '/api/private/user/cart/$id');

    try {
      var response = await http.delete(
        url,
        headers: {'Authorization': 'Bearer ${statusCode.Token}'},
      );
      print('response body delete ${response.body}');
      var responsebode = jsonDecode(response.body);

      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = CartStatus.fromJson(responsebode['status']);

        if (responsebode['response'] != null) {
          calendar = DeletePutPostResponse.fromJson(responsebode);

          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = CartStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.rfreshToken = false;
        await authController.postrefreshToken();
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Server error Please try again');
      } else {
        status = CartStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print(' error Please try again');
      }
    } on SocketException {
      apiResult.errorMassage = 'Make sure you are connected to the internet';
      apiResult.codeError = statusCode.connection;

      print('Make sure you are connected to the internet');
    } on FormatException {
      apiResult.errorMassage = 'There is a problem with the admin';
      apiResult.codeError = statusCode.parsing;

      print('There is a problem with the admin');
    } catch (e) {
      apiResult.errorMassage = 'حدث خطأ غير متوقع';
      apiResult.codeError = statusCode.connection;

      print('${e}');
    }
    return apiResult;
  }

  Future<ApiResult> deletcategoryecart(String id) async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    DeletePutPostResponse? calendar;
    CartStatus? status;
    ErrorResponse? error;
    Uri url = Uri.http('${statusCode.url1}', '/api/private/user/cart/criteria',
        {'category': id});

    try {
      var response = await http.delete(
        url,
        headers: {'Authorization': 'Bearer ${statusCode.Token}'},
      );
      print('response body delete ${response.body}');
      var responsebode = jsonDecode(response.body);

      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = CartStatus.fromJson(responsebode['status']);

        calendar = DeletePutPostResponse.fromJson(responsebode);

        apiResult.errorMassage = status.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = false;
        apiResult.data = calendar;
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = CartStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.rfreshToken = false;
        await authController.postrefreshToken();
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Server error Please try again');
      } else {
        status = CartStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print(' error Please try again');
      }
    } on SocketException {
      apiResult.errorMassage = 'Make sure you are connected to the internet';
      apiResult.codeError = statusCode.connection;

      print('Make sure you are connected to the internet');
    } on FormatException {
      apiResult.errorMassage = 'There is a problem with the admin';
      apiResult.codeError = statusCode.parsing;

      print('There is a problem with the admin');
    } catch (e) {
      apiResult.errorMassage = 'حدث خطأ غير متوقع';
      apiResult.codeError = statusCode.connection;

      print('${e}');
    }
    return apiResult;
  }

  Future<ApiResult> deletsupcategoryecart(String id) async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    DeletePutPostResponse? calendar;
    CartStatus? status;
    ErrorResponse? error;
    Uri url = Uri.http('${statusCode.url1}', '/api/private/user/cart/criteria',
        {'subCategory': id});

    try {
      var response = await http.delete(
        url,
        headers: {'Authorization': 'Bearer ${statusCode.Token}'},
      );
      print('response body delete ${response.body}');
      var responsebode = jsonDecode(response.body);

      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = CartStatus.fromJson(responsebode['status']);

        calendar = DeletePutPostResponse.fromJson(responsebode);

        apiResult.errorMassage = status.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = false;
        apiResult.data = calendar;
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = CartStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.rfreshToken = false;
        await authController.postrefreshToken();
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Server error Please try again');
      } else {
        status = CartStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print(' error Please try again');
      }
    } on SocketException {
      apiResult.errorMassage = 'Make sure you are connected to the internet';
      apiResult.codeError = statusCode.connection;

      print('Make sure you are connected to the internet');
    } on FormatException {
      apiResult.errorMassage = 'There is a problem with the admin';
      apiResult.codeError = statusCode.parsing;

      print('There is a problem with the admin');
    } catch (e) {
      apiResult.errorMassage = 'حدث خطأ غير متوقع';
      apiResult.codeError = statusCode.connection;

      print('${e}');
    }
    return apiResult;
  }

  Future<ApiResult> patchcartData(var body) async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    DeletePutPostResponse? calendar;
    CartStatus? status;
    ErrorResponse? error;
    Dio dio = Dio();

    try {
      print(body);
      var response = await dio.put(
        'http://' + statusCode.url1 + '/api/private/user/cart',
        data: jsonEncode(body),
        options: Options(
          headers: {'Authorization': 'Bearer ${statusCode.Token}'},
        ),
      );

      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = CartStatus.fromJson(response.data['status']);

        calendar = DeletePutPostResponse.fromJson(response.data);

        apiResult.isEmpty = false;
        apiResult.errorMassage = status.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = false;
        apiResult.data = calendar;
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = CartStatus.fromJson(response.data['status']);

        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.rfreshToken = false;
        await authController.postrefreshToken();
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = CartStatus.fromJson(response.data['status']);

        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = CartStatus.fromJson(response.data['status']);

        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = CartStatus.fromJson(response.data['status']);

        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = CartStatus.fromJson(response.data['status']);

        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = CartStatus.fromJson(response.data['status']);

        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Server error Please try again');
      } else {
        status = CartStatus.fromJson(response.data['status']);
        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print(' error Please try again');
      }
    } on SocketException {
      apiResult.errorMassage = 'Make sure you are connected to the internet';
      apiResult.codeError = statusCode.connection;

      print('Make sure you are connected to the internet');
    } on FormatException {
      apiResult.errorMassage = 'There is a problem with the admin';
      apiResult.codeError = statusCode.parsing;

      print('There is a problem with the admin');
    } on DioError catch (e) {
      if (e.response!.statusCode == statusCode.UNAUTHORIZED) {
        status = CartStatus.fromJson(e.response!.data['status']);

        error = ErrorResponse.fromJson(e.response!.data['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.rfreshToken = false;
        await authController.postrefreshToken();
        print('A bad request Please try again');
      } else {
        apiResult.errorMassage = 'حدث خطأ غير متوقع';
        apiResult.codeError = statusCode.connection;

        print('${e}');
      }
    }
    return apiResult;
  }

  Future<ApiResult> getcartTotal() async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    List<CartResponse> calendar = [];

    CartStatus? status;
    ErrorResponse? error;
    Uri url = Uri.http('${statusCode.url1}', '/api/private/user/cart', {
      'lang': statusCode.Lang,
      'item': 'false',
      'sum': 'true',
    });

    try {
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer ${statusCode.Token}'});
      var responsebode = jsonDecode(response.body);
      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = CartStatus.fromJson(responsebode['status']);

        if (responsebode['response']['data'] != []) {
          apiResult.totalprice = responsebode['response']['data']['total'];

          apiResult.isEmpty = false;

          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        } else {
          calendar = [];
          apiResult.isEmpty = false;

          apiResult.hasError = false;
        }
        if (responsebode['response']['data'].isEmpty) {
          apiResult.isEmpty = true;
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = CartStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = CartStatus.fromJson(responsebode['status']);
        print('A bad request Please try Token Muhammed');
        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.rfreshToken = false;
        await authController.postrefreshToken();

        print('A bad request Please try Token Muhammed');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = CartStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        print('Server error Please try again');
      } else {
        status = CartStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        print(' error Please try again');
      }
    } on SocketException {
      apiResult.errorMassage = 'Make sure you are connected to the internet';
      apiResult.codeError = statusCode.connection;
      print('Make sure you are connected to the internet');
    } on FormatException {
      apiResult.errorMassage = 'There is a problem with the admin';
      apiResult.codeError = statusCode.parsing;
      print('There is a problem with the admin');
    } catch (e) {
      apiResult.errorMassage = 'حدث خطأ غير متوقع';
      apiResult.codeError = statusCode.connection;
      print('${e}');
    }
    return apiResult;
  }

  //     print(response);
  //     var responsebode = jsonDecode(response.body);

  //     if (response.statusCode == statusCode.OK ||
  //         response.statusCode == statusCode.CREATED) {
  //       status = CartStatus.fromJson(responsebode['status']);

  //       if (responsebode['response'] != null) {
  //         calendar = PatchResponse.fromJson(responsebode['response']);

  //         apiResult.errorMassage = status.msg;
  //         apiResult.codeError = status.code;
  //         apiResult.hasError = false;
  //         apiResult.data = calendar;
  //       }
  //     } else if (response.statusCode == statusCode.BAD_REQUEST) {
  //       status = CartStatus.fromJson(responsebode['status']);
  //       error = ErrorResponse.fromJson(responsebode['errors'][0]);
  //       apiResult.errorMassage = error.msg;
  //       apiResult.codeError = status.code;
  //
  //       print('A bad request Please try again');
  //     } else if (response.statusCode == statusCode.UNAUTHORIZED) {
  //       status = CartStatus.fromJson(responsebode['status']);

  //       error = ErrorResponse.fromJson(responsebode['errors'][0]);
  //       apiResult.errorMassage = error.msg;
  //       apiResult.codeError = status.code;
  //
  //       print('A bad request Please try again');
  //     } else if (response.statusCode == statusCode.FORBIDDEN) {
  //       status = CartStatus.fromJson(responsebode['status']);

  //       error = ErrorResponse.fromJson(responsebode['errors'][0]);
  //       apiResult.errorMassage = error.msg;
  //       apiResult.codeError = status.code;
  //
  //       print('A bad request Please try again');
  //     } else if (response.statusCode == statusCode.NOT_FOUND) {
  //       status = CartStatus.fromJson(responsebode['status']);

  //       error = ErrorResponse.fromJson(responsebode['errors'][0]);
  //       apiResult.errorMassage = error.msg;
  //       apiResult.codeError = status.code;
  //
  //       print('Endpoint not found Please try again');
  //     } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
  //       status = CartStatus.fromJson(responsebode['status']);

  //       error = ErrorResponse.fromJson(responsebode['errors'][0]);
  //       apiResult.errorMassage = error.msg;
  //       apiResult.codeError = status.code;
  //
  //       print('Input error Please try again');
  //     } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
  //       status = CartStatus.fromJson(responsebode['status']);

  //       error = ErrorResponse.fromJson(responsebode['errors'][0]);
  //       apiResult.errorMassage = error.msg;
  //       apiResult.codeError = status.code;
  //
  //       print('Input error Please try again');
  //     } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
  //       status = CartStatus.fromJson(responsebode['status']);

  //       error = ErrorResponse.fromJson(responsebode['errors'][0]);
  //       apiResult.errorMassage = error.msg;
  //       apiResult.codeError = status.code;
  //
  //       print('Server error Please try again');
  //     } else {
  //       status = CartStatus.fromJson(responsebode['status']);
  //       error = ErrorResponse.fromJson(responsebode['errors'][0]);
  //       apiResult.errorMassage = error.msg;
  //       apiResult.codeError = status.code;
  //
  //       print(' error Please try again');
  //     }
  //   } on SocketException {
  //     apiResult.errorMassage = 'Make sure you are connected to the internet';
  //     apiResult.codeError = statusCode.connection;
  //
  //     print('Make sure you are connected to the internet');
  //   } on FormatException {
  //     apiResult.errorMassage = 'There is a problem with the admin';
  //     apiResult.codeError = statusCode.parsing;
  //
  //     print('There is a problem with the admin');
  //   } catch (e) {
  //     apiResult.errorMassage = 'حدث خطأ غير متوقع';
  //     apiResult.codeError = statusCode.connection;
  //
  //     print('${e}');
  //   }
  //   return apiResult;
  // }
}
