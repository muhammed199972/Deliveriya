import 'package:flutter/material.dart';

class StatusCode {
  String url1 = 'delivery-food12.herokuapp.com';
  var Token = ''; //                        * token
  var OK = 200; //                          * Normal
  var CREATED = 201; //                     * Create new entity
  var UPDATED = 200; //                     * PUT/PATCH Requests
  var DELETED = 200; //                     * DELETE requests
  var BAD_REQUEST = 400; //                 * A bad request
  var UNAUTHORIZED = 401; //                *
  var FORBIDDEN = 403; //                   *
  var NOT_FOUND = 404; //                   * Endpoint not found
  var DUPLICATED_ENTRY =
      412; //            * Duplication in input (record/value)
  var VALIDATION_ERROR = 422; //            * Un processable Entity
  var INTERNAL_SERVER_ERROR = 500; //       * Server error
  var connection = 1000; //       * Server error
  var parsing = 2000; //       * Server error

  var error = {
    'SUCCESS': {
      'code': 2000,
      'msg': 'Success',
    },
    'GENERAL_ERROR': {
      'code': 5000,
      'msg': 'General Error Occurs',
    },
    'DEFAULT': {
      'code': 4000,
      'msg': 'Error',
    },
    'INVALID_CREDENTIAL': {
      'code': 4003,
      'msg': 'Invalid Credential',
    },
    'INVALID_TOKEN': {
      'code': 4004,
      'msg': 'Invalid Token',
    },
    'ITEM_NOT_FOUND': {
      'code': 4104,
      'msg': 'Item Not Found',
    },
    'VALIDATION_ERROR': {
      'code': 4202,
      'msg': 'Input Error',
    },
    // * Multer limit file size
    'LIMIT_FILE_SIZE': {
      'code': 4203,
      'msg': 'Max Upload Limit Exceeded',
    },
    'NON_SUPPORTED_FILE_TYPE': {
      'code': 4204,
      'msg': 'Non Supported File Type',
    },
  };
}

class Constans {
  List<String> categorySelected = [];
}

class AppColors {
  static const mainColor = Color(0xFFE73352);
  static const whiteColor = Color(0xFFFFFFFF);
  static const greyColor = Color(0xFF757272);
}

class Styles {}

class Defaults {
  static const defaultPadding = 20.0;
}