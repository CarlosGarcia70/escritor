import 'package:escritor/data/providers/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {

  AuthService controller = Get.find<AuthService>();

  TextEditingController email = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Novo Usuário'),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                        decoration: InputDecoration(hintText: 'email'),
                        controller: email,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'senha'),
                      controller: password1,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'senha'),
                      controller: password2,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton.icon(
                      icon: Icon(Icons.login),
                      label: Text('Criar conta'),
                      onPressed: () {
                        if (email.text.isEmail) {
                          if (password2.text == password1.text) {
                            controller.createUser(email.text, password2.text);
                          } else {
                            Get.snackbar('Erro de digitação',
                                'as senhas digitadas são diferentes!');
                          }
                        } else {
                          Get.snackbar(
                              'Erro de digitação', 'digite um email válido');
                        }
                      }
                    ),
                  ],
                ),
              )
          ),
        )
    );
  }
}