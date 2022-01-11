import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Auth_controller.dart';
import 'package:delivery_food/model/Auth_model.dart';
import 'package:delivery_food/model/DeletePutPost.dart';
import 'package:delivery_food/model/Error.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<ApiResult> getauthCode(String phone) async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    AuthResponse? calendar;
    ErrorResponse? error;
    AuthStatus? status;
    Uri url = Uri.http(
        '${statusCode.url1}', '/api/public/auth/get-code', {'phone': phone});

    try {
      var response = await http.get(url);
      log('${response.body}', name: 'response body auth ');
      var responsebode = jsonDecode(response.body);

      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = AuthStatus.fromJson(responsebode['status']);
        if (responsebode['response'] != null) {
          calendar = AuthResponse.fromJson(responsebode['response']);

          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Server error Please try again');
      } else {
        status = AuthStatus.fromJson(responsebode['status']);
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

  Future<ApiResult> postsignup(String countryCode, String password) async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    SignUpResponse? calendar;
    AuthStatus? status;
    ErrorResponse? error;
    Uri url = Uri.http('${statusCode.url1}', '/api/public/auth/signup');

    try {
      var response = await http.post(
        url,
        body: {
          "code": code,
          'phone': countryCode + phone,
          'password': password
        },
      );
      var responsebode = jsonDecode(response.body);
      print(responsebode);
      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = AuthStatus.fromJson(responsebode['status']);

        if (responsebode['response'] != null) {
          calendar = SignUpResponse.fromJson(responsebode['response']);

          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = AuthStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = AuthStatus.fromJson(responsebode['status']);

        // error = ErrorResponse.fromJson(responsebode['errors'][0]);
        // apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Server error Please try again');
      } else {
        status = AuthStatus.fromJson(responsebode['status']);
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
      apiResult.errorMassage = '${e}';
      apiResult.codeError = statusCode.connection;

      print('${e}');
    }
    return apiResult;
  }

  Future<ApiResult> postsignin(String num, String password) async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    SignUpResponse? calendar;
    AuthStatus? status;
    ErrorResponse? error;
    Uri url = Uri.http('${statusCode.url1}', '/api/public/auth/login');

    try {
      var body = {'phone': num, 'password': password};
      var response = await http.post(
        url,
        body: body,
      );
      var responsebode = jsonDecode(response.body);

      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = AuthStatus.fromJson(responsebode['status']);

        if (responsebode['response'] != null) {
          calendar = SignUpResponse.fromJson(responsebode['response']);

          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = AuthStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = AuthStatus.fromJson(responsebode['status']);

        // error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = status.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Server error Please try again');
      } else {
        status = AuthStatus.fromJson(responsebode['status']);
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
      apiResult.errorMassage = '${e}';
      apiResult.codeError = statusCode.connection;

      print('${e}');
    }
    return apiResult;
  }

  Future<ApiResult> postrefreshToken() async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    SignUpResponse? calendar;
    AuthStatus? status;
    ErrorResponse? error;
    Uri url = Uri.http('${statusCode.url1}', '/api/public/auth/refresh-token');
    print(statusCode.RefreshToken);
    try {
      var response = await http.post(url,
          headers: {'Authorization': 'Bearer ${statusCode.RefreshToken}'});
      var responsebode = jsonDecode(response.body);

      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = AuthStatus.fromJson(responsebode['status']);

        if (responsebode['response'] != null) {
          calendar = SignUpResponse.fromJson(responsebode['response']);

          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = AuthStatus.fromJson(responsebode['status']);
        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;
        apiResult.rfreshToken = false;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        // Constansbox.box.remove('accessToken');
        // Constansbox.box.remove('refreshToken');
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = AuthStatus.fromJson(responsebode['status']);

        // error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = status.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = AuthStatus.fromJson(responsebode['status']);

        error = ErrorResponse.fromJson(responsebode['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Server error Please try again');
      } else {
        status = AuthStatus.fromJson(responsebode['status']);
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
      apiResult.errorMassage = '${e}';
      apiResult.codeError = statusCode.connection;

      print('${e}');
    }
    return apiResult;
  }

  Future<ApiResult> postfavorateData() async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    DeletePutPostResponse? calendar;
    ErrorResponse? error;
    Dio dio = Dio();

    try {
      List<int> body = [];
      var favorite = Constansbox.box.read('favorite');

      favorite.forEach((element) {
        body.add(element);
      });

      var response = await dio.post(
        'http://' + statusCode.url1 + '/api/private/user/favorite',
        data: jsonEncode({'ids': body}),
        options: Options(
          headers: {'Authorization': 'Bearer ${statusCode.Token}'},
        ),
      );

      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        Constansbox.box.remove('favorite');
        calendar = DeletePutPostResponse.fromJson(response.data);

        apiResult.isEmpty = false;

        apiResult.hasError = false;
        apiResult.data = calendar;
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;

        apiResult.rfreshToken = false;
        await postrefreshToken();
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;

        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;

        print('Server error Please try again');
      } else {
        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;

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
        error = ErrorResponse.fromJson(e.response!.data['errors']);
        apiResult.errorMassage = error.msg;

        apiResult.rfreshToken = false;
        await postrefreshToken();
        print('A bad request Please try again');
      }
      apiResult.errorMassage = 'حدث خطأ غير متوقع';
      apiResult.codeError = statusCode.connection;

      print('${e}');
    }
    return apiResult;
  }

  Future<ApiResult> postcartData() async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    DeletePutPostResponse? calendar;
    ErrorResponse? error;
    Dio dio = Dio();

    try {
      List<Map<String, int>> body = [];
      var productId = Constansbox.box.read('cartsid');
      var quantity = Constansbox.box.read('cartscounte');
      for (int i = 0; i < productId.length; i++) {
        body.add({"productId": productId[i], "quantity": quantity[i]});
      }
      print({"ids": body});
      var response = await dio.post(
        'http://' + statusCode.url1 + '/api/private/user/cart',
        data: jsonEncode({"ids": body}),
        options: Options(
          headers: {'Authorization': 'Bearer ${statusCode.Token}'},
        ),
      );

      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        Constansbox.box.remove('cartsid');
        Constansbox.box.remove('cartscounte');

        calendar = DeletePutPostResponse.fromJson(response.data);

        apiResult.isEmpty = false;

        apiResult.hasError = false;
        apiResult.data = calendar;
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;

        apiResult.rfreshToken = false;
        await postrefreshToken();
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;

        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;

        print('Server error Please try again');
      } else {
        error = ErrorResponse.fromJson(response.data['errors']);
        apiResult.errorMassage = error.msg;

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
        error = ErrorResponse.fromJson(e.response!.data['errors']);
        apiResult.errorMassage = error.msg;

        apiResult.rfreshToken = false;

        print('A bad request Please try again');
      }
      apiResult.errorMassage = 'حدث خطأ غير متوقع';
      apiResult.codeError = statusCode.connection;

      print('${e}');
    }
    return apiResult;
  }

  Future<ApiResult> putpassword(String oldpas, String newpas) async {
    StatusCode statusCode = StatusCode();
    ApiResult apiResult = ApiResult();
    DeletePutPostResponse? calendar;
    AuthStatus? status;
    ErrorResponse? error;

    Uri url = Uri.http(
      '${statusCode.url1}',
      '/api/private/auth/password',
    );
    try {
      var response = await http.put(url,
          headers: {'Authorization': 'Bearer ${statusCode.Token}'},
          body: {'password': newpas, 'oldPassword': oldpas});
      var responsebody = jsonDecode(response.body);
      log('${responsebody}', name: 'aaaaa');
      if (response.statusCode == statusCode.OK ||
          response.statusCode == statusCode.CREATED) {
        status = AuthStatus.fromJson(responsebody['status']);
        if (responsebody['response'] != null) {
          calendar = DeletePutPostResponse.fromJson(responsebody);

          apiResult.errorMassage = status.msg;
          apiResult.codeError = status.code;
          apiResult.hasError = false;
          apiResult.data = calendar;
        }
      } else if (response.statusCode == statusCode.BAD_REQUEST) {
        status = AuthStatus.fromJson(responsebody['status']);
        error = ErrorResponse.fromJson(responsebody['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        apiResult.data = calendar;
        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.UNAUTHORIZED) {
        status = AuthStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.FORBIDDEN) {
        status = AuthStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('A bad request Please try again');
      } else if (response.statusCode == statusCode.NOT_FOUND) {
        status = AuthStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Endpoint not found Please try again');
      } else if (response.statusCode == statusCode.DUPLICATED_ENTRY) {
        status = AuthStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.VALIDATION_ERROR) {
        status = AuthStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Input error Please try again');
      } else if (response.statusCode == statusCode.INTERNAL_SERVER_ERROR) {
        status = AuthStatus.fromJson(responsebody['status']);

        error = ErrorResponse.fromJson(responsebody['errors'][0]);
        apiResult.errorMassage = error.msg;
        apiResult.codeError = status.code;

        print('Server error Please try again');
      } else {
        status = AuthStatus.fromJson(responsebody['status']);
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
