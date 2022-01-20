import 'dart:convert';
import 'dart:io';

import 'package:delivery_food/services/returnResponse.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  ReturnResponse returnResponse = ReturnResponse();
  Future<dynamic> get(Uri url, String token) async {
    var responseJson;
    final response;
    try {
      if (token != '') {
        response = await http
            .get(
          url,
        )
            .timeout(const Duration(seconds: 12), onTimeout: () {
          return responseJson;
        });
      } else {
        response = await http.get(url).timeout(const Duration(seconds: 12),
            onTimeout: () {
          return responseJson;
        });
      }

      returnResponse.returnResponse(response);
      return responseJson;
    } on SocketException {
      print('object');
    } catch (e) {
      print(
          ',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,llllllllllllllllllljjjjjjjjjjjj,,,');
      print('jllllllllllllllllllllllllllllllll$e');
    }
  }
}
