import 'package:escritor/data/providers/auth_service.dart';

class ModelIdeia {
  String Id;
  String email;
  String texto;
  int fase;
  String unEfeito;
  String observacoes;

  ModelIdeia(AuthService auth) {
    Id = '';
    email = auth.user.email;
    texto = '';
    fase = 1;
    unEfeito = '';
    observacoes = '';
  }

  ModelIdeia.fromMap(AuthService auth, Map map) {
    Id = map['Id'];
    email = auth.user.email;
    texto = map['texto'];
    fase = map['fase'];
    unEfeito = map['unEfeito'];
    observacoes = map['observacoes'];
  }

  Map toMap() {
    return {
      'Id' : Id,
      'email' : email,
      'texto' : texto,
      'fase' : fase,
      'unEfeito' : unEfeito,
      'observacoes' : observacoes
    };
}

  void setFase(int fase) {
    this.fase = fase;
  }
}