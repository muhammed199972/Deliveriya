import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Auth_controller.dart';
import 'package:delivery_food/model/DeletePutPost.dart';
import 'package:delivery_food/model/Error.dart';
import 'package:delivery_food/model/Profile_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ProfileService {
  AuthController authController = AuthController();

  Future<ApiResult> getprofilesData() async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    ProfileResponse? calendar;

    ProfileStatus? status;
    ErrorResponse? error;
    Uri url = Uri.http('${statusCode.url1}', '/api/private/user/profile',
        {'lang': statusCode.Lang});

    try {
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer ${statusCode.Token}'});
      var responsebode = jsonDecode(response.body);
      print(responsebode);
      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = ProfileStatus.fromJson(responsebode['status']);

        if (responsebode['response'] != null) {
          calendar = ProfileResponse.fromJson(responsebode['response']);

          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
          log('${calendar.name}', name: 'services profile get');
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = ProfileStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = ProfileStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.rfreshToken = false;
        await authController.postrefreshToken();
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = ProfileStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = ProfileStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = ProfileStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = ProfileStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = ProfileStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Server error Please try again');
      } else {
        status = ProfileStatus.fromJson(responsebode['status']);
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

  Future<ApiResult> patchprofileData2({
    required String name,
    required String gender,
    required String birthdate,
    required File file,
  }) async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    DeletePutPostResponse? calendar;
    ProfileStatus? status;
    ErrorResponse? error;

    var response;

    try {
      Dio dio = Dio();
      FormData? formData;
      if (file.path != '') {
        String fileName = file.path.split('/').last;
        var img = await MultipartFile.fromFile(
          file.path,
          filename: fileName,
          contentType: MediaType('image', 'png'),
        );
        formData = FormData.fromMap({
          "avatar": img,
          'name': name,
          'gender': gender,
          'birthDate': birthdate,
        });
      } else {
        formData = FormData.fromMap({
          'name': name,
          'gender': gender,
          'birthDate': birthdate,
        });
      }

      response = await dio.patch(
        'http://' + statusCode.url1 + '/api/private/user',
        data: formData,
        options: Options(
          headers: {'Authorization': 'Bearer ${statusCode.Token}'},
        ),
      );

      if (response!.statusCode == statusCode.OK ||
          response!.statusCode == statusCode.CREATED) {
        status = ProfileStatus.fromJson(response.data['status']);

        apiResult.isEmpty = false;
        apiResult.errorMassage = status.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = false;
        apiResult.data = calendar;

        if (response.data['response'].isEmpty) {
          apiResult.isEmpty = true;
        }
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
      apiResult.errorMassage = 'حدث خطأ غير متوقع';
      apiResult.codeError = statusCode.connection;
      if (e.response!.statusCode == 401) {
        apiResult.rfreshToken = false;
        await authController.postrefreshToken();
      } else {
        apiResult.errorMassage = 'Error';
        apiResult.codeError = statusCode.connection;
      }

      print('${e.response!.statusCode!}');
    }
    return apiResult;
  }
}
