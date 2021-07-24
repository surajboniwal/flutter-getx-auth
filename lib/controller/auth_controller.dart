import 'package:flutter_getx/global/helpers/helpers.dart';
import 'package:flutter_getx/global/values/values.dart';
import 'package:flutter_getx/models/models.dart';
import 'package:flutter_getx/global/helpers/validator.dart';
import 'package:flutter_getx/services/auth_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  AuthService _authService = AuthService();
  bool loading = false;
  String? welcomeMessage = '';

  @override
  void onInit() {
    super.onInit();
    getLoadingMessage();
  }

  void getLoadingMessage() async {
    startLoading();
    ApiResponse<String> welcomeResponse = await _authService.getWelcome();
    if (welcomeResponse.isError) {
      Notifier.snackbar('Error', welcomeResponse.errors!.first.msg ?? '');
      stopLoading();
      return;
    }
    welcomeMessage = welcomeResponse.data;
    stopLoading();
  }

  void register(String fullName, String email, String password) async {
    if (!Validator.validateFullName(fullName)) {
      Notifier.snackbar(AppStrings.VALIDATION_ERROR, AppStrings.FULLNAME_ERROR);
      return;
    }
    if (!Validator.validateEmail(email)) {
      Notifier.snackbar(AppStrings.VALIDATION_ERROR, AppStrings.EMAIL_ERROR);
      return;
    }
    if (!Validator.validatePassword(password)) {
      Notifier.snackbar(AppStrings.VALIDATION_ERROR, AppStrings.PASSWORD_ERROR);
      return;
    }

    ApiResponse<String> registerResponse = await _authService.registerUser(
        fullName: fullName, email: email, password: password);
    if (registerResponse.isError) {
      Notifier.snackbar('Error', registerResponse.errors!.first.msg ?? '');
      return;
    }

    Notifier.snackbar(
        'Success', 'Registration successful you can login now', false);
  }

  void login(String email, String password) async {
    if (!Validator.validateEmail(email)) {
      Notifier.snackbar(AppStrings.VALIDATION_ERROR, AppStrings.EMAIL_ERROR);
      return;
    }
    if (!Validator.validatePassword(password)) {
      Notifier.snackbar(AppStrings.VALIDATION_ERROR, AppStrings.PASSWORD_ERROR);
      return;
    }

    ApiResponse<Map<String, dynamic>> loginResponse =
        await _authService.loginUser(email: email, password: password);
    if (loginResponse.isError) {
      Notifier.snackbar('Error', loginResponse.errors!.first.msg ?? '');
      return;
    }
    Notifier.snackbar('Success', 'Logged in successfully', false);
  }

  void startLoading() {
    loading = true;
    update();
  }

  void stopLoading() {
    loading = false;
    update();
  }
}
