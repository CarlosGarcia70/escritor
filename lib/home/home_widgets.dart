import 'package:escritor/ideias/edit_ideia_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'home_controller.dart';
import 'package:get/get.dart';

Widget ListaIdeias(List<Map> lista) {

  final controller = Get.find<HomeController>();

  return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: lista.length,
      itemBuilder: (BuildContext context, int index) =>
      new Card(
        color: Colors.lime,
        child: InkWell(
          splashColor: Colors.lime[900],
          onTap: () {
            Get.to(EditIdeia(lista[index]['texto'], lista[index]['Id']));
          },
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('${lista[index]['texto']}')
          ),
        )
      ),
      staggeredTileBuilder: (int index) =>
      new StaggeredTile.fit(2),
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
    );
  }


