import 'package:escritor/data/providers/auth_service.dart';
import 'package:escritor/data/providers/database_service.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {

  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(), permanent: true);
    Get.put<AuthService>(AuthService());
    Get.put<DatabaseService>(DatabaseService());
  }
}