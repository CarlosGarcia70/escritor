import 'package:escritor/home/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthService extends GetxService {

  FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  GoogleSignIn _googleSignIn = GoogleSignIn();


  @override
  void onInit() {
    super.onInit();
    Firebase.initializeApp().then(
        (_) {
          user = _auth.currentUser;
        }
    );
  }

  void createUser(String email, String password) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then(
              (_) {
                user = _auth.currentUser;
                Get.offAll(HomePage());}
      );
    } catch(e) {
      Get.snackbar('Falha na criação da conta!', e.message, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void login(String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password).then(
              (_) {
                user = _auth.currentUser;
                Get.offAll(HomePage());}
      );
    } catch(e) {
      Get.snackbar('Falha na autenticação', e.message, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void loginGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      await _auth.signInWithCredential(credential);
      user = _auth.currentUser;
      Get.offAll(HomePage());
    } catch (e, s) {
      Get.snackbar('Falha no login com Google!', e.message, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void logout() async {
    try{
      await _auth.signOut().then(
              (_) {
                user = _auth.currentUser;
                Get.offAll(HomePage());}
      );
    } catch(e) {
      Get.snackbar('Falha no logout!', e.message, snackPosition: SnackPosition.BOTTOM);
    }
  }

}
