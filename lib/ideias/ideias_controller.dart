import 'package:escritor/home/home_controller.dart';
import 'package:escritor/data/providers/database_service.dart';
import 'package:escritor/home/home_page.dart';
import 'package:get/get.dart';

class IdeiasController extends GetxController {

  final database = Get.find<DatabaseService>();

  void saveIdeia(String ideia) async {
    await database.saveIdeia(ideia).then(
        (value) {
          Get.offAll(HomePage());
     //     Get.back(result: 'sucesso');
        }
    );
  }

  void updateIdea(String texto, String ideiaId) async {
    await database.updateIdeia(ideiaId, texto).then(
        (value) {
          Get.offAll(HomePage());
        }
    );
  }

  void deleteIdea(String ideiaId) async {
    await database.deleteIdeia(ideiaId).then(
        (value) {
          Get.offAll(HomePage());
        }
    );
  }

}