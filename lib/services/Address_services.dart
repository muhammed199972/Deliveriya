import 'dart:convert';
import 'dart:io';

import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/model/Address.dart';
import 'package:delivery_food/model/Delete.dart';
import 'package:delivery_food/model/Error.dart';
import 'package:delivery_food/model/Post_data.dart';
import 'package:http/http.dart' as http;

class AddressService {
  Future<ApiResult> getaddressData() async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    List<AddressResponse> calendar = [];

    AddressStatus? status;
    ErrorResponse? error;
    Uri url = Uri.http('${statusCode.url1}', '/api/private/user/address');

    try {
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer ${statusCode.Token}'});
      var responsebode = jsonDecode(response.body);

      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = AddressStatus.fromJson(responsebode['status']);

        if (responsebode['response'] != null) {
          for (var item in responsebode['response']) {
            calendar.add(AddressResponse.fromJson(item));
          }

          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = AddressStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = AddressStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = AddressStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = AddressStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = AddressStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = AddressStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = AddressStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Server error Please try again');
      } else {
        status = AddressStatus.fromJson(responsebode['status']);
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

  Future<ApiResult> postaddressData(Map<String, dynamic> body) async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    PostResponse? calendar;
    AddressStatus? status;
    ErrorResponse? error;
    Uri url = Uri.http('${statusCode.url1}', '/api/private/user/address');

    try {
      var response = await http.post(
        url,
        body: body,
        headers: {'Authorization': 'Bearer ${statusCode.Token}'},
      );
      var responsebode = jsonDecode(response.body);

      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = AddressStatus.fromJson(responsebode['status']);

        if (responsebode['response'] != null) {
          calendar = PostResponse.fromJson(responsebode['response']);

          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = AddressStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = AddressStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = AddressStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = AddressStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = AddressStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = AddressStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = AddressStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Server error Please try again');
      } else {
        status = AddressStatus.fromJson(responsebode['status']);
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

  Future<ApiResult> deleteaddressData(Map<String, dynamic> body) async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    DeleteResponse? calendar;
    AddressStatus? status;
    ErrorResponse? error;
    Uri url = Uri.http('${statusCode.url1}', '/api/private/user/address/:id');

    try {
      var response = await http.delete(
        url,
        headers: {'Authorization': 'Bearer${statusCode.Token}'},
      );
      var responsebode = jsonDecode(response.body);

      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = AddressStatus.fromJson(responsebode['status']);

        if (responsebode['response'] != null) {
          calendar = DeleteResponse.fromJson(responsebode['response']);

          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = AddressStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = AddressStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = AddressStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = AddressStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = AddressStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = AddressStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = AddressStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Server error Please try again');
      } else {
        status = AddressStatus.fromJson(responsebode['status']);
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
