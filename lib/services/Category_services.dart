import 'dart:convert';
import 'dart:io';
import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/model/Error.dart';
import 'package:http/http.dart' as http;
import 'package:delivery_food/model/Category_model.dart';

class CategoryService {
  Future<ApiResult> getCategoryData() async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    List<CategoryResponse> calendar = [];
    CategoryStatus? status;
    ErrorResponse? error;
    Uri url = Uri.http('${statusCode.url1}', '/api/public/category',
        {'lang': statusCode.Lang});

    try {
      var response = await http.get(url);
      var responsebode = jsonDecode(response.body);
      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = CategoryStatus.fromJson(responsebode['status']);

        if (responsebode['response'] != null) {
          for (var item in responsebode['response']) {
            calendar.add(CategoryResponse.fromJson(item));
          }
          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = CategoryStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = CategoryStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = CategoryStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = CategoryStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = CategoryStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = CategoryStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = CategoryStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Server error Please try again');
      } else {
        status = CategoryStatus.fromJson(responsebode['status']);
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
}
