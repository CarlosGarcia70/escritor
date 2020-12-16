import 'package:escritor/data/models/model_ideia.dart';
import 'package:escritor/home/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {

  HomeController controller = Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Repositório de Ideias'),
          actions: [IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed:controller.authService.logout,
          )],
        ),
        body: Padding (
          padding: EdgeInsets.all(10.0),
          child: GetBuilder<HomeController>(
            builder: (_) {
              return FutureBuilder<List<ModelIdeia>>(
                future: controller.listaIdeias(),
                builder: (context, snapshot) {
                  switch(snapshot.connectionState) {
                    case ConnectionState.none: {
                      print('ConnectionState.none');
                      return Center(
                      child: CircularProgressIndicator()
                      )                      ;
                    }
                    case ConnectionState.waiting:
                      {
                        print('ConnectionState.waiting');
                        return Center(
                            child: CircularProgressIndicator()
                        );
                      }
                    default:
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Falha na obtenção dos dados!')
                        );
                      } else if (snapshot.hasData) {
                        return ListaIdeias(snapshot.data);
                      } else {
                        print('Sem dados');
                        return Container(color: Colors.red);
                      }
                  }
                  }
              );
            },
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incluiIdeia,
          tooltip: 'Incluir nova ideia',
          child: Icon(Icons.wb_incandescent_outlined, size: 35.0,),
        )
    );
  }

  void _incluiIdeia() {
    controller.novaideia();
  }
}

/*
GetBuilder<HomeController>(
init: HomeController(),
builder: (controller) => controller.ideas.isNull ?
Container(child: Text('A lista de ideias está vazia')) :
ListaIdeias(controller.ideas)
)*/
