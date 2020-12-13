import 'package:escritor/data/providers/auth_service.dart';
import 'package:escritor/data/providers/database_service.dart';
import 'package:escritor/home/home_controller.dart';
import 'package:get/get.dart';

import 'ideias_controller.dart';

class HomeBinding extends Bindings {

  @override
  void dependencies() {
    Get.put<IdeiasController>(IdeiasController());
    Get.find<HomeController>();
    Get.find<AuthService>();
    Get.find<DatabaseService>();
  }
}