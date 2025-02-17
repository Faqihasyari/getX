import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_getx/app/modules/home/controllers/auth_controller.dart';
import 'package:first_getx/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final AuthController authC = Get.find<AuthController>();
  final ButtonController controller2 = Get.put(ButtonController());
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text('SIGN IN ANONYMOUSLY'),

            //STATUS
            
              StreamBuilder(stream: FirebaseAuth.instance.userChanges(), builder: (context, snapshot){
                if(snapshot.hasData){
                  return Text('Signed in as ${snapshot.data?.uid}');
                } else {
                  return Text('Signed out');
                }
              }),
            
            SizedBox(
              height: 15,
            ),

            //SIGNIN BUTTON
            SizedBox(
              width: 150,
              child: ElevatedButton(
                    onPressed: (){
                      if(FirebaseAuth.instance.currentUser != null){
                        FirebaseAuth.instance.signOut();
                      } else {
                        FirebaseAuth.instance.signInAnonymously();
                      }
                      
                    }  ,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: controller2.isPressed.value ? Colors.green : Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child:
                        StreamBuilder(stream: FirebaseAuth.instance.userChanges(), builder: (context, snapshot){
                          if(snapshot.hasData){
                            return Text('Sign Out');
                          } else {
                            return Text('Sign In');
                          }
                        })),
              
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.increment();
      }),
    );
  }
}
