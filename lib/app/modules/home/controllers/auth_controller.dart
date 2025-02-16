import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User> user =Rxn<User>();

  @override
  void onInit(){
    user.bindStream(_auth.authStateChanges());
    super.onInit();
  }
}