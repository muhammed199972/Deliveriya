import 'dart:convert';
import 'dart:io';

import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Auth_controller.dart';
import 'package:delivery_food/model/Error.dart';
import 'package:delivery_food/model/Products_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ProductService {
  AuthController authController = AuthController();
  Future<ApiResult?> getproductsData(
    String subCategoryId,
    int offset,
    int limit,
    String q,
  ) async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    List<ProductsResponse> calendar = [];
    ProductsStatus? status;
    ErrorResponse? error;
    Uri url = Uri.http('${statusCode.url1}', '/api/public/product', {
      'subCategoryId': subCategoryId,
      'offset': '$offset',
      'limit': '$limit',
      'q': q
    });
    try {
      var response;
      if (statusCode.Token != '') {
        response = await http
            .get(url, headers: {'Authorization': 'Bearer ${statusCode.Token}'});
      } else {
        response = await http.get(url);
      }

      var responsebody = jsonDecode(response.body);
      print(responsebody);
      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = ProductsStatus.fromJson(responsebody['status']);
        if (responsebody['response'] != null) {
          for (var item in responsebody['response']) {
            calendar.add(ProductsResponse.fromJson(item));
          }
          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = ProductsStatus.fromJson(responsebody['status']);
        error = ErrorResponse.fromJson(responsebody['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        apiResult.data = calendar;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = ProductsStatus.fromJson(responsebody['status']);
        error = ErrorResponse.fromJson(responsebody['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        await authController.postrefreshToken();
        getproductsData(subCategoryId, offset, limit, q);
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = ProductsStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = ProductsStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = ProductsStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = ProductsStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = ProductsStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Server error Please try again');
      } else {
        status = ProductsStatus.fromJson(responsebody['status']);
        error = ErrorResponse.fromJson(responsebody['errors']);
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
      apiResult.errorMassage = 'حدث خطأ غير متوقع';
      apiResult.codeError = statusCode.connection;
      apiResult.hasError = true;
      print('${e}');
    }
    return apiResult;
  }

  Future<ApiResult?> getListproductsData(
    int offset,
    int limit,
    List<int> Listproduct,
  ) async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    List<ProductsResponse> calendar = [];
    ProductsStatus? status;
    ErrorResponse? error;
    Dio dio = Dio();

    try {
      var response;

      response = await dio.post(
          'http://' + statusCode.url1 + '/api/public/product',
          data: {"ids": Listproduct});

      if (response!.statusCode == statusCode.OK ||
          response!.statusCode == statusCode.CREATED) {
        print('[[[[[[object]]]]]]');
        status = ProductsStatus.fromJson(response.data['status']);
        if (response.data['response'] != null) {
          for (var item in response.data['response']) {
            calendar.add(ProductsResponse.fromJson(item));
          }
          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        }
      } else if (response!.statusCode == statusCode.BAD_REQUEST) {
        status = ProductsStatus.fromJson(response.data['status']);
        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        apiResult.data = calendar;
        print('A bad request Please try again');
      } else if (response!.statusCode == statusCode.UNAUTHORIZED) {
        status = ProductsStatus.fromJson(response.data['status']);

        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        await authController.postrefreshToken();
        getListproductsData(offset, limit, Listproduct);

        print('A bad request Please try again');
      } else if (response!.statusCode == statusCode.FORBIDDEN) {
        status = ProductsStatus.fromJson(response.data['status']);

        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response!.statusCode == statusCode.NOT_FOUND) {
        status = ProductsStatus.fromJson(response.data['status']);

        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Endpoint not found Please try again');
      } else if (response!.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = ProductsStatus.fromJson(response.data['status']);

        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response!.statusCode == statusCode.VALIDATION_ERROR) {
        status = ProductsStatus.fromJson(response.data['status']);

        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response!.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = ProductsStatus.fromJson(response.data['status']);

        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Server error Please try again');
      } else {
        status = ProductsStatus.fromJson(response.data['status']);
        error = ErrorResponse.fromJson(response.data['errors']);
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
      apiResult.errorMassage = 'حدث خطأ غير متوقع';
      apiResult.codeError = statusCode.connection;
      apiResult.hasError = true;
      print('${e}');
    }
    return apiResult;
  }
}
