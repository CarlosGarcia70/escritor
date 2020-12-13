import 'package:escritor/login/signin_page.dart';
import 'package:escritor/data/providers/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {

  AuthService controller = Get.find<AuthService>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
                      controller: email
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'senha'),
                    controller: password,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton.icon(
                    icon: Icon(Icons.login),
                    label: Text('Entrar'),
                    onPressed: () {controller.login(email.text, password.text);},
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Ou...'),
                  SizedBox(
                    height: 20.0,
                  ),
                  GoogleSignInButton(
                    text: 'Entrar com sua conta Google',
                    onPressed: () {controller.loginGoogle();},
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Ou ainda...'),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton.icon(
                    icon: Icon(Icons.account_circle),
                    label: Text('Criar uma nova conta'),
                    onPressed: () {
                      Get.to(SignInPage());
                    },
                  )
                ],
              ),
            )
        ),
      )
    );
  }
}