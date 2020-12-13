import 'package:escritor/home/home_widgets.dart';
import 'package:escritor/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ideias_controller.dart';

class EditIdeia extends StatelessWidget {

  final controller = Get.put<IdeiasController>(IdeiasController());
  String ideiaId;
  String texto;
  TextEditingController ideia = TextEditingController();

  EditIdeia(String texto, String ideiaId) {
    this.ideiaId = ideiaId;
    this.texto = texto;
    ideia.text = texto;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Qual é a sua ideia?')
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding (
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    controller: ideia,
                    autocorrect: true,
                    maxLines: null,
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                    icon: Icon(Icons.cancel),
                    label: Text('Cancelar'),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  RaisedButton.icon(
                    icon: Icon(Icons.save),
                    label: Text('Salvar'),
                    onPressed: () {
                      controller.updateIdea(ideia.text, ideiaId);
                    }
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton.icon(
                      icon: Icon(Icons.delete_forever),
                      label: Text('Excluir'),
                      onPressed: () {
                        controller.deleteIdea(ideiaId);
                      }
                  ),
                  RaisedButton.icon(
                    icon: Icon(Icons.handyman),
                    label: Text('Trabalhar ideia'),
                    onPressed: () {},
                  )
                ],
              )
            ],
          )
        )
    );
  }


}