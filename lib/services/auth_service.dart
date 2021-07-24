import 'package:flutter_getx/global/exceptions/api_exception.dart';
import 'package:flutter_getx/models/api_response.dart';
import 'package:flutter_getx/models/error.dart';
import 'package:flutter_getx/services/base_service.dart';
import 'package:get/get.dart';

class AuthService extends BaseService {
  AuthService() {
    super.onInit();
  }

  Future<ApiResponse<String>> getWelcome() async {
    Response response = Response();
    try {
      response = await get('/');
      if (response.hasError) throw ApiException(response.body['errors']);
      return ApiResponse.success(response.body);
    } on ApiException catch (e) {
      return ApiResponse.error(errorFromJson(e.errors!));
    } catch (e) {
      return ApiResponse.error([Error.genericError()]);
    }
  }

  Future<ApiResponse<String>> registerUser(
      {required String fullName,
      required String email,
      required String password}) async {
    Response response = Response();
    try {
      response = await post('/auth/register', {
        'name': fullName,
        'email': email,
        'password': password,
      });
      if (response.hasError) throw ApiException(response.body['errors']);
      return ApiResponse.success(response.body);
    } on ApiException catch (e) {
      return ApiResponse.error(errorFromJson(e.errors!));
    } catch (e) {
      return ApiResponse.error([Error.genericError()]);
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> loginUser(
      {required String email, required String password}) async {
    Response response = Response();
    try {
      response = await post('/auth/login', {
        'email': email,
        'password': password,
      });
      if (response.hasError) throw ApiException(response.body['errors']);
      return ApiResponse.success(response.body);
    } on ApiException catch (e) {
      return ApiResponse.error(errorFromJson(e.errors!));
    } catch (e) {
      return ApiResponse.error([Error.genericError()]);
    }
  }
}
