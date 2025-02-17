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

class ButtonController extends GetxController {
  var isPressed = true.obs;

  void toggleButton(){
    isPressed.value = !isPressed.value;
  }
}

class AuthPressed extends GetxController{
  final FirebaseAuth authpressed = FirebaseAuth.instance;
  var user2 = Rxn<User>();

  @override
  void onPressed(){
    super.onInit();
    user2.bindStream(authpressed.userChanges());
  }

  //Fungsi Login Anonimous
  Future<void> signIn()async{
    try {
      await authpressed.signInAnonymously();
      Get.snackbar("Succes", 'Logged in as Anonymously');
    } catch (e) {
      Get.snackbar("Error", "Login failed: $e");
    }
  }

  //Fungsi Logout
  Future<void> signOut()async{
    try{
      await authpressed.signOut();
      Get.snackbar("Succes", "Logged Out succes");
    } catch (e) {
      Get.snackbar("Error", "Login failed: $e");
    }
  }

  //Fungsi toggle login
  void toggleButton(){
    if (user2.value != null){
      signOut();
    } else {
      signIn();
    }
  }

}