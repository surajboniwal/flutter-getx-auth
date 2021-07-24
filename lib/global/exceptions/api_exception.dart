import 'package:flutter_getx/models/error.dart';

class ApiException implements Exception {
  List<dynamic>? errors;
  ApiException(this.errors);
}
