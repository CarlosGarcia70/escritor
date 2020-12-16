import 'package:escritor/data/models/model_ideia.dart';
import 'package:escritor/ideias/edit_ideia_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget ListaIdeias(List<ModelIdeia> lista) {

  return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: lista.length,
      itemBuilder: (BuildContext context, int index) {
        Color cor1 = Colors.lime;
        Color cor2 = Colors.lime[900];
        if(lista[index].fase == 1) {
          cor1 = Colors.lime;
          cor2 = Colors.lime[900];
        } else if (lista[index].fase == 2) {
          cor1 = Colors.amber;
          cor2 = Colors.amber[900];
        } else if (lista[index].fase == 3) {
          cor1 = Colors.green;
          cor2 = Colors.green[900];
        }
        return Card(
            color: cor1,
            child: InkWell(
              splashColor: cor2,
              onTap: () {
                Get.to(EditIdeia(lista[index]));
              },
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('${lista[index].texto}')
              ),
            )
        );
      },
      staggeredTileBuilder: (int index) =>
      new StaggeredTile.fit(2),
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
    );
  }


