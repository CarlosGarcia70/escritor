import 'package:escritor/data/models/model_ideia.dart';
import 'package:escritor/data/providers/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ideias_controller.dart';

class NewIdeia extends StatelessWidget {

  final controller = Get.put<IdeiasController>(IdeiasController());
  final auth = Get.find<AuthService>();

  TextEditingController texto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Qual é a sua ideia?')
        ),
        body: Padding (
            padding: EdgeInsets.all(10.0),
            child: TextField(
              keyboardType: TextInputType.multiline,
              controller: texto,
              autocorrect: true,
              maxLines: null,
            )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _salvar,
          tooltip: 'Salvar ideia',
          child: Icon(Icons.save_alt, size: 35.0,),
        )
    );
  }

  void _salvar() {
    ModelIdeia ideia = ModelIdeia(auth);
    ideia.fase = 1;
    ideia.texto = texto.text;
    controller.saveIdeia(ideia);
  }
}