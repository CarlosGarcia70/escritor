import 'package:escritor/data/providers/auth_service.dart';
import 'package:escritor/data/providers/database_service.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginBinding extends Bindings {

  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.find<AuthService>();
    Get.find<DatabaseService>();
  }
}