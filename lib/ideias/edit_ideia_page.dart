import 'package:escritor/data/models/model_ideia.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ideias_controller.dart';

class EditIdeia extends StatelessWidget {

  final controller = Get.put<IdeiasController>(IdeiasController());

  ModelIdeia ideia;
  TextEditingController Txtideia = TextEditingController();
  TextEditingController TxtUnEfeito = TextEditingController();
  TextEditingController TxtObs = TextEditingController();

  EditIdeia(ModelIdeia ideia) {
    this.ideia = ideia;
    Txtideia.text = ideia.texto;
    TxtUnEfeito.text = ideia.unEfeito;
    TxtObs.text = ideia.observacoes;
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
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Descreva em poucas palavras a sua ideia:')
              ),
              Padding (
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    controller: Txtideia,
                    autocorrect: true,
                    maxLines: null,
                    onChanged: (text) {
                      ideia.texto = text;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder()
                    )
                  )
              ),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Descreva em uma palavra qual o principal efeito que você quer causar no seu leitor:')
              ),
              Padding (
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    controller: TxtUnEfeito,
                    autocorrect: true,
                    maxLines: null,
                    onChanged: (text) {
                      ideia.unEfeito = text;
                    },
                      decoration: InputDecoration(
                          border: OutlineInputBorder()
                      )
                  )
              ),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Inclua algumas observações que julgar importantes sobre a história:')
              ),
              Padding (
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    controller: TxtObs,
                    autocorrect: true,
                    maxLines: null,
                    onChanged: (text) {
                      ideia.observacoes = text;
                    },
                      decoration: InputDecoration(
                          border: OutlineInputBorder()
                      )
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
                      ideia.setFase(2);
                      controller.updateIdea(ideia);
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
                        controller.deleteIdeia(ideia.Id);
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