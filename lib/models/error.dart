import 'dart:convert';

import 'package:flutter_getx/global/values/values.dart';

List<Error> errorFromJson(List<dynamic> str) =>
    List<Error>.from(str.map((x) => Error.fromJson(x)));

String errorToJson(List<Error> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Error {
  Error({
    this.msg,
  });

  String? msg;

  factory Error.genericError() => Error(msg: AppStrings.GENERIC_ERROR_MESSSGE);

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
      };
}
