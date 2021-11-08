import 'dart:convert';
import 'dart:io';

import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/constans.dart';
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
    Uri url = Uri.http('${statusCode.url1}', '/api/public/offer');
    try {
      var response = await http.get(url);
      var responsebody = jsonDecode(response.body);
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
        error = ErrorResponse.fromJson(responsebody['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        apiResult.data = calendar;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = OffersStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = OffersStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = OffersStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = OffersStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = OffersStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = OffersStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors']);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.hasError = true;
        print('Server error Please try again');
      } else {
        status = OffersStatus.fromJson(responsebody['status']);
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
      apiResult.errorMassage = '${e}';
      apiResult.codeError = statusCode.connection;
      apiResult.hasError = true;
      print('${e}');
    }
  }
}
