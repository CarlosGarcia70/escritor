import 'package:escritor/data/models/model_ideia.dart';
import 'package:escritor/data/providers/database_service.dart';
import 'package:escritor/home/home_page.dart';
import 'package:get/get.dart';

class IdeiasController extends GetxController {

  final database = Get.find<DatabaseService>();

  void saveIdeia(ModelIdeia ideia) async {
    await database.saveIdeia(ideia).then(
        (value) {
          Get.offAll(HomePage());
     //     Get.back(result: 'sucesso');
        }
    );
  }

  void updateIdea(ModelIdeia ideia) async {
    await database.updateIdeia(ideia).then(
        (value) {
          Get.offAll(HomePage());
        }
    );
  }

  void deleteIdeia(String ideiaId) async {
    await database.deleteIdeia(ideiaId).then(
        (value) {
          Get.offAll(HomePage());
        }
    );
  }

}