import 'dart:convert';

import 'package:flutter_getx/global/exceptions/api_exception.dart';
import 'package:flutter_getx/models/error.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class BaseService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = "https://elib-main.herokuapp.com/api";
    httpClient.defaultContentType = "application/json";

    httpClient.addRequestModifier((Request request) {
      print('${request.method.toUpperCase()} | ${request.url}');
      return request;
    });
    super.onInit();
  }
}
