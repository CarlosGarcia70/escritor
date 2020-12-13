import 'package:escritor/login/login_page.dart';
import 'package:escritor/login/signin_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home/home_bindings.dart';
import 'home/home_page.dart';
import 'login/login_bindings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then(
      (_) {
        runApp(GetMaterialApp(
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: () => HomePage(), binding: HomeBinding()),
            GetPage(name: '/login', page: () => LoginPage(), binding: LoginBinding()),
            GetPage(name: '/signgin', page: () => SignInPage(), binding: LoginBinding())
          ],
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          title: 'Repositório de Ideias',
        ));
      }
  );

}






