import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth_service.dart';

class DatabaseService extends GetxService {

  final _authService = Get.put<AuthService>(AuthService());
  CollectionReference ideias = FirebaseFirestore.instance.collection('ideias');

  Future<List<Map>> getIdeas() {
    List<Map> lista = List<Map>();
    return ideias
        .where('email', isEqualTo: _authService.user.email)
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        lista.add({'texto' : doc.data()['texto'],'Id' : doc.id});
      });
      return lista;
    });
  }

  Future<void> saveIdeia(String ideia) {
    String _email = _authService.user.email;

    return ideias
        .add(
        {'email': _email,
          'texto': ideia
        }
    ).then((value) => print('Ideia gravada'))
        .catchError((error) => print('Falha ao gravar ideia: $error'));
  }

  Future<void> updateIdeia(String id, String ideia) {
    return ideias
        .doc(id)
        .update({'texto': ideia})
        .then((value) => print('Ideia alterada'))
        .catchError((error) => print('Falha na alteração da ideia: $error'));
  }

  Future<void> deleteIdeia(String Id) {
    return ideias
        .doc(Id)
        .delete()
        .then((value) => print('Ideia deletada'))
        .catchError((error) => print('Falha na exclusão da ideia: $error'));
  }

}