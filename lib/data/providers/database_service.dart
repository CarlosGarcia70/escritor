import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth_service.dart';
import 'package:escritor/data/models/model_ideia.dart';

class DatabaseService extends GetxService {

  final _authService = Get.put<AuthService>(AuthService());
  CollectionReference ideias = FirebaseFirestore.instance.collection('ideias');

  Future<List<ModelIdeia>> getIdeias() {
    List<ModelIdeia> _lista = List<ModelIdeia>();
    return ideias
        .where('email', isEqualTo: _authService.user.email)
        .get()
        .then((QuerySnapshot snapshot) {
          snapshot.docs.forEach((doc) {
            Map _mapa = {
              'Id' : doc.id,
              'email' : doc.data()['email'],
              'texto' : doc.data()['texto'],
              'fase' : doc.data()['fase'],
              'unEfeito' : doc.data()['unEfeito'],
              'observacoes' : doc.data()['observacoes']
            };
            _lista.add(ModelIdeia.fromMap(_authService, _mapa));
          });
          return _lista;
    });
  }

  Future<void> saveIdeia(ModelIdeia ideia) {
    return ideias
        .add(
        {'email': ideia.email,
          'texto': ideia.texto,
          'fase' : ideia.fase,
          'unEfeito' : ideia.unEfeito,
          'observacoes' : ideia.observacoes
        }
    ).then((value) => print('Ideia gravada'))
        .catchError((error) => print('Falha ao gravar ideia: $error'));
  }

  Future<void> updateIdeia(ModelIdeia ideia) {
    return ideias
        .doc(ideia.Id)
        .update(
          {
            'email': ideia.email,
            'texto': ideia.texto,
            'fase' : ideia.fase,
            'unEfeito' : ideia.unEfeito,
            'observacoes' : ideia.observacoes
          }
        )
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