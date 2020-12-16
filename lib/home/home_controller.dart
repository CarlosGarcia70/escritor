import 'package:escritor/data/models/model_ideia.dart';
import 'package:escritor/ideias/new_ideia_page.dart';
import 'package:escritor/login/login_page.dart';
import 'package:escritor/data/providers/auth_service.dart';
import 'package:escritor/data/providers/database_service.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {

  final authService = Get.put<AuthService>(AuthService());
  final database = Get.put<DatabaseService>(DatabaseService());


  @override
  void onReady() {
    super.onReady();
    if(authService.user == null) {
      Get.off(LoginPage());
    }
  }

  Future<List<ModelIdeia>> listaIdeias() async {
    return await database.getIdeias();
  }

  /*Future<List<Map>> listaIdeias() async {
    return await database.getIdeas();
  }*/

  void novaideia() async {
    Get.to(NewIdeia());
    /*var dados = await Get.to(Ideia());
    if(dados == 'sucesso') {
      update();
    }*/
  }

}