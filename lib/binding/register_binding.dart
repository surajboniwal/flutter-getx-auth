import 'package:flutter_getx/controller/auth_controller.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
