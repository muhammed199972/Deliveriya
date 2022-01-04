// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Constans Constansbox = Constans();
var code = '';
String phone = '';

class StatusCode {
  String url1 = 'delivery-food12.herokuapp.com';
  var urlimage = 'https://delivery-food12.herokuapp.com/';
  var imgdefault =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png';
  var Token = Constansbox.box.read('accessToken');
  var RefreshToken = Constansbox.box.read('refreshToken');
  var Lang = Constansbox.box.read('lang');

  var favorite = Constansbox.box.read('favorite');
  var cartsid = Constansbox.box.read('cartsid');

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
  final box = GetStorage();
}

final box = GetStorage();

class AppColors {
  static const mainColor = Color(0xFFE73352);
  static const lightmainColor = Color(0xFFFFE8EC);
  static const whiteColor = Color(0xFFFFFFFF);
  static const greyColor = Color(0xB7FAFAFA);
  static const darkgreyColor = Color(0x27464242);
  static const darkgreytextColor = Color(0xA2000000);
  static const whiteappbarColor = Color(0xffFAFAFA);
  static const blackColor = Color(0xFF000000);
  static const lightgreyColor = Color(0xFFC4C4C4);
  static const lightgrey2Color = Color(0xFFEFEFEF);
}

class Styles {
  static const buttonStyle =
      TextStyle(color: AppColors.mainColor, fontSize: 16);
  static const buttonStyle2 =
      TextStyle(color: AppColors.whiteColor, fontSize: 16);
  static const categoryStyle = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 16,
  );
  static const priceStyle =
      TextStyle(color: AppColors.blackColor, fontSize: 12);
  static const defualtmobile =
      TextStyle(color: AppColors.blackColor, fontSize: 16);
  static const defualttab =
      TextStyle(color: AppColors.blackColor, fontSize: 25);
}

class Defaults {
  static const defaultPadding = 20.0;
}
