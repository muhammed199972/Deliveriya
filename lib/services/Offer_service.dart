import 'dart:convert';
import 'dart:io';

import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/model/Error.dart';
import 'package:delivery_food/model/Offer_model.dart';
import 'package:http/http.dart' as http;

class OfferService {
  Future<ApiResult?> getofferData() async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    List<OffersResponse> calendar = [];
    OffersStatus? status;
    ErrorResponse? error;
    Uri url = Uri.http(
        '${statusCode.url1}', '/api/public/offer', {'lang': statusCode.Lang});
    try {
      var response = await http.get(url);
      var responsebody = jsonDecode(response.body);
      print(responsebody);
      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = OffersStatus.fromJson(responsebody['status']);
        if (responsebody['response'] != null) {
          for (var item in responsebody['response']) {
            calendar.add(OffersResponse.fromJson(item));
          }
          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = OffersStatus.fromJson(responsebody['status']);
        error = ErrorResponse.fromJson(responsebody['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        apiResult.data = calendar;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = OffersStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = OffersStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = OffersStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = OffersStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = OffersStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = OffersStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Server error Please try again');
      } else {
        status = OffersStatus.fromJson(responsebody['status']);
        error = ErrorResponse.fromJson(responsebody['errors'][0]);
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
