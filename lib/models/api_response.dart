import 'error.dart';

enum ApiStatus { success, error }

class ApiResponse<T> {
  ApiStatus? status;
  List<Error>? errors;
  T? data;

  ApiResponse.error(this.errors) : status = ApiStatus.error;
  ApiResponse.success(this.data) : status = ApiStatus.success;

  bool get isError => this.status == ApiStatus.error;
}
